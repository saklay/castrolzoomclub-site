<?php
/*
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */


/*
 * This file creates SmartySingleDir, a smarty variant using only
 * one directory level for all magic names
 */

class SmartySingleDir extends Smarty
{


/*======================================================================*\
    Function: _get_auto_base
    Purpose:  Get a base name for automatic files creation
\*======================================================================*/
    function _get_auto_base($auto_base, $auto_source)
    {
        $source_md5 = md5($auto_source);

        $res = $auto_base . DIR_SEP .  $source_md5;

        return $res;
    }

/*======================================================================*\
    Function: _get_auto_filename
    Purpose:  get a concrete filename for automagically created content
\*======================================================================*/
    function _get_auto_filename($auto_base, $auto_source, $auto_id = null)
    {
        $res = $this->_get_auto_base($auto_base, $auto_source) .
                '-' . md5($auto_id) . '.php';

        return $res;
    }

/*======================================================================*\
    Function: _rm_auto
    Purpose: delete an automagically created file by name and id
\*======================================================================*/
    function _rm_auto($auto_base, $auto_source = null, $auto_id = null)
    {
        if (!is_dir($auto_base))
          return false;

        if (!isset($auto_source)) {
            $res = $this->_rmdir($auto_base, 0);
        } else {
            if (isset($auto_id)) {
                $tname = $this->_get_auto_filename($auto_base, $auto_source, $auto_id);
                $res = is_file($tname) && unlink( $tname);
            } else {
                $tname = $this->_get_auto_base($auto_base, $auto_source);
                $tdir  = dirname( $tname );
                $tbase = basename( $tname );

                $dh = opendir( $tdir );
                while( $entry = readdir( $dh ) ) {
                 if( substr( $entry, 0, strlen( $tbase ) ) == $tbase )
                   unlink( $tdir . DIR_SEP . $entry );
                }
                $res = true;
            }
        }

        return $res;
    }
}

/* vim: set expandtab: */

?>
