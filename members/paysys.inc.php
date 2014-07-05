<?
/**
* Defines payment base class and additional functions
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: Payment System Handling Functions
*    FileName $RCSfile: paysys.inc.php,v $
*    Release: 1.8.5 ($Revision: 1.9 $)
*
* Please direct bug reports,suggestions or feedback to the cgi-central forums.
* http://www.cgi-central.net/forum/
*                                                                          
* aMember is free for both commercial and non-commercial use providing that the
* copyright headers remain intact and the links remain on the html pages.
* Re-distribution of this script without prior consent is strictly prohibited.
*                                                                                 
*/

global $__paysystems_list;
$__paysystems_list = array();

/**
* Defines base for payment system plugins
*
*/
class payment {
    /**
    * Plugin config array
    */
    var $config = array();
    
    /**
    * Constructor
    * @param array $config contain plugin config
    */
    function payment($config){
        $this->config = $config;
    }

    /**
    * Redirect to payment system or make other action for payment
    * @param integer $payment_id  Payment ID
    * @param integer $member_id   Pending or Active Member ID
    * @param integer $product_id  Product ID
    * @param double  $price       Current Price
    * @param string  $begin_date  Begin Subscription
    * @param string  $expire_date End Subscription
    * @param array   $vars        User-submitted Variables
    * @return string This function should call exit()!
    */
    function do_payment($payment_id, $member_id, $product_id,
            $price, $begin_date, $expire_date, &$vars){
        fatal_error("do_payment not implemented");
    }

    /**
    * Validate variables from thanks page
    * If payment system submit it only to thanks page and give the way
    * to check it
    * @param array $vars Payment-System submitted variables
    * @return string Empty if all ok / Error message if any
    */
    function validate_thanks(&$vars){
        return '';
    }

    /**
    * If {@link validate_thanks} return true, this function called
    * Most common usage for this is call db->finish_waiting_payment
    * with correct parameters to save payment status
    * @param array $vars Payment-System submitted variables
    * @return string Empty if all ok / Error message if any
    */
    function process_thanks(&$vars){
        return '';
    }
}

/**
* Get paysystems plugins list
* Return array of arrays with at least:
*   - paysys_id
*   - title
*   - description
*   - public
* @return array array of assoc arrays
*/
function get_paysystems_list(){
    global $__paysystems_list;
    return $__paysystems_list;
}

function add_paysystem_to_list($desc){
    global $__paysystems_list;
    $__paysystems_list[$desc['paysys_id']] = $desc;
}

function get_paysystem($paysys_id){
    global $__paysystems_list;
    return $__paysystems_list[$paysys_id];
}

add_paysystem_to_list(array(
            'paysys_id' => 'manual',
            'title'     => 'Manual Payment',
            'description' => 'Payment Entered by Admin',
            'public'    => 0
        )
);
?>