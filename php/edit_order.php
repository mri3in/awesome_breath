<?php
/**
 * Created by PhpStorm.
 * User: Hai Phong
 * Date: 3/18/2016
 * Time: 4:27 PM
 */

//Connect to database via $db
include '../config.php';

//declare timezone and current date, time
date_default_timezone_set("Asia/Ho_Chi_Minh");
$creationDateTime = date("Y-m-d H:i:s");

//set the variables because some variables are set by default
$order_id = $_POST['order_id'];
$user_id = "1";
$order_create_date_time = $creationDateTime;
$order_close_date_time = "";
$order_status = $_POST['order_status'];
$order_note = $_POST['order_note'];
$order_total = $_POST['total_price'];
$tax = $_POST['tax'];
$net_total_price = $_POST['net_total_price'];
$order_reference = $_POST['order_reference'];
$customer_id = $_POST['customer_id'];

//set the array
$order_line_id = $_POST['order_line_id'];
$order_line_create_date_time = $creationDateTime;
$order_line_item_id = $_POST['item_id'];
$order_line_item_quantity = $_POST['order_line_item_quantity'];
$order_line_total_value = $_POST['order_line_total_value'];
$item_vendor = $_POST['item_vendor'];
$order_line_delivery_date = $_POST['order_line_delivery_date'];
$order_line_selling_price = $_POST['order_line_selling_price'];
$order_line_net_selling_price = $_POST['order_line_net_selling_price'];

//establish sql query to update user with the customer_id and relevant details
$sql_query = "UPDATE customer_order
              SET
              user_id= '$user_id',
              order_create_date= '$order_create_date_time',
              order_close_date= '$order_close_date_time',
              order_status= '$order_status',
              order_note= '$order_note',
              customer_id= '$customer_id',
              order_total= '$order_total'

              WHERE order_id = '$order_id'";
//order_reference= '$order_reference'
//run the query. if fail, echo the error message
$query = mysqli_query($db,$sql_query) or die ("Error: Cannot edit order");

//if success, echo the success message
echo "successfully edit order id = " . $_POST['order_id'];

foreach($order_line_id as $key => $value) {

    //establish sql query to update user with the customer_id and relevant details
    $sql_query_order_line = "
          UPDATE order_line
          SET
          order_line_create_date='$order_line_create_date_time',
          order_line_item_id='$order_line_item_id[$key]',
          order_line_item_quantity='$order_line_item_quantity[$key]',
          order_line_item_total_value='$order_line_total_value[$key]',
          order_line_deliver_date='$order_line_delivery_date[$key]',
          order_line_selling_price='$order_line_selling_price[$key]',
          order_line_net_selling_price='$order_line_net_selling_price[$key]'
          WHERE order_line_id = '$order_line_id[$key]'";

    //run the query. if fail, echo the error message
    $query_order_line = mysqli_query($db,$sql_query_order_line) or die ("Error: Cannot edit order_line");

    //if success, echo the success message
    echo "successfully edit order id = " . $order_line_id[$key];
}

?>