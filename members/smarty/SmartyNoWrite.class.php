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
 * This file creates SmartyNoWrite, a smarty subclass not using
 * disk writes at all. It helps on some dummy hostings with incorrect 
 * PHP settings.
 *
 * Author: Alex <alex@cgi-central.net>
 *
 */

class SmartyNoWrite extends Smarty
{

/*======================================================================*\
    Function:   _read_file()
    Purpose:    read in a file from line $start for $lines.
                read the entire file if $start and $lines are null.
                CHANGED: cache it in memory
\*======================================================================*/
    function _read_file($filename, $start=null, $lines=null)
    {
        global $_SMARTY_INTERNAL_FILES;

        if (!isset($_SMARTY_INTERNAL_FILES[$filename])) 
            return parent::_read_file($filename, $start, $lines);

        $contents = $_SMARTY_INTERNAL_FILES[$filename];
        
        if (($start == null) && ($lines == null))
            return $contents;

        $arr = split("\n", $contents);
        if ( $start > 1 ) {
            $arr = array_slice($arr, $start-1);
        }
        if ( $lines != null ) {
            $arr = array_slice($arr, 0, $lines);
        }
        return join("\n", $contents);
    }

/*======================================================================*\
    Function:   _write_file()
    Purpose:    write out a file
\*======================================================================*/
    function _write_file($filename, $contents, $create_dirs = false)
    {
        global $_SMARTY_INTERNAL_FILES;
        $_SMARTY_INTERNAL_FILES[$filename] = $contents;
        return true;
    }

/*======================================================================*\
    Function:   fetch()
    Purpose:    executes & returns or displays the template results
\*======================================================================*/
    function fetch($_smarty_tpl_file, $_smarty_cache_id = null, $_smarty_compile_id = null, $_smarty_display = false)
    {
        $_smarty_old_error_level = $this->debugging ? error_reporting() : error_reporting(error_reporting() & ~E_NOTICE);

        if (!$this->debugging && $this->debugging_ctrl == 'URL'
               && strstr($GLOBALS['QUERY_STRING'], $this->_smarty_debug_id)) {
            $this->debugging = true;
        }

        if ($this->debugging) {
            // capture time for debugging info
            $debug_start_time = $this->_get_microtime();
            $this->_smarty_debug_info[] = array('type'      => 'template',
                                                'filename'  => $_smarty_tpl_file,
                                                'depth'     => 0);
            $included_tpls_idx = count($this->_smarty_debug_info) - 1;
        }

        if (!isset($_smarty_compile_id))
            $_smarty_compile_id = $this->compile_id;

        $this->_compile_id = $_smarty_compile_id;

        $this->_inclusion_depth = 0;

        if ($this->caching) {
            if ($this->_read_cache_file($_smarty_tpl_file, $_smarty_cache_id, $_smarty_compile_id, $_smarty_results)) {
                if (@count($this->_cache_info['insert_tags'])) {
                    $this->_load_plugins($this->_cache_info['insert_tags']);
                    $_smarty_results = $this->_process_cached_inserts($_smarty_results);
                }
                if ($_smarty_display) {
                    if ($this->debugging)
                    {
                        // capture time for debugging info
                        $this->_smarty_debug_info[$included_tpls_idx]['exec_time'] = $this->_get_microtime() - $debug_start_time;

                        $_smarty_results .= $this->_generate_debug_output();
                    }
                    if ($this->cache_modified_check) {
                        $last_modified_date = substr($GLOBALS['HTTP_IF_MODIFIED_SINCE'], 0, strpos($GLOBALS['HTTP_IF_MODIFIED_SINCE'], 'GMT') + 3);
                        $gmt_mtime = gmdate('D, d M Y H:i:s', $this->_cache_info['timestamp']).' GMT';
                        if (@count($this->_cache_info['insert_tags']) == 0
                            && $gmt_mtime == $last_modified_date) {
                            header("HTTP/1.1 304 Not Modified");
                        } else {
                            header("Last-Modified: ".$gmt_mtime);
                        }
                    }
                    echo $_smarty_results;
                    error_reporting($_smarty_old_error_level);
                    return true;    
                } else {
                    error_reporting($_smarty_old_error_level);
                    return $_smarty_results;
                }
            } else {
                $this->_cache_info = array();
                $this->_cache_info['template'][] = $_smarty_tpl_file;
            }
        }

        extract($this->_tpl_vars);

        /* Initialize config array. */
        $this->_config = array(array('vars'  => array(),
                                     'files' => array()));

        if (count($this->autoload_filters))
            $this->_autoload_filters();

        $_smarty_compile_path = $this->_get_compile_path($_smarty_tpl_file);

        // if we just need to display the results, don't perform output
        // buffering - for speed
        if ($_smarty_display && !$this->caching && count($this->_plugins['outputfilter']) == 0) {
            if ($this->_process_template($_smarty_tpl_file, $_smarty_compile_path))
            {
//                include($_smarty_compile_path);
                  eval('?'.'>'.$this->_read_file($_smarty_compile_path));
            }
        } else {
            ob_start();
            if ($this->_process_template($_smarty_tpl_file, $_smarty_compile_path))
            {
//                include($_smarty_compile_path);
                eval('?'.'>'.$this->_read_file($_smarty_compile_path));
            }
            $_smarty_results = ob_get_contents();
            ob_end_clean();

            foreach ($this->_plugins['outputfilter'] as $output_filter) {
                $_smarty_results = $output_filter[0]($_smarty_results, $this);
            }
        }

        if ($this->caching) {
            $this->_write_cache_file($_smarty_tpl_file, $_smarty_cache_id, $_smarty_compile_id, $_smarty_results);
            $_smarty_results = $this->_process_cached_inserts($_smarty_results);
        }

        if ($_smarty_display) {
            if (isset($_smarty_results)) { echo $_smarty_results; }
            if ($this->debugging) {
                // capture time for debugging info
                $this->_smarty_debug_info[$included_tpls_idx]['exec_time'] = ($this->_get_microtime() - $debug_start_time);

                echo $this->_generate_debug_output();
            }
            error_reporting($_smarty_old_error_level);
            return;
        } else {
            error_reporting($_smarty_old_error_level);
            if (isset($_smarty_results)) { return $_smarty_results; }
        }
    }


/*======================================================================*\
    Function:   _smarty_include()
    Purpose:    called for included templates
\*======================================================================*/
    function _smarty_include($_smarty_include_tpl_file, $_smarty_include_vars)
    {
        if ($this->debugging) {
            $debug_start_time = $this->_get_microtime();
            $this->_smarty_debug_info[] = array('type'      => 'template',
                                                'filename'  => $_smarty_include_tpl_file,
                                                'depth'     => ++$this->_inclusion_depth);
            $included_tpls_idx = count($this->_smarty_debug_info) - 1;
        }

        $this->_tpl_vars = array_merge($this->_tpl_vars, $_smarty_include_vars);
        extract($this->_tpl_vars);

        array_unshift($this->_config, $this->_config[0]);
        $_smarty_compile_path = $this->_get_compile_path($_smarty_include_tpl_file);

        if ($this->_process_template($_smarty_include_tpl_file, $_smarty_compile_path)) {
//            include($_smarty_compile_path);
            eval('?'.'>'.$this->_read_file($_smarty_compile_path));
        }

        array_shift($this->_config);
        $this->_inclusion_depth--;

        if ($this->debugging) {
            // capture time for debugging info
            $this->_smarty_debug_info[$included_tpls_idx]['exec_time'] = $this->_get_microtime() - $debug_start_time;
        }

        if ($this->caching) {
            $this->_cache_info['template'][] = $_smarty_include_tpl_file;
        }
    }


/*======================================================================*\
    Function: _get_auto_filename
    Purpose:  get a concrete filename for automagically created content
\*======================================================================*/
    function _get_auto_filename($auto_base, $auto_source, $auto_id = null)
    {
        $source_hash = str_replace('-','N',crc32($auto_source));
        $res = $auto_base . DIR_SEP . substr($source_hash, 0, 3) . DIR_SEP .
            $source_hash . DIR_SEP . str_replace('-','N',crc32($auto_id)) . '.php';

        return $res;
    }

/*======================================================================*\
    Function: _rm_auto
    Purpose: delete an automagically created file by name and id
\*======================================================================*/
    function _rm_auto($auto_base, $auto_source = null, $auto_id = null)
    {
        return true;
    }

/*======================================================================*\
    Function: _rmdir
    Purpose: delete a dir recursively (level=0 -> keep root)
    WARNING: no security whatsoever!!
\*======================================================================*/
    function _rmdir($dirname, $level = 1)
    {
        return true;
    }
}

/* vim: set expandtab: */

?>
