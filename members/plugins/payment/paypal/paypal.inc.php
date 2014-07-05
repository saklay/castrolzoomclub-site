<?
/*
*
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: The installation file
*    FileName $RCSfile: paypal.inc.php,v $
*    Release: 0.9 ($Revision: 1.8 $)
*
* Please direct bug reports,suggestions or feedback to the cgi-central forums.
* http://www.cgi-central.net/forum/
*                                                                          
* aMember is free for both commercial and non-commercial use providing that the
* copyright headers remain intact and the links remain on the html pages.
* Re-distribution of this script without prior consent is strictly prohibited.
*
*/

add_paysystem_to_list(
array(
            'paysys_id' => 'paypal',
            'title'     => 'PayPal',
            'description' => 'See <a href="http://www.paypal.com" target=_blank>www.paypal.com</a> for description',
            'public'    => 1
        )
);

class payment_paypal extends payment {
    function do_payment($payment_id, $member_id, $product_id,
            $price, $begin_date, $expire_date, &$vars){

        global $config;
        $product = & get_product($product_id);
        
        $vars = array(
            'cmd'         => '_xclick',
            'business'    => $this->config['business'],
            'return'      => 
               urlencode(sprintf("%s/thanks.php?member_id=%d&product_id=%d",
                $config['root_url'],
                $member_id, $product_id)),
            'notify_url'  => urlencode($config['root_url'].
                             "/plugins/payment/paypal/ipn.php"),
            'item_name'   => urlencode($product->config['title']),
            'item_number' => $product_id,
            'no_shipping' => 1,
            'cancel_return' => urlencode($config['root_url']."/cancel.php"),
            'no_note'     => 1,
            'bn'          => 'CgiCentral.aMemberFree',
            'amount'      => sprintf('%.2f', $price),
            'custom'      => $member_id,
            'invoice'     => $payment_id
        );
        $vars1 = array();
        foreach ($vars as $kk=>$vv){
            $v = urlencode($vv);
            $k = urlencode($kk);
            $vars1[] = "$kk=$vv";
        }
        $vars = join('&', $vars1);
        header("Location: https://www.paypal.com/cgi-bin/webscr?$vars");
        exit();
    }
}

?>