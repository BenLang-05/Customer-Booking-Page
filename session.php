<?php
    session_start();
    if(isset($_SESSION['loggedin'])) header("Location: secret.php");
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Log-in Page</title>
        
        <link rel="stylesheet" type="text/css" href="CSS.css">
    </head>


    <body>
        

    <div class="login">
        <div class="header">
        <h2>EASE Ltd</h2>
        <p><i>"Your Room Booking Made Simple"</i></p>
    </div>
    <br>

        <form action="login.php" method="post">
            <h3><label for="username">Username:</label></h3>
            <input type="text"   placeholder= "Enter Username" name="username" required><br><br>

            <h3><label for="password">
            Password:</label></h3>
            <input type="password" placeholder= "Enter Password"  name="password" required><br><br>

            <button type="submit">Login</button><br><br>
            
        </form>
    </div>
    </body>

</html>