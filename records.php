<?php session_start();
    if(!isset($_SESSION['loggedin'])) header("Location: session.php");
    if($_SESSION['loggedin']===FALSE) header("Location: session.php");
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Records</title>
        <link rel="stylesheet" type="text/css" href="CSS.css">
    </head>

    <body>

    <div class="return">
            <form action="secret.php" method="post">
            <button type="submit">Return</button>
    </div>

    <div id ="sidenav">
    
        <ul>
            <li><a href="company.php">Companies </a></li>
            <li><a href="branch.php">Branches </a></li>
            <li><a href="employee.php">Employees </a></li>
            <li><a href="supplier.php">Suppliers </a></li>
            <li><a href="products.php">Product Orders </a></li>
            <li><a href="room.php">Rooms </a></li>
            <li><a href="standard.php">Standard Rooms </a></li>
            <li><a href="executive.php">Executive Rooms </a></li>
            <li><a href="party.php">Party Rooms </a></li>
            <li><a href="buffet.php">Buffets </a></li>
            <li><a href="buffetOrder.php">Buffet Orders </a></li>
            <li><a href="customer.php">Customers </a></li>
            <li><a href="booking.php">Bookings </a></li>
            <li><a href="standardCust.php">Standard Customers </a></li>
            <li><a href="businessCust.php">Business Customers </a></li>
        </ul>

    </div>

    

    <div class = "recordBox"></div>
    </body>
</html>