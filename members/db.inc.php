<?
/**
* Database base class
* should be parent class for all database plugins
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: Database base class
*    FileName $RCSfile: db.inc.php,v $
*    Release: 1.8.5 ($Revision: 1.12 $)
*
* Please direct bug reports,suggestions or feedback to the cgi-central forums.
* http://www.cgi-central.net/forum/
*                                                                          
* aMember is free for both commercial and non-commercial use providing that the
* copyright headers remain intact and the links remain on the html pages.
* Re-distribution of this script without prior consent is strictly prohibited.
*                                                                                 
*/


class db {
    /**
    * Db Plugin config stored in this variable
    * 
    *
    * BEWARE! This class not have strict inteface yet. So use 
    * db/mysql plugin as source to create new database plugins!
    *
    */
    var $config;

    /**
    * Constructor
    * Should connect to database, etc. in childrens
    */
    function db(& $config){
        $this->config = $config;
    }

    /**
    * Get product by their ID
    * should return array with at least keys:
    *  - product_id integer
    *  - title 
    *  - description
    *  - price
    *  - expire days
    *  @param integer Product ID to retrieve
    *  @return array Product Data
    */
    function get_product($product_id){
        fatal_error("get_product not implemented");
    }

    /**
    * Get products list
    * should return array of arrays with at least keys:
    *  - product_id integer
    *  - title 
    *  - description
    *  - price
    *  @return array Product Data
    */
    function get_products_list(){
        fatal_error("get_products_list not implemented");
    }

    /**
    * Check if login is unique in database
    * @param string $login user login
    * @return bool true if login unique, false if not
    */
    function check_uniq_login($login){
        fatal_error("check_uniq_login not implemented");
    }

    /**
    * Add pending user to database
    * Database plugin may use different databases to pending and 
    * active users
    * Should call fatal_error is something wrong
    * @param array $vars User submitted variables
    * @return integer 
    */
    function add_pending_user(&$vars){
        fatal_error("add_pending_user not implemented");
    }

    /**
    * Get all users list from database
    * @param string $letter First letter of login, if empty - list all
    * @param integer $active ( 0 - any , 1 - active, -1 - pending)
    * @return array of assocs with users data
    */
    function get_users_list($pattern='%', $active=0, $product_id=0){
        fatal_error("get_users_list not implemented");
    }

    /**
    * Add waiting payment before redirect user to payment system
    * @param integer $member_id As returned from add_pending_user
    * @param integer $product_id What we sell
    * @param string  $paysys_id Payment system Id
    * @param double  $price How much product cost at moment of sale
    * @param string  $begin_date Date of begin subscription in format yyyy-mm-dd
    * @param string  $expire_date Date of end subscription in format yyyy-mm-dd
    * @param array   $vars User submitted variables to store add. info
    * @return integer Payment ID
    */
    function add_waiting_payment($member_id, $product_id, $paysys_id, 
            $price, $begin_date, $expire_date, &$vars){
        fatal_error("add_waiting_payment not implemented");
    }

    /**
    * Finish waiting payment, make subscription and user active from begin_date
    * Must! call plugin_finish_waiting_payment(intval($payment_id)) !
    *
    * @param integer $payment_id As returned from add_waiting_payment
    * @param string  $paysys_id Payment System Id
    * @param integer $receipt_id Payment system Transaction ID
    * @param double  $price How much paid (if string='' then script should not use it in check. Most P.S. not return amount)
    * @param array   $vars P.S. submitted variables to store add. info about payment
    * @return string Empty string if ok / Error message with error description
    */
    function finish_waiting_payment($payment_id, $paysys_id, $receipt_id, $price='', &$vars){
        fatal_error("finish_waiting_payment not implemented");
    }
                                                                                                                                
    /**
    * Escape string to safely save it into database
    * @param string  $s String to escape
    * @return string Escaped string
    */
    function escape($s){    
        // SHOULD be redefined!
        return $s;
    }

    /**
    * Escape array using $this->escape
    * @param array $arr Array to escape (not changed)
    * @return array Escaped array
    */
    function escape_array(&$arr){
        if (!is_array($arr)) return array();
        $v = array();
        foreach ($arr as $k=>$vv)
            $v[$k] = $this->escape($vv);
        return $v;
    }

    /**
    * Encode assoc array to packed string
    * @param array $data Data to encode
    * @return string Encoded string with data
    */
    function encode_data(& $data){
        return serialize((array)$data);
    }
    /**
    * Decode assoc array from packed string
    * @param string $data String encoded with $this->encode_data
    * @return array Encoded data
    */
    function decode_data(& $data){
        return (array)unserialize($data);
    }

}

?>