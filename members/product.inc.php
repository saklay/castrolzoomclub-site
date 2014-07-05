<?
/*
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: Product class and functions
*    FileName $RCSfile: product.inc.php,v $
*    Release: 1.8.5 ($Revision: 1.17 $)
*
* Please direct bug reports,suggestions or feedback to the cgi-central forums.
* http://www.cgi-central.net/forum/
*                                                                          
* aMember is free for both commercial and non-commercial use providing that the
* copyright headers remain intact and the links remain on the html pages.
* Re-distribution of this script without prior consent is strictly prohibited.
*                                                                                 
*/

$product_fields = array(
    array(
        'name'         => 'product_id',
        'title'        => 'Product #',
        'type'         => 'text'
    ),
    array(
        'name'         => 'title',
        'title'        => 'Title',
        'type'         => 'text'
    ),
    array(
        'name'         => 'description',
        'title'        => 'Description',
        'type'         => 'text'
    ),
    array(
        'name'         => 'price',
        'title'        => 'Price',
        'type'         => 'money'
    )
);

$product_additional_fields = array(
    array(
        'name'         => 'expire_days',
        'title'        => 'Duration',
        'type'         => 'period',
        'description'  => "can be:<br> - count of days (10, 35)<br>- count 
            of calendar months (2m)<br>- count of calendar years (1y)",
        'validate_func'=> 'validate_period'
    )
);

function add_product_field(
        $name, $title, $type, 
        $description='', 
        $validate_func='', 
        $additional_fields=NULL){
    settype($additional_fields, 'array');
    global $product_additional_fields;
    foreach ($product_additional_fields as $k=>$v){
        if ($v['name'] == $name) {
            if ($v['validate_func'] && 
                ($v['validate_func'] != $validate_func)){
                $product_additional_fields[$k]['validate_func'] = 
                        (array)$v['validate_func'];
                $product_additional_fields[$k]['validate_func'][] = 
                    $validate_func;
            }
            return;
        }
    }    
    $product_additional_fields[] = array_merge(
        $additional_fields, 
        array(
            'name'          => $name,
            'title'         => $title,
            'type'          => $type,
            'description'   => $description,
            'validate_func' => $validate_func
        )
   );
}

add_product_field('url', 
    'Product URL', 
    'text', 
    'Please enter URL,<br>relative to Site root<br>ex.: <i>/mydir/protected_dir1/</i>', 
    'validate_product_url');


class product {
    // should contain keys: 
    // product_id, title, description, price
    // expire_days, resources (list)
    var $config; 
    function product($config){
        $this->config = $config;
    }
    function get_price(){
        return round($this->config['price'], 2);
    }
    function get_expire($begin_date, $field='expire_days'){
        list($y,$m,$d) = split('-', $begin_date);
        $days = $this->config[$field];
        $tm = mktime(0,0,0, $m, $d, $y);
        //handle period (as 1m = 1 months, 2y = 2 years)
        if (preg_match('/^(\d+)(d|w|m|y)$/', $days, $regs)) {
            $count = $regs[1];
            $period = $regs[2];
            if ($period == 'm'){
                $tm = mktime(0,0,0, $m + $count, $d, $y);
            } elseif ($period == 'd'){
                $tm = mktime(0,0,0, $m, $d+$count, $y);
            } elseif ($period == 'w'){
                $tm = mktime(0,0,0, $m, $d+($count*7), $y);
            } elseif ($period == 'y'){
                $tm = mktime(0,0,0, $m, $d, $y + $count);
            } elseif ($period == 'w'){
                $tm = mktime(0,0,0, $m, $d + ($count * 7), $y);
            } else {
                fatal_error("Unknown period unit in $field. Should be m|y");
            }
        } elseif (preg_match('/^\d+$/', $days)) 
            $tm = mktime(0,0,0, $m, $d + $days, $y);
        else 
            fatal_error("Incorrect value for $field in product #".
                $this->config['product_id']);
        return date('Y-m-d', $tm);
    }

    function get_resources(){
        return $this->config[resources];
    }
}

function get_product($product_id){
    $db = &instantiate_db();
    $conf = $db->get_product($product_id); //return database record for product
    return new product($conf);
}

////////////////////// validate functions //////////////////////////////
function validate_period(&$p, $field){
    $p->get_expire(date('Y-m-d'), $field);
    // unfortunately, get_expire raise fatal_error 
    // so we can't return string from this function
    // but we SHOULD!
}

function validate_product_url(&$p, $field){
    $url = $p->config['url'];
    if (!strlen($url)) return;
    if (preg_match('/^[^\/]/', $url) && !preg_match('/^http:\/\//', $url))
        return "Url isn't relative to site root. Just point your 
        browser to protected directory and copy & paste URL from URL window";
    $uri = parse_url($url);
    $p->config['url'] = 
            $uri['path'] . 
            ($uri['query'] ? ('?'.$uri['query']) : '') .
            ($uri['fragment'] ? ('#'.$uri['fragment']):'');
    return;
}

?>
