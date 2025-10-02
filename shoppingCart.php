<?php
    require_once("productitem.php");
	$hostname = "localhost";
	$username = "ecpi_user"; //application user
	$password = "Password1";
	$dbname = "restaurant";
	$conn = mysqli_connect($hostname, $username, $password, $dbname);
    $cartquery = "select * from productitem";
    //$result = mysqli_query($conn, $query);

    $cartquery = "select * from productitem where QuantityInCart > 0 ";
    $cartresult = mysqli_query($conn, $cartquery);  
    $productID = -1;
    $request = "";
    $edit = false;
    // on 1st page load, assume we are not editing a record

    if(isset($_POST["productID"]))
   {
      //  this should tell me if we are inserting or updating
           $edit = isset($_POST["edit"]);
    }
    if (isset($_POST["delete"]))
    {
        $productID = $_POST["productID"];
        $deleteQuery = "UPDATE `productitem` SET `QuantityInCart` = 0, `Request` = '' WHERE `productitem`.`ProductID` = $productID";
        mysqli_query($conn, $deleteQuery);
        $productID = -1;
        $quantityInCart = "";
    }
    else if (isset($_POST["edit"]))
    {
        
         // get the record we need to edit
         $productID = $_POST["productID"];
         $selectQuery = "select * from productitem where ProductID = $productID";
         $result = mysqli_query($conn, $selectQuery);
         $userInfo = mysqli_fetch_assoc($result);
         //get the values to populate the textboxes
         $productID = $userInfo["ProductID"];
         //$request = $userInfo["Request"];
    }

?>
<html>
    
    <table> 
        <h3>Shopping Cart</h3>
            <tr>
                <th>Item</th>
                <th>description</th>
                <th>Quantity</th>
                <th></th>
                <th></th>
               
            </tr>
        
        <?php
        
        while($row = mysqli_fetch_array($cartresult)):; 
        ?>
           <tr>
               <td><?php echo $row["ProductName"]; ?></td>
               <td><?php echo $row["ProductDescription"]; ?><br><?php echo "$".$row["ProductCost"]; ?>
                <br> <?php echo $row["Request"] ;?></td> 
            
               <td><?php echo $row["QuantityInCart"]; ?></td>
               <td>
                     <form method="POST">
                        <input type="submit" value="Edit Item" name="edit"/>
                        <input type= "hidden" value="<?php echo $row["ProductID"]; ?>" name ="productID" />
                        
                    </form>
                </td>
                <td>
                    <form method="POST">
                        <input type="submit" value="Delete Item" name="delete"/>
                        <input type= "hidden" value="<?php echo $row["ProductID"]; ?>" name ="productID" />
                    </form>
                </td>
               
           </tr>
           <?php endwhile;?>
    </table>
    <?php 
       // totals
       $subtotal = 0;
       $taxRate = 0.05;
       $shippingHandling = 0.10;

       mysqli_data_seek($result, 0);
       while($row = mysqli_fetch_array($result))
       {
            $subtotal += $row["ProductCost"] * $row["QuantityInCart"];
            
       }
       $shippingAndHandling = $subtotal * $shippingHandling;
       $tax = $subtotal * $taxRate;
       $productTotal = $subtotal + $tax + $shippingAndHandling;

       ?> 
    <table>
        <tr>
             <td><strong>Subtotal:</strong></td>
                <td><?php echo number_format($subtotal, 2); ?></td>    
        </tr>
        <tr>
             <td><strong>tax:(5%)</strong></td>
                <td><?php echo number_format($tax, 2); ?></td> 
        </tr>
        <tr>
             <td><strong>Shipping&Handling(10%):</strong></td>
                <td><?php echo number_format($shippingAndHandling, 2); ?></td>
        </tr>
        <tr>
            <td><strong>total:</strong></td>
               <td><?php echo number_format($productTotal, 2); ?></td>
        </tr>
    </table>
    <form method ="POST">
        <?php if(!$edit): ?>
            <?php echo "click edit to add request"; ?>
            <?php else: ?>
                
            <h3>Add request: <input type="text" value="<?php echo $request; ?>" name="Request"/></h3> 
            <input type="submit" value="Update Order" name= "update" />
            <input type="hidden" value="<?php echo $_POST["productID"]; ?>" name ="productID" />
        <?php endif;?>
    </form>
    
    <form method="POST" action="productitem.php">
        <input type="submit" value="Checkout and return to Menu" name="checkout"/>
    </form>
    <foot>
      <h3> <strong>Final Project SDC310L </strong> </h3> 
    </foot>
</html>
