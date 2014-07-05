<?
/*
*
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: The installation file
*    FileName $RCSfile: free.inc.php,v $
*    Release: 0.9 ($Revision: 1.5 $)
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
            'paysys_id' => 'free',
            'title'     => 'Free Signup',
            'description' => 'Totally free',
            'public'    => 1
        )
);

// need to configure products in clickbank and set thanks page to ./thanks.php
class payment_free extends payment {
    function do_payment($payment_id, $member_id, $product_id,
            $price, $begin_date, $expire_date, &$vars){
        global $config;
        if ($price > 0) {
             return "Cannot use FREE payment plugin with the product which cost more than 0.0";
        }
        $vcode = md5($payment_id . $begin_date . $member_id);
        header("Location: ".$config['root_url']."/plugins/payment/free/thanks.php?payment_id=$payment_id&vcode=$vcode");
        exit();
    }

    function validate_thanks(&$vars){
        return '';
    }

    function signup_moderator_mail($payment_id, $member_id, &$vars){
        global $config, $db;
        $admin_url = $config['root_url'] . '/admin';
        mail($config['admin_email'], "*** New Signup ***", "
        New user was signed up today. 
        Please login and check it:
        $admin_url/users.php?action=edit_payment&payment_id=$payment_id&member_id=$member_id
        ");
    }

    function process_thanks(&$vars){
            global $db, $config;
            global $HTTP_SERVER_VARS;
            $REMOTE_ADDR = $HTTP_SERVER_VARS['REMOTE_ADDR'];
            $payment_id = $vars['payment_id'];
            $payment    = $db->get_payment($payment_id);
            $member_id  = $payment['member_id'];
            $begin_date = $payment['begin_date'];
            if ($vars['vcode'] != md5($payment_id . $begin_date . $member_id))
                fatal_error("Verification code incorrect. Please contact site admin if it wrong.");
            if ($payment['receipt_id']) {
                $root_url = $config['root_url'];
                fatal_error(
                $this->config['admin_approval'] ?               
                "Mail already sent to admin. Please wait for their approval." :
                "You are already signed up. Please <a href='$root_url/member.php'>login</a> here"
                );
            }
            if ($this->config['mail_admin'])
                $this->signup_moderator_mail($payment_id, $member_id, $vars);
            if ($this->config['admin_approval']) {
                $new_payment = $payment;
                $new_payment['receipt_id'] = $REMOTE_ADDR;
                $db->update_payment($payment_id, $new_payment);
            } else {
                $err = $db->finish_waiting_payment(intval($vars['payment_id']), 
                    'free', $REMOTE_ADDR, '',
                     $vars);
            }
            if ($err) 
                return "finish_waiting_payment error: $err";
    }
}

?>