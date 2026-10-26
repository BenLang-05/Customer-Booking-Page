<?php session_start();
    if(!isset($_SESSION['loggedin'])) header("Location: session.php");
    if($_SESSION['loggedin']===FALSE) header("Location: session.php");
?>

<!DOCTYPE html>
<html>
    <head>
        <title>buffet order</title>
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



<div class = "recordBox">
<h2>Buffet Orders</h2>


<?php
    //Program to read the contents of ITEM and display them in a table
    //putenv("ORACLE_SID=teaching");

    if ($Connection = oci_connect("y0l35", "901211")) 
    {
        //print "Connection OK<br> \n";
        $sql = "select * from buffet_order";

        // Parse Oracle query
        $Statement = oci_parse($Connection, $sql);

        // Execute Oracle query
        oci_execute($Statement);

        //print "SQL query executed...<br> \n";

        $numcols = oci_num_fields($Statement);

        print "<table width=700 border=1><tr>";
        for ($i=1; $i<=$numcols; $i++)
        {
            // Print column headings
            $colname = oci_field_name($Statement, $i);
            print "<td>$colname</td>";
        }

        print "</tr>";

        // Get a row and print it column by column
        while (oci_fetch($Statement))
        {
            print "<tr>";
            for ($i=1; $i<=$numcols; $i++)
            {
                $col = oci_result($Statement, $i);
                PRINT "<td>$col</td>";
            }

            print "</tr>";
        }

        print "</table>";

        $numrows = oci_num_rows($Statement);
        //print "Table has $numcols columns and $numrows rows<br> \n";

        oci_close($Connection);
        //print "Logged off.";
    }
    else
    {
        var_dump(oci_error($Connection));
    } 
    // end of if expression
    ?>

</div>

</body>
</html>