<?php
	$hostname = "localhost";
	$username = "ecpi_user"; //application user
	$password = "Password1";
	$dbname = "restaurant";
	$conn = mysqli_connect($hostname, $username, $password, $dbname);
    $query = "select * from productitem";
    $result = mysqli_query($conn, $query);


    $productID = -1;
    $productName = "";
    $productDescription = "";
    $productCost = "";
    $quantityInCart = "";
    $request = "";

    
    if(isset($_POST["checkout"]))
    {
       $clearcartquery = "UPDATE `productitem` SET `QuantityInCart` = 0, `Request` = '' ";
        mysqli_query($conn, $clearcartquery);
    }
  
    if(isset($_POST["add"]))
    {
        $productID = $_POST["productID"];
        $quantityInCart = $_POST["Qty"];
                      
        $addQuery = "UPDATE `productitem` SET `QuantityInCart` = '$quantityInCart' WHERE `productitem`.`ProductID` = $productID";
             mysqli_query($conn, $addQuery);
             $productID = -1;
             $productName = "";
             $productDescription = "";
             $productCost ="";
             $quantityInCart = "";
             $request = "";

    }
     else if (isset($_POST["update"]))
    {
        $productID = $_POST["productID"];
        $request = $_POST["Request"];
        $updateQuery = "UPDATE productitem set Request = '$request' WHERE `productitem`.`ProductID` = $productID";
        mysqli_query($conn, $updateQuery);
    }
     $query = "select * from productitem";
     $result = mysqli_query($conn, $query);

  

?>
<html>
<head>
<title>Restaurant</title>
<style>
    table {
        border-spacing: 5px;
    }
    table, th,td {
        border:1px solid black;
        border-collapse: collapse;
    }
    th, td 
    {
        padding: 15px;
        text-align: center;
    }
    th{
        background-color: lightskyblue;
    }
    tr
    {
         background-color: whitesmoke;
    }
   

</style>
</head>
    
<body>
    <h2>Menu List:</h2>
    <table> 
        <tr>
            <th>Item</th>
            <th>Description</th>
            <th>Price</th>
            <th>Quantity</th>
        </tr>

  
    <?php while($row = mysqli_fetch_array($result)):; ?>
       <tr>
           <td><?php echo $row["ProductName"]; ?></td>
           <td><?php echo $row["ProductDescription"]; ?></td>
           <td><?php echo $row["ProductCost"]; ?></td>
           <td><?php echo $row["QuantityInCart"]; ?></td>
           <td>
                <form method="POST">
                    <input type= "number" value= "1" name="Qty" min="1" max="9"/>
                    <input type="submit" value="Add to cart" name="add"/>
                    <input type= "hidden" value="<?php echo $row["ProductID"]; ?>" name ="productID" />
                </form>
            </td>
       
       </tr>
        <?php endwhile;?>
    </table>       

 
       <form method="POST" action="shoppingCart.php">

            <input type="submit" value="Go to Cart" name="cart"/>
       </form>
   
     
    </table>
     
 </body>
</html>
