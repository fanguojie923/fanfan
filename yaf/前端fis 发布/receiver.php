<?php

// @error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING);

// function mkdirs($path, $mod = 0777) {
//     if (is_dir($path)) {
//         return chmod($path, $mod);
//     } else {
//         $old = umask(0);
//         if(mkdir($path, $mod, true) && is_dir($path)){
//             umask($old);
//             return true;
//         } else {
//             umask($old);
//         }
//     }
//     return false;
// }

// if($_POST['to']){
//     $to = urldecode($_POST['to']);
//     if(is_dir($to) || $_FILES["file"]["error"] > 0){
//         header("Status: 500 Internal Server Error");
//     } else {
//         if(file_exists($to)){
//             unlink($to);
//         } else {
//             $dir = dirname($to);
//             if(!file_exists($dir)){
//                 mkdirs($dir);
//             }
//         }
//         echo move_uploaded_file($_FILES["file"]["tmp_name"], $to) ? 0 : 1;
//     }
// } else {
//     echo 'I\'m ready for that, you know.';
// }



@error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING);

checkToken();

function mkdirs($path, $mod = 0777) {
    if (is_dir($path)) {
        return chmod($path, $mod);
    } else {
        $old = umask(0);
        if(mkdir($path, $mod, true) && is_dir($path)){
            umask($old);
            return true;
        } else {
            umask($old);
        }
    }
    return false;
}

if($_POST['to']){
    $to = urldecode($_POST['to']);
    if(is_dir($to) || $_FILES["file"]["error"] > 0){
        header("Status: 500 Internal Server Error");
    } else {
        if(file_exists($to)){
            unlink($to);
        } else {
            $dir = dirname($to);
            if(!file_exists($dir)){
                mkdirs($dir);
            }
        }
        echo move_uploaded_file($_FILES["file"]["tmp_name"], $to) ? 0 : 1;
    }
} else {
    echo 'I\'m ready for that, you know.';
}

function checkToken(){
    $token = isset($_GET['token']) ? $_GET['token'] : '';
    if($token != '28b901e3041d5eddb024f7a581b78f76'){
        header('HTTP/1.1 404 Not Found');
        exit; 
    }
}


class Fis_Log{
    public static function trace($content){/*{{{*/
        $str = "[". date("Y-m-d H:i:s") ."]" . $content . "\n";
        file_put_contents("/tmp/fistrace", $str, FILE_APPEND); 
    }

    public static function error($content){
        $str = "[". date("Y-m-d H:i:s") ."]" . $content . "\n";
        file_put_contents("/tmp/fiserror", $str, FILE_APPEND); 
    }/*}}}*/
}