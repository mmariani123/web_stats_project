<?php
// outputs the username that owns the running php/httpd process
// (on a system with the "whoami" executable in the path)
//$data = $_POST['players'];    
//echo json_encode($data);
$myfile = fopen("input.txt", "w") or die("Unable to open file!");
fwrite($myfile, $data);
fclose($myfile);
echo exec('whoami');
echo("Hello!");
//system('start notepad.exe');
exec("r_code.bat");
//shell_exec('C:\\wamp64\\www\\r_code.bat');
//shell_exec("r_code.bat");
?>