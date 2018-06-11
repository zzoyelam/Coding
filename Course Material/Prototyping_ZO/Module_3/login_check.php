<?php

session_start();

$filename = $_POST['file'];

// Retrieving Operators
$op = $_POST['operators'];
$username = $_SESSION['login'];

$full_path = sprintf("/home/z.oyelami/users/%s/%s", $username, $filename);

if( preg_match('/^[\w_\.\-]+$/', $filename) &&  preg_match('/^[\w_\-]+$/', $username))
{
if($op == 'View')
  {
   // Now we need to get the MIME type (e.g., image/jpeg).  PHP provides a neat little interface to do this called finfo.

   $finfo = new finfo(FILEINFO_MIME_TYPE);
   $mime = $finfo->file($full_path);

   // Finally, set the Content-Type header to the MIME type of the file, and display the file.
   header("Content-Type: ".$mime);
   readfile($full_path);
   break;

  }
elseif($op == 'Delete')
 {
  unlink($full_path);
  echo "File was deleted";
  break;
 }

elseif($op == 'Info')
 {
   //Display file owner & File Directory
   $userid = fileowner($full_path);
   $usr = posix_getpwuid($userid);
   echo "Ower: $usr[name] <br>";
   echo "File Directory: $usr[dir]<br>";
   //Display last time file was accessed
   echo "Time file was last accessed: ".date("F d Y H:i:s.",fileatime($full_path));

  //Display last time file was changed
   echo "<br>Time file was last changed: ".date("F d Y H:i:s.",filectime($full_path));
   //Display file type
   $type = mime_content_type($full_path);
   echo "<br>File type: $type";
   //Display file size
   $size = filesize($full_path);
   echo "<br>File size: $size Bytes <br>";
   break;
 }
}

if($op== 'Upload')
{
 header("Location:uploader.html");
 exit;
}
if($op == 'Share')
 {
  header("Location: share.html");
   exit;
 }

if($op == 'Logout')
{
 header("Location: FileShare.html");
 session_destroy();
 exit;
}
else
 { echo "Invalid filename or username";
   exit;
 }

 ?>
