<?
/*
*
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: The installation file
*    FileName $RCSfile: ipn.php,v $
*    Release: 0.9 ($Revision: 1.7 $)
*
* Please direct bug reports,suggestions or feedback to the cgi-central forums.
* http://www.cgi-central.net/forum/
*                                                                          
* aMember is free for both commercial and non-commercial use providing that the
* copyright headers remain intact and the links remain on the html pages.
* Re-distribution of this script without prior consent is strictly prohibited.
*
*/

include "../../../config.inc.php";

$paypal_debug = false; // must be defined here! (false or true)
$this_config = $plugin_config['payment']['paypal'];

function get_dump($var){
//dump of array
    $s = "";
    foreach ($var as $k=>$v)
        $s .= "$k => $v<br>\n";
    return $s;
}

function paypal_error($msg){
    global $txn_id, $invoice;
    global $vars;
    fatal_error("PAYPAL ERROR: $msg (Details: txn_id:'$txn_id', invoice:'$invoice')<br>\n".get_dump($vars));
}

// read post from PayPal system and add 'cmd'
$vars = $paypal_debug ? $HTTP_GET_VARS : $HTTP_POST_VARS;
$req = 'cmd=_notify-validate';
foreach ($vars as $k => $v) {
    if (get_magic_quotes_gpc()) 
        $vars[$k] = $v = stripslashes($v);
    $req .= "&" . urlencode($k) . "=" . urlencode ($v);
}


// assign posted variables to local variables
// note: additional IPN variables also available -- see IPN documentation
$item_name      = $vars['item_name'];
$receiver_email = $vars['receiver_email'];
$item_number    = $vars['item_number'];
$invoice        = $vars['invoice'];
$payment_status = $vars['payment_status'];
$payment_gross  = $vars['payment_gross'];
$txn_id         = $vars['txn_id'];
$payer_email    = $vars['payer_email'];

$db->log_error("PAYPAL DEBUG<br>\n".get_dump($vars));

// post back to PayPal system to validate
$header .= "POST /cgi-bin/webscr HTTP/1.0\r\n";
$header .= "Content-Type: application/x-www-form-urlencoded\r\n";
$header .= "Content-Length: " . strlen ($req) . "\r\n\r\n";
if (!$paypal_debug)
    $fp = fsockopen ("www.paypal.com", 80, $errno, $errstr, 30);
else
    $fp = fopen('test.txt', 'r');

if (!$fp) {
    // HTTP ERROR
    paypal_error("FOPEN www.paypal.com $errstr ($errno)");
} else {
    fputs ($fp, $header . $req);
    $res = '';
    while (!feof($fp)) {
        $res .= fgets ($fp, 1024);
    }
    fclose ($fp);

    if (preg_match('/^VERIFIED/m', $res) != false) {
        // * check that txn_id has not been previously processed
        // not needed because we check invoice

        // check that receiver_email is an email address 
        // in your PayPal account
        if ($receiver_email != $this_config['business']) 
            paypal_error(
            "Payment receiver is '$receiver_email' instead of my business: '".
                    $this_config['business'] . "'");
        if ($payment_status != 'Completed')
            paypal_error("Payment is not completed, status: '$payment_status'");
        // process payment
        $err = $db->finish_waiting_payment($invoice, 'paypal', 
                $txn_id, $payment_gross, $vars);
        if ($err) 
            paypal_error("finish_waiting_payment error: $err");
        if ($paypal_debug){
            print "Payment processed ok.";
        }
    } else if (preg_match('/^INVALID/m', $res) != false) {
        // log for manual investigation
        paypal_error("INVALID answer from PayPal server. Possible hack attempt");
    }
}

?>