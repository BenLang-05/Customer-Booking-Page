<?php
    session_start();
    /* Run through the CSV and pull in the data: */
    if (($handle = fopen("users.csv", "r")) !== FALSE) {
        while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) {
            $users[$data[0]] = array("password"=>$data[1], "admin"=>$data[2]);
        }
        fclose($handle);
    }
        /* Get the data entered on the form: */
    $u = $_POST['username']; $p = $_POST['password'];
        /* Check it against our 'database': */
    if(isset($users[$u]) and $users[$u]['password'] == $p ) {
        $_SESSION['loggedin']=TRUE;
        $_SESSION['username']=$u;
        header("Location: secret.php");
    }
    else{
        header("Location: session.php");
    }
?>