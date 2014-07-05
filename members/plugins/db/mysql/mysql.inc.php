<?

/**
* MySQL database plugin
* implements class db
*
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: The installation file
*    FileName $RCSfile: mysql.inc.php,v $
*    Release: 0.9 ($Revision: 1.36 $)
*
* Please direct bug reports,suggestions or feedback to the cgi-central forums.
* http://www.cgi-central.net/forum/
*                                                                          
* aMember is free for both commercial and non-commercial use providing that the
* copyright headers remain intact and the links remain on the html pages.
* Re-distribution of this script without prior consent is strictly prohibited.
*
*
*/

class db_mysql extends db {
    function db_mysql(& $config){
        $this->db( $config);
        if (!@mysql_pconnect(
            $this->config['host'], 
            $this->config['user'], 
            $this->config['pass']
        )) fatal_error("Cannot connect to MySQL: " . mysql_error());
        if (!@mysql_select_db($this->config['db']))
           fatal_error("Cannot select MySQL db");
    }

    //////////////////// USERS FUNCTIONS /////////////////////////////////

    function add_pending_user(&$vars){
        global $HTTP_SERVER_VARS;
        $REMOTE_ADDR = $HTTP_SERVER_VARS['REMOTE_ADDR'];
        global $member_additional_fields;
        $data = array();
        foreach ((array)$member_additional_fields as $field){
            $k = $field['name'];
            if (isset($vars[$k]))
                $data[$k] = $vars[$k];
        }
        $data = & $this->encode_data($data);
        $data = $this->escape($data);

        $v = & $this->escape_array($vars);
        $this->query($s="INSERT INTO {$this->config['prefix']}members 
        (login, pass, email, name_f, name_l, 
         street, city, state, zip, country,
         is_male, added, remote_addr, data
        )
        VALUES
        ('$v[login]', '$v[pass0]','$v[email]', '$v[name_f]', '$v[name_l]',
         '$v[street]','$v[city]', '$v[state]', '$v[zip]',   '$v[country]',
         '$v[is_male]', NOW(), '$REMOTE_ADDR', '$data'
        )
        ");
        plugin_update_users($member_id);
        return mysql_insert_id();
    }

    function check_uniq_login($login){
        $login = $this->escape($login);
        $q = $this->query($s = "SELECT * 
            FROM {$this->config['prefix']}members 
            WHERE login='$login'
        ");
        return !mysql_num_rows($q);
    }

    function clear_incomplete_users($date){
        $date = $this->escape($date);
        $q = $this->query($s = "SELECT 
                m.member_id, 
                COUNT(p.payment_id) AS pc
            FROM {$this->config['prefix']}members m LEFT JOIN {$this->config['prefix']}payments p ON 
                (p.member_id = m.member_id AND p.completed > 0)
            WHERE added < '$date'
            GROUP BY m.member_id
            HAVING pc = 0
        ");
        $list = array(0);
        while (list($member_id, $c) = mysql_fetch_row($q))
            $list[] = $member_id;
        $list = join(',', $list);
        $this->query("DELETE FROM {$this->config['prefix']}payments WHERE member_id IN ($list)");
        $this->query("DELETE FROM {$this->config['prefix']}members WHERE member_id IN ($list)");
        plugin_update_users();
    }

    function get_users_list($pattern='%', $active=0, $product_id=0){
        $where = $having = "";
        if ($pattern) 
            $where = " AND u.login LIKE '" . $this->escape($pattern) . "' ";
        if ($active > 0) {
            $having = " AND count_of_completed > 0 ";
        } elseif ($active < 0) {
            $having = " AND count_of_completed = 0 ";
        }
        $q = $this->query($s = "SELECT u.*, 
            SUM(if(p.completed, 1, 0)) AS count_of_completed,
            SUM(if(p.completed, p.amount,0)) as summa_of_completed
            FROM {$this->config['prefix']}members u LEFT JOIN {$this->config['prefix']}payments p ON (p.member_id=u.member_id)
            WHERE 1 $where
            GROUP BY u.member_id
            HAVING 1 $having
            ORDER BY u.login
        ");
        $rows = array();
        while ($r = mysql_fetch_assoc($q)){
            if ($r['data']) 
                $r['data'] = $this->decode_data($r['data']);
            $rows[] = $r;
        }
        return $rows;
    }

    function get_user($member_id){
        settype($member_id, 'integer');
        $q = $this->query($s = "SELECT u.*
            FROM {$this->config['prefix']}members u 
            WHERE u.member_id = $member_id
        ");
        if (! $r = mysql_fetch_assoc($q)){
            fatal_error("User not found: #$member_id");
        }
        if ($r['data']) 
            $r['data'] = $this->decode_data($r['data']);
        return $r;
    }

    function update_user($member_id, &$v){
        settype($member_id, 'integer');
        if (!$member_id) return "member_id empty or 0";
        global $member_additional_fields;
        $q = $this->query("SELECT data 
        FROM {$this->config['prefix']}members
        WHERE member_id=$member_id");
        list($data) = mysql_fetch_row($q);
        if ($data)
            $data = $this->decode_data($data);
        settype($data, 'array');
        foreach ((array)$member_additional_fields as $field){
            $k = $field['name'];
            if (isset($v['data'][$k]))
                $data[$k] = $v['data'][$k];
        }
        $data = & $this->encode_data($data);
        $data = $this->escape($data);

        $vals = $this->escape_array($v);
        $fields_to_update = array(
            'login',  'pass',   'email',
            'name_f',  'name_l',
            'street', 'city', 'state',
            'zip', 'country', 'is_male'
        );
        foreach ($fields_to_update as $k){
            $update_statement .= "$k = '" . $vals[$k] . "', ";
        }
        $update_statement .= " data='$data', member_id=member_id";
        $q = $this->query($s = "UPDATE 
        {$this->config['prefix']}members
        SET  $update_statement
        WHERE member_id=$member_id
        ");
        plugin_update_users();
        return '';
    }

    function delete_user($member_id){
        settype($member_id, 'integer');
        if (!$member_id) fatal_error("member_id empty or 0");
        $this->query("DELETE FROM {$this->config['prefix']}members WHERE member_id=$member_id");
        $this->query("DELETE FROM {$this->config['prefix']}access_log WHERE member_id=$member_id");
        $this->query("DELETE FROM {$this->config['prefix']}payments WHERE member_id=$member_id");
        plugin_update_users($member_id);
        return '';
    }

    function users_find_by_string($q, $q_where, $exact=0){   
        $q = $this->escape($q);
        switch ($q_where){
            case 'login': 
                if ($exact)
                    $where_exp = " AND u.login LIKE '$q'";
                else
                    $where_exp = " AND u.login LIKE '%$q%'";
                break;
            case 'name': 
                if ($exact)
                    $where_exp = 
                    " AND (u.name_f LIKE '$q' OR name_l LIKE '$q')";
                else
                    $where_exp = 
                    " AND (u.name_f LIKE '%$q%' OR name_l LIKE '%$q%')";
                break;
            case 'email': 
                if ($exact)
                    $where_exp = " AND (u.email LIKE '$q')";
                else
                    $where_exp = " AND (u.email LIKE '%$q%')";
                break;
            default: $where_exp = " AND 
                (u.login LIKE '%$q%') OR
                (u.name_f LIKE '%$q%') OR
                (u.name_l LIKE '%$q%') OR
                (u.email LIKE '%$q%') OR
                (u.street LIKE '%$q%') OR
                (u.city LIKE '%$q%') OR
                (u.state LIKE '%$q%') OR
                (u.zip LIKE '%$q%') OR
                (u.country LIKE '%$q%') OR
                (u.remote_addr LIKE '%$q%')
                 ";
        }
        $q = $this->query($s = "SELECT u.*, 
            SUM(if(p.completed, 1, 0)) AS count_of_completed,
            SUM(if(p.completed, p.amount,0)) as summa_of_completed
            FROM {$this->config['prefix']}members u 
                LEFT JOIN {$this->config['prefix']}payments p 
                    ON (p.member_id=u.member_id)
            WHERE 1 $where_exp
            GROUP BY u.member_id
            ORDER BY u.login
        ");
        $rows = array();
        while ($r = mysql_fetch_assoc($q)){
            if ($r['data']) 
                $r['data'] = $this->decode_data($r['data']);
            $rows[] = $r;
        }
        return $rows;
    }

    function users_find_by_product($product_id, $include_expired){   
        settype($product_id, 'integer');
        settype($include_expired, 'integer');

        $where_exp = ($include_expired) ? '' : ' AND p.expire_date >= NOW() ';
        $q = $this->query($s = "SELECT u.*, 
            SUM(if(p.completed, 1, 0)) AS count_of_completed,
            SUM(if(p.completed, p.amount,0)) as summa_of_completed
            FROM {$this->config['prefix']}members u 
                LEFT JOIN {$this->config['prefix']}payments p 
                ON (p.member_id=u.member_id)
            WHERE p.completed > 0 AND p.product_id=$product_id $where_exp
            GROUP BY u.member_id
            ORDER BY u.login
        ");
        $rows = array();
        while ($r = mysql_fetch_assoc($q)){
            if ($r['data']) 
                $r['data'] = $this->decode_data($r['data']);
            $rows[] = $r;
        }
        return $rows;
    }

    function users_find_by_date($date, $search_type){   
        $date        = $this->escape($date);
        $search_type = $this->escape($search_type);

        switch ($search_type){
            case 'begin_date_before': 
                $where_exp = " p.begin_date < '$date'"; 
                break;
            case 'begin_date': 
                $where_exp = " p.begin_date = '$date'"; 
                break;
            case 'begin_date_after': 
                $where_exp = " p.begin_date > '$date'"; 
                break;
            case 'expire_date_before': 
                $where_exp = " p.expire_date < '$date'"; 
                break;
            case 'expire_date': 
                $where_exp = " p.expire_date = '$date'"; 
                break;
            case 'expire_date_after': 
                $where_exp = " p.expire_date > '$date'"; 
                break;
            default: fatal_error("Unknown search type");
        }        

        $q = $this->query($s = "SELECT u.*, 
            SUM(if(p.completed, 1, 0)) AS count_of_completed,
            SUM(if(p.completed, p.amount,0)) as summa_of_completed
            FROM {$this->config['prefix']}members u 
                LEFT JOIN {$this->config['prefix']}payments p 
                ON (p.member_id=u.member_id)
            WHERE p.completed > 0 AND $where_exp
            GROUP BY u.member_id
            ORDER BY u.login
        ");
        $rows = array();
        while ($r = mysql_fetch_assoc($q)){
            if ($r['data']) 
                $r['data'] = $this->decode_data($r['data']);
            $rows[] = $r;
        }
        return $rows;
    }

    function get_allowed_users(){
        $q = mysql_query("SELECT
            p.product_id, m.login, m.pass
            FROM {$this->config['prefix']}payments p 
                LEFT JOIN {$this->config['prefix']}members m USING (member_id)
            WHERE p.begin_date <= now() AND p.expire_date >= now() 
                AND p.completed > 0
        ");
        $res = array();
        while (list($product_id, $l, $p) = mysql_fetch_row($q))
            $res[$product_id][$l] = $p;
        return $res;
    }

    function check_login($login, $pass, &$member_id){
        $login = $this->escape($login);
        $pass  = $this->escape($pass);
        $q = $this->query("SELECT pass='$pass',member_id 
        FROM {$this->config['prefix']}members WHERE login='$login'");
        $member_id = 0;
        list($r, $member_id) = mysql_fetch_row($q);
        return ($r > 0);
    }

    function check_access($login, $product_ids){
        $product_ids[] = -999999; // to avoid sql error with empty list
        $login = $this->escape($login);
        $product_ids  = join(',', $this->escape_array($product_ids));
        $q = $this->query("SELECT COUNT(*) 
            FROM {$this->config['prefix']}payments p 
                LEFT JOIN {$this->config['prefix']}members m USING (member_id) 
            WHERE m.login='$login'
                AND p.begin_date <= NOW() 
                AND p.expire_date >= NOW()
                AND p.completed > 0
                AND p.product_id IN ($product_ids)
        ");
        list($r) = mysql_fetch_row($q);
        return ($r > 0);
    }

    //////////////////// PAYMENTS FUNCTIONS ////////////////////////////
    
    function add_waiting_payment($member_id, $product_id, $paysys_id, 
            $price, $begin_date, $expire_date, $vars){

        $member_id  = intval($member_id);
        if (!$member_id)
            fatal_error('member_id is null in add_waiting_payment');

        $paysys_id     = $this->escape($paysys_id);
        if (!$paysys_id)
            fatal_error('paysys is null in add_waiting_payment');
        $data      = $this->escape($this->encode_data($vars));

        global $HTTP_SERVER_VARS;
        $REMOTE_ADDR = $HTTP_SERVER_VARS['REMOTE_ADDR'];
        $this->query("INSERT INTO {$this->config['prefix']}payments 
        (member_id, product_id, begin_date, expire_date, 
            paysys_id, amount, 
            completed, remote_addr, data)
        VALUES 
        ('$member_id', '$product_id', '$begin_date', '$expire_date',
         '$paysys_id', '$price', 
          0, '$REMOTE_ADDR', '$data') 
        ");
        $payment_id = mysql_insert_id();
        plugin_update_payments($payment_id, $member_id);
        return $payment_id;
    }

    function finish_waiting_payment($payment_id, $paysys_id, 
            $receipt_id, $price='', &$vars){
        settype($payment_id, 'integer');
        settype($price,      'double');
        $paysys_id = $this->escape($paysys_id);
        $receipt_id = $this->escape($receipt_id);
        $data      = $this->escape($this->encode_data($vars));

        $this->query($sql = "UPDATE {$this->config['prefix']}payments 
            SET completed=1, data='$data', receipt_id='$receipt_id'
            WHERE payment_id = $payment_id 
              AND ($price=0 OR amount=$price)
              AND completed=0 
              AND paysys_id='$paysys_id'
        ");

        $rows = mysql_affected_rows();
        if (!$rows) 
            return "Payment not found. Possible reasons: payment already processed, incorrect payment_id, payment system or there is amount mistake";
        plugin_finish_waiting_payment($payment_id, $member_id);
        plugin_update_payments($payment_id, $member_id);
        return '';
    }

    function add_payment(&$v){
        $member_id = $v['member_id'];
        settype($member_id, 'integer');
        if (!$member_id) return "member_id empty or 0";
        $vals = $this->escape_array($v);
        $fields_to_update = array(
            'member_id',
            'product_id', 'begin_date', 'expire_date',
            'paysys_id',  'receipt_id', 'amount',
            'completed'
        );
        foreach ($fields_to_update as $k){
            $fields[] = $k;
            $values[] = "'".$vals[$k]."'";
        }
        $fields = join(',', $fields); 
        $values = join(',', $values);
        $q = $this->query("INSERT INTO {$this->config['prefix']}payments
        ($fields) VALUES ($values)
        ");
        $payment_id = mysql_insert_id();
        if ($v['completed']>0)
            plugin_finish_waiting_payment($payment_id, $member_id);
        plugin_update_payments($payment_id, $member_id);
        return '';
    }

    function update_payment($payment_id, &$v){
        settype($payment_id, 'integer');
        if (!$payment_id) return "payment_id empty or 0";
        $vals = $this->escape_array($v);
        $vals['data'] = $this->escape($this->encode_data($v['data']));
        $fields_to_update = array(
            'product_id', 'begin_date', 'expire_date',
            'paysys_id',  'receipt_id', 'amount',
            'completed' , 'data'
        );
        foreach ($fields_to_update as $k){
            $update_statement .= "$k = '" . $vals[$k] . "', ";
        }
        $update_statement .= " payment_id=payment_id";
        $old = $this->get_payment($payment_id);
        $q = $this->query($s = "UPDATE {$this->config['prefix']}payments
        SET  $update_statement
        WHERE payment_id=$payment_id
        ");
        if (($v['completed']>0) && !$old['completed'])
            plugin_finish_waiting_payment($payment_id, $member_id);
        plugin_update_payments($payment_id);
        return '';
    }

    function delete_payment($payment_id){
        settype($payment_id, 'integer');
        if (!$payment_id) return "payment_id empty or 0";
        
        $payment = $this->get_payment($payment_id);
        $member_id = $payment['member_id'];

        $this->query("DELETE FROM {$this->config['prefix']}payments WHERE payment_id=$payment_id");
        plugin_update_payments($payment_id, $member_id);
        return '';
    }

    function get_user_payments($member_id, $only_completed=0){
        $where_add = "";
        settype($member_id, 'integer');
        settype($only_completed, 'integer');
        if ($only_completed) 
            $where_add = " AND completed > 0";
        $q = $this->query($s = "SELECT p.*
            FROM {$this->config['prefix']}payments p 
            WHERE p.member_id = $member_id $where_add
        ");
        $rows = array();
        while ($row = mysql_fetch_assoc($q)){
            $row['data'] = & $this->decode_data($row['data']);
            $rows[] = $row;
        }
        return $rows;
    }

    function get_payments($beg_date, $end_date, $only_completed){
        $beg_date = $this->escape($beg_date);
        $end_date = $this->escape($end_date);
        $end_date = "$end_date 23:59:59";
        settype($only_completed, 'integer');
        if ($only_completed) $where_add = " AND p.completed > 0";
        $q = $this->query($s = "SELECT 
            p.*, m.login as member_login, 
            pr.title as product_title             
            FROM {$this->config['prefix']}payments p 
                LEFT JOIN {$this->config['prefix']}members m USING (member_id) 
                LEFT JOIN {$this->config['prefix']}products pr ON (p.product_id = pr.product_id)
            WHERE 
                    p.time >= '$beg_date' 
                AND p.time <= '$end_date'
                $where_add
            ORDER BY p.begin_date DESC 
            ");
        while ($r = mysql_fetch_assoc($q)){
            $r['data'] = $this->decode_data($r['data']);
            $rows[] = $r;
        }
        return $rows;
    }

    function get_expired_payments($beg_date, $end_date, $paysys_id=''){
        $beg_date = $this->escape($beg_date);
        $end_date = $this->escape($end_date);
        $where_add = "";
        if ($paysys_id)
            $where_add .= " AND p.paysys_id = '" . $this->escape($paysys_id)."' ";
        $q = $this->query($s = "SELECT 
            p.*, m.login as member_login, 
            pr.title as product_title, 
            p1.payment_id as next_payment_id
            FROM {$this->config['prefix']}payments p 
                LEFT JOIN {$this->config['prefix']}members m USING (member_id) 
                LEFT JOIN {$this->config['prefix']}products pr ON (p.product_id = pr.product_id)
                LEFT JOIN {$this->config['prefix']}payments p1 ON
                    (p.member_id  = p1.member_id AND
                     p.product_id = p1.product_id AND 
                     p1.completed > 0 AND
                     p.expire_date     < p1.expire_date)
            WHERE 
                    p.expire_date >= '$beg_date' 
                AND p.expire_date <= '$end_date'
                AND p.completed > 0
                $where_add
            HAVING next_payment_id IS NULL  
            ORDER BY p.begin_date DESC 
            ");
        $rows = array();
        while ($r = mysql_fetch_assoc($q)){
            $r['data'] = $this->decode_data($r['data']);
            $rows[] = $r;
        }
        return $rows;
    }

    function get_payment($payment_id){
        settype($payment_id, 'integer');
        $q = $this->query($s = "SELECT 
            p.*, m.login as member_login,
            pr.title as product_title             
            FROM {$this->config['prefix']}payments p 
                LEFT JOIN {$this->config['prefix']}members m USING (member_id) 
                LEFT JOIN {$this->config['prefix']}products pr ON (p.product_id = pr.product_id)
            WHERE 
                p.payment_id = $payment_id
            ");
        $r = mysql_fetch_assoc($q);
        if ($r)
            $r['data'] = $this->decode_data($r['data']);
        return $r;
    }

    function clear_incomplete_payments($date){
        $date = $this->escape($date);
        $this->query($s = "DELETE FROM {$this->config['prefix']}payments 
            WHERE time < '$date' AND completed = 0");
    }

    /////////////////// PRODUCTS FUNCTIONS //////////////////////////////////

    function get_product($product_id){
        settype($product_id, 'integer');
        $q = $this->query("SELECT * FROM {$this->config['prefix']}products 
            WHERE product_id=$product_id
        ");   
        $row = mysql_fetch_assoc($q);
        $data = $row['data']; unset($row['data']);
        $vals = & $this->decode_data( $data);
        foreach ($vals as $k=>$v)
            $row[$k] = $v;
        return $row;
    }

    function get_products_list(){
        $q = $this->query("SELECT * FROM {$this->config['prefix']}products 
            ORDER BY title");   
        $rows = array();
        while ($row = mysql_fetch_assoc($q)){
            $data = $row['data']; unset($row['data']);
            $vals = & $this->decode_data( $data);
            foreach ($vals as $k=>$v)
                $row[$k] = $v;
            $rows[] = $row;
        }
        return $rows;
    }

    function update_product($product_id, &$vars){
        settype($product_id, 'integer');
        if (!$product_id) return "product_id empty or 0";
     
        global $product_fields;
        global $product_additional_fields;

        foreach ($product_fields as $ff){
            $k = $ff['name'];
            $update_statement .= "$k = '" . $this->escape($vars[$k]) . "', ";
        }
        foreach ($product_additional_fields as $ff){
            $k = $ff['name'];
            $data[$k] = $this->escape($vars[$k]);
        }
        $data_s = $this->encode_data($data);
        $update_statement .= " data = '$data_s' ";

        $q = $this->query($s = "UPDATE {$this->config['prefix']}products
        SET  $update_statement
        WHERE product_id=$product_id
        ");
        return '';
    }

    function add_product(&$vars){
        $f = array();

        global $product_fields;
        global $product_additional_fields;
        foreach ($product_fields as $ff){
            $k = $ff['name'];
            $f[$k] = "'" . $this->escape( $vars[$k] )  . "'";
        }
        foreach ($product_additional_fields as $ff){
            $k = $ff['name'];
            $data[$k] = $this->escape($vars[$k]);
        }
        $f['data'] = "'" . $this->encode_data($data) . "'" ;

        $fields = join(',', array_keys($f));
        $values = join(',', array_values($f));
        $q = $this->query($s = "INSERT INTO {$this->config['prefix']}products
            ($fields) VALUES ($values)
        ");
        return mysql_insert_id();
    }

    function delete_product($product_id){
        settype($product_id, 'integer');
        if (!$product_id) return "product_id empty or 0";
        $this->query("DELETE FROM {$this->config['prefix']}products 
            WHERE product_id=$product_id");
        return '';
    }

    ////////////////////////// ERROR LOG ////////////////////////////

    function get_error_log($start, $count){
        settype($start, 'integer');
        settype($count, 'integer');
        $q = $this->query("SELECT * 
            FROM {$this->config['prefix']}error_log 
            ORDER BY time DESC 
            LIMIT $start,$count");
        while ($r = mysql_fetch_assoc($q)){
            $rows[] = $r;
        }
        return $rows;
    }

    function get_error_log_count(){
        $q = $this->query("SELECT COUNT(*)
            FROM {$this->config['prefix']}error_log ");
        $res = mysql_fetch_row($q);
        return intval($res[0]);
    }

    function log_error($error){
        global $db;
        global $HTTP_SERVER_VARS;
        extract($HTTP_SERVER_VARS);
        $error = $this->escape($error);
        $this->query("INSERT INTO {$this->config['prefix']}error_log 
        (member_id, time, remote_addr, url, referrer, error)
        VALUES 
        (NULL, NOW(), '$REMOTE_ADDR', '$REQUEST_URI', '$HTTP_REFERRER', '$error') 
        ");
    }

    function clear_error_log($date){
        $date = $this->escape($date);
        $this->query($s = "DELETE FROM {$this->config['prefix']}error_log 
            WHERE time < '$date 00:00:00'");
    }

    ////////////////////////// ACCESS LOG ////////////////////////////

    function log_access($member_id){
        global $db;
        global $HTTP_SERVER_VARS;
        extract($HTTP_SERVER_VARS);
        settype($member_id, 'integer');
        $this->query("INSERT INTO {$this->config['prefix']}access_log 
        (member_id, remote_addr, url, referrer)
        VALUES 
        ($member_id, '$REMOTE_ADDR', '$REQUEST_URI', '$HTTP_REFERRER') 
        ");
    }

    function get_access_log($member_id=0, $start=0, $count=20){
        settype($start, 'integer');
        settype($count, 'integer');
        settype($member_id, 'integer'); 
        if ($member_id) $where_add = " AND a.member_id = $member_id ";
        $q = $this->query("SELECT a.*, m.login 
            FROM {$this->config['prefix']}access_log a 
                LEFT JOIN {$this->config['prefix']}members m USING (member_id)
            WHERE 1 $where_add
            ORDER BY a.time DESC 
            LIMIT $start,$count");
        while ($r = mysql_fetch_assoc($q)){
            $rows[] = $r;
        }
        return $rows;
    }

    function get_access_log_count($member_id=0){
        settype($member_id, 'integer');
        if ($member_id > 0)
            $where = "WHERE member_id = $member_id ";
        $q = $this->query("SELECT COUNT(*)
            FROM {$this->config['prefix']}access_log 
            $where");
        $res = mysql_fetch_row($q);
        return intval($res[0]);
    }

    function clear_access_log($date){
        $date = $this->escape($date);
        $this->query($s = "DELETE FROM {$this->config['prefix']}access_log 
            WHERE time < '$date 00:00:00'");
    }

    ////////////////////// CRON FUNCTIONS ////////////////////////////////////

    function save_cron_time($id){
        settype($id, 'integer');
        $this->query("REPLACE INTO {$this->config['prefix']}cron_run (id,time)
            VALUES ($id,now())");
    }

    function load_cron_time($id){
        settype($id, 'integer');
        $q = $this->query($s="SELECT UNIX_TIMESTAMP(time) 
            FROM {$this->config['prefix']}cron_run 
            WHERE id=$id");
        list($time) = mysql_fetch_row($q);
        return $time;
    }

    /////////////////////////// MISC FUNCTIONS ///////////////////////////

    function escape($s){
        // because all additional slashes was stripped
        return mysql_escape_string($s); 
    }

    function query($s){
        if ($res = mysql_query($s))
            return $res;
        else {
            fatal_error("MYSQL ERROR:<br>" . mysql_error() . 
            "<br>in query:<br>".$s);
        }
    }
}

?>
