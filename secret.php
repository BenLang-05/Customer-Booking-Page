<?php session_start();
    if(!isset($_SESSION['loggedin'])) header("Location: session.php");
    if($_SESSION['loggedin']===FALSE) header("Location: session.php");
?>

<!DOCTYPE html>
<html>
    <head>
        <title>EASE Ltd database</title>
        <link rel="stylesheet" type="text/css" href="CSS.css">
    </head>

    <body>

    

        
    <div class="header">
            <h2>Welcome to the EASE Ltd database</h2>
    </div>
            
        <div class="text1">
            <p>
            EASE Ltd (a fictitious company) owns a large chain of facilities that enable customers to book rooms for use in meetings, conferences, or even wedding parties. The company has many branches across the country and each branch has a number of employees. Each branch has a number of rooms which vary in size and rooms are categorised into either standard or executive rooms. The smallest branch has only five rooms which are available for booking while the largest branch has thirty. Standard rooms can be booked for parties, so a room booking must specify whether the room requires decorations or not. Executive rooms can be used for video conferencing and hence they require a television set and an Internet access point. Executive rooms can also have a buffet ordered so the database system must be able to capture and store such details. Customers can book particular rooms in the branches for particular periods of time. The company has deals with various business customers, who can “pay by invoice”. Business customers are allowed to book any room, whereas standard customers can only book the standard rooms. All customers can book as many rooms as needed, provided the branch has enough rooms available. Customers have unique accounts with the company and this is linked to details of their previous room bookings for future marketing purposes. Each branch has a number of suppliers that deliver things such as food for buffets. Suppliers can supply many branches within a particular area, and a branch may need different suppliers for different products
            </p>
        </div>
            
       
            <div class="logout">
            <form action="records.php" method="post">
            <button type="submit">View Records</button></form><br><br><br>

            <form action="logout.php" method="post">
            <button type="submit">Logout</button>
            </form></div>
    </body>
</html>