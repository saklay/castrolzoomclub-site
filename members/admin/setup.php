STILL INCOMPLETED
<?
exit();
/*
*
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: Configuration
*    FileName $RCSfile: setup.php,v $
*    Release: 1.8.5 ($Revision: 1.8 $)
*
* Please direct bug reports,suggestions or feedback to the cgi-central forums.
* http://www.cgi-central.net/forum/
*                                                                          
* aMember is free for both commercial and non-commercial use providing that the
* copyright headers remain intact and the links remain on the html pages.
* Re-distribution of this script without prior consent is strictly prohibited.
*
*/

include "../config.inc.php";
$t = new_smarty();
include "login.inc.php";


function config_read_items($config_file){
    $fd = fopen($config_file, 'r');
    if (!$fd){
        fatal_error("Cannot open '$config_file'");
    }
    $items = array();
    $item  = array();   
    $line = 0;
    while (!feof ($fd)) {
        $s = fgets($fd, 14096);
        $line++;
        if (preg_match('/^### CONFIG-(\w+):\s+(.*)$/', $s, $regs)){ //config
            list($skip, $key, $value) = $regs;
            $item[strtolower($key)] = trim($value);
        } else { //not config
            if (count($item)) {
                if (!isset($item['var'])) 
                    die("Syntax error in '$config_file' line $line: 
                       config don't contain variable CONFIG-VAR!");
                $items[] = $item;
                $item = array();
            }
        }
    }
    fclose($fd);
    return $items;
}

function config_get_edit($item){
    return "<INPUT TYPE=text NAME=\"$item[var]\" VALUE=\"$item[value]\">";
}

$items = config_read_items("../config.inc.php");
foreach ($items as $k=>$item){
    $items[$k]['edit'] = config_get_edit($item);
}


$t->assign('config_items', $items);
$t->display("admin/setup.html");


?>