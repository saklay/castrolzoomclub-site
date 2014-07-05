<?
#############2CheckOut Plugin for aMember Free##############
/************************************************************
*     Author: James Mitchell
*    Company: Auseasy Internet Services
*      Email: reductor@aismail.com
*
* Re-distribution without prior consent is prohibited.
*
*************************************************************
*
* Redistributed with permission from author. alex@cgi-central.net
*
*/

add_paysystem_to_list(
array(
            'paysys_id' => 'twocheckout',
            'title'     => '2CheckOut',
            'description' => 'See <a href="http://www.2checkout.com" target=_blank>www.2checkout.com</a> for description',
            'public'    => 1
        )
);

class payment_twocheckout extends payment {
    function do_payment($payment_id, $member_id, $product_id,
            $price, $begin_date, $expire_date, &$vars){

        global $config;
        global $db;
        $product = & get_product($product_id);

        $u = & $db->get_user(intval($member_id));

        $vars = array(
            'x_login'         => $this->config[seller_id],
            'x_amount'        => $price,
            'x_invoice_num' => $payment_id,
            'demo'        => $this->config[demo],
            'x_Ship_To_First_Name' => $u['name_f'],
            'x_Ship_To_Last_Name' => $u['name_l'],
            'x_Ship_To_Address' => $u['street'],
            'x_Ship_To_City' => $u['city'],
            'x_Ship_To_State' => $u['state'],
            'x_Ship_To_Zip' => $u['zip'],
            'x_Ship_To_Country' => $u['country'],
            'x_Receipt_Link_URL' => urlencode($config['root_url']."/plugins/payment/twocheckout/thanks.php"),
        );

        $vars1 = array();
        foreach ($vars as $kk=>$vv){
            $v = urlencode($vv);
            $k = urlencode($kk);
            $vars1[] = "$kk=$vv";
        }
        $vars = join('&', $vars1);
        header("Location: https://www.2checkout.com/cgi-bin/Abuyers/purchase.2c?".$vars);
        exit();
    }
    function validate_thanks(&$vars){
        if(intval($vars['x_trans_id'])==0&&$this->config[demo]!="Y")
                return "Tried to use demo mode, but demo mode not enabled";
        if(intval($vars['x_response_code'])!=1)
            return "Invalid Responce code, please contact the webmaster";
        if(floor($vars['x_amount'])==$vars['x_amount'])
            $vars['x_amount']=floor($vars['x_amount']); 
        if(strtoupper(md5($this->config[secret].$this->config[seller_id].$vars['x_trans_id'].$vars['x_amount']))!=$vars['x_MD5_Hash'])
            return "Unable to validate that you have paid, please contact the webmaster";
        return '';
    }
    function process_thanks(&$vars){
            global $db;
            $err = $db->finish_waiting_payment(intval($vars['x_invoice_num']), 
                    'twocheckout', $vars['x_trans_id'],$vars['x_amount'], $vars);
            if ($err) 
                return "finish_waiting_payment error: $err";
    }
}
?>