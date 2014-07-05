<?
/*
*
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: The installation file
*    FileName $RCSfile: clickbank.inc.php,v $
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

add_paysystem_to_list(
array(
            'paysys_id' => 'clickbank',
            'title'     => 'Clickbank',
            'description' => 'See <a href="http://www.clickbank.com" target=_blank>www.clickbank.com</a> for description',
            'public'    => 1
        )
);

add_product_field(
            'clickbank_id', 'ClickBank ID',
            'text', 'you must create the same product<br>
             in Clickbank and enter its number here',
             'validate_clickbank_id'
);


/*** 
  Validation function from ClickBank 
***/
function clickbank_valid($seed, $cbpop, $secret_key)
{
  if (! $seed) return 0;
  if (! $cbpop) return 0;

  $hh = 0x8000;
  $lh = 0x0000;
  $hl = 0x7fff;
  $ll = 0xffff;
  $charsmask =
  array("0","1","2","3","4","5","6","7",
        "8","9","B","C","D","E","F","G",
        "H","J","K","L","M","N","P","Q",
        "R","S","T","V","W","X","Y","Z");
  for ($i=0;$i<10;$i++) $q[$i]="";
  $w = sprintf("%s %s",$secret_key,$seed);
  $w = strtoupper($w);
  $v = unpack("C*",$w);
  $hx = 0; $lx = 17;
  $hy = 0; $ly = 17;
  $z  =17; $n = strlen($w);
  for ($i=0;$i<10;$i++) $s[$i] = 0;

  for($i=0;$i<256;$i++)
  { $tmp1l = $lx & $ll;
    $tmp1h = $hx & $hl;
    $tmp2l = $ly & $ll;
    $tmp2h = $hy & $hl;
    $tmp3l = $tmp1l + $tmp2l;
    $correction = $tmp3l;
    $tmp3l = $tmp3l & 0x0000ffff;
    $correction = $correction - $tmp3l;
    $correction = $correction / pow(2,16);
    $tmp3h = $tmp1h + $tmp2h;
    $tmp3h += $correction;
    $tmp3h = $tmp3h & 0x0000ffff;
    $tmp4l = $lx ^ $ly;
    $tmp4h = $hx ^ $hy;
    $tmp4l = $tmp4l & $lh;
    $tmp4h = $tmp4h & $hh;
    $wil = $tmp3l ^ $tmp4l;
    $wih = $tmp3h ^ $tmp4h;
    $tmp1l = $wil;
    $tmp1h = $wih;

    if($z == 32)
    { $tmpl1=0; $tmp1h=0; }
    elseif($z == 16)
    { $tmp1h=$tmp1l; $tmp1l=0; }
    elseif($z > 16)
    { $shiftleft= $z - 16;
      $tmp1h = $tmp1l * pow(2,$shiftleft);
      $tmp1h = $tmp1h & 0x0000ffff;
      $tmp1l = 0;
    }
    else
    {
      $tmp1l = $tmp1l * pow(2,$z);
      $correction = $tmp1l;
      $tmp1l = $tmp1l & 0x0000ffff;
      $correction = $correction - $tmp1l;
      $correction = $correction / pow(2,16);
      $tmp1h = $tmp1h * pow(2,$z);
      $tmp1h += $correction;
      $tmp1h = $tmp1h & 0x0000ffff;
    }

    $tmp2l = $wil;
    $tmp2h = $wih;
    $shiftvalue = 32 - $z;

    if($shiftvalue == 32)
    { $tmp2l = 0; $tmp2h = 0; }
    elseif($shiftvalue == 16)
    { $tmp2l = $tmp2h; $tmp2h = 0; }
    elseif($shiftvalue > 16)
    { $shiftright = $shiftvalue - 16;
      $tmp2l = $tmp2h >> $shiftright;
      $tmp2h = 0;
    }
    else
    { $tmp2l = ($tmp2l >> $shiftvalue);
      $shiftright = $shiftvalue;
      $bitmask = 1;

      for($j=1;$j<$shiftright;$j++)
        $bitmask = $bitmask * 2 + 1;

      $correction = ($tmp2h & $bitmask) * pow(2,16 - $shiftvalue);
      $tmp2l += $correction;
      $tmp2h = $tmp2h >> $shiftvalue;
    }

    $wil = ($tmp1l | $tmp2l);
    $wih = ($tmp1h | $tmp2h);
    $tmp1l = $wil & $ll;
    $tmp1h = $wih & $hl;
    $tmp1l = $tmp1l + $v[$i%$n + 1];
    $correction = $tmp1l & 0x7fff0000;
    $correction = ($correction >> 16);
    $tmp1h += $correction;
    $tmp1l = $tmp1l & 0x0000ffff;
    $tmp2l = $wil & $lh;
    $tmp2h = $wih & $hh;
    $wil = $tmp1l ^ $tmp2l;
    $wih = $tmp1h ^ $tmp2h;
    $s[$i & 7] += $wil & 31;
    $z = $ly & 31;
    $ly = $lx;
    $hy = $hx;
    $lx = $wil;
    $hx = $wih;
  }

  for ($i=0; $i < 8; $i++)
    $q[$i] = $charsmask[$s[$i] & 31];

  $q[8] = "\0";
  $finalstring = "";
  for($i=0;$i < 8;$i++)
    $finalstring .= $q[$i];
  if (!strcmp($cbpop, $finalstring)) return 1;
  else return 0;
}

// need to configure products in clickbank and set thanks page to ./thanks.php
class payment_clickbank extends payment {
    function do_payment($payment_id, $member_id, $product_id,
            $price, $begin_date, $expire_date, &$vars){

        global $config;
        $product = & get_product($product_id);

        $c_product_id = $product->config['clickbank_id'];

        if (!$c_product_id)
            fatal_error("Clickbank Product ID empty for Product# $product_id");

        $vars = array(
            'link'      => 
               sprintf("%s/%d/%s",
                $this->config['account'],
                $c_product_id,
                urlencode($product->config['title'])),
            'seed'     => $payment_id,
        );
        $vars1 = array();
        foreach ($vars as $kk=>$vv){
            $v = urlencode($vv);
            $k = urlencode($kk);
            $vars1[] = "$kk=$vv";
        }
        $vars = join('&', $vars1);
        header("Location: http://www.clickbank.net/sell.cgi?$vars");
        exit();
    }
    function validate_thanks(&$vars){
        return 
        clickbank_valid($vars['seed'], $vars['cbpop'], $this->config['secret'])
        ? '' : "Incorrect submission #$vars[seed]. Contact webmaster";
    }
    function process_thanks(&$vars){
            global $db;
            $err = $db->finish_waiting_payment(intval($vars['seed']), 
                    'clickbank', $vars['cbreceipt'], '',
                     $vars);
            if ($err) 
                return "finish_waiting_payment error: $err";
    }
}

function validate_clickbank_id(&$p, $field){  
    if (intval($p->config[$field]) <= 0) {
        return "You MUST enter Clickbank Product ID while you're using Clickbank Plugin";
    }
    return '';
}
?>