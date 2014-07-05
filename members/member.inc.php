<?
/*
*
*     Author: Alex Scott
*      Email: alex@cgi-central.net
*        Web: http://www.cgi-central.net
*    Details: Members handling functions
*    FileName $RCSfile: member.inc.php,v $
*    Release: 1.8.5 ($Revision: 1.5 $)
*
* Please direct bug reports,suggestions or feedback to the cgi-central forums.
* http://www.cgi-central.net/forum/
*                                                                          
* aMember is free for both commercial and non-commercial use providing that the
* copyright headers remain intact and the links remain on the html pages.
* Re-distribution of this script without prior consent is strictly prohibited.
*                                                                                 
*/

$member_fields = array(
    array(
        'name'         => 'member_id',
        'title'        => 'Member #',
        'type'         => 'hidden'
    ),
    array(
        'name'         => 'login',
        'title'        => 'Login',
        'type'         => 'text'
    ),
    array(
        'name'         => 'pass',
        'title'        => 'Password',
        'type'         => 'text'
    ),
    array(
        'name'         => 'email',
        'title'        => 'EMail',
        'type'         => 'text'
    ),
    array(
        'name'         => 'name_f',
        'title'        => 'First Name',
        'type'         => 'text'
    ),
    array(
        'name'         => 'name_l',
        'title'        => 'Last Name',
        'type'         => 'text'
    ),
    array(
        'name'         => 'street',
        'title'        => 'Street',
        'type'         => 'text'
    ),
    array(
        'name'         => 'city',
        'title'        => 'City',
        'type'         => 'text'
    ),
    array(
        'name'         => 'state',
        'title'        => 'State',
        'type'         => 'text'
    ),
    array(
        'name'         => 'zip',
        'title'        => 'Country',
        'type'         => 'text'
    ),
    array(
        'name'         => 'is_male',
        'title'        => 'Male/Female',
        'type'         => 'radio'
    )
);

global $member_additional_fields;
$member_additional_fields = array();


?>
