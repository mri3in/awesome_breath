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
$user_id = "1";
$order_create_date_time = $creationDateTime;
$order_close_date_time = "";
$order_status = $_POST['order_status'];
$order_note = $_POST['order_note'];
$order_total = $_POST['total_price'];
$tax = $_POST['tax'];
$net_total_price = $_POST['net_total_price'];
//$order_reference = $_POST['order_reference'];
$customer_id = $_POST['customer_id'];

//set the array
$order_line_create_date_time = $creationDateTime;
$order_line_item_id = $_POST['item_id'];
$order_line_item_quantity = $_POST['order_line_item_quantity'];
$order_line_total_value = $_POST['order_line_total_value'];
$item_vendor = $_POST['item_vendor'];
$order_line_delivery_date = $_POST['order_line_delivery_date'];
$order_line_selling_price = $_POST['order_line_selling_price'];
$order_line_net_selling_price = $_POST['order_line_net_selling_price'];

//Get the last record in order table to define the new order_id
$sql_get_the_last_record_id = "SELECT order_id from customer_order ORDER BY order_id DESC LIMIT 1";
$result_get_the_last_record_id = mysqli_query($db, $sql_get_the_last_record_id);

//get the last record id and increase it by one. then assign that value to the new order ID
$row_last_record_id = mysqli_fetch_assoc($result_get_the_last_record_id);
$order_id = $row_last_record_id["order_id"] + 1;

//establish sql query to create order with the order_id and relevant details
$sql_query = "INSERT INTO customer_order(
                  order_id, user_id,
                  order_create_date, order_create_time,
                  order_close_date, order_close_time,
                  order_status, order_note,
                  customer_id, order_total, order_reference)
              VALUES (
                  $order_id,$user_id,
                  $order_create_date_time,'',
                  $order_close_date_time,'',
                  $order_status,$order_note,
                  $customer_id,$order_total,'')";

//run the query. if fail, echo the error message
$query = mysqli_query($db,$sql_query) or die ("Error: Cannot create order");

//if success, echo the success message
echo "successfully create order id = " . $_POST['order_id'];

foreach($order_line_id as $key => $value) {

    //Get the last record in order_line table to define the new order_line_id
    $sql_get_the_last_record_order_line_id = "SELECT order_line_id from order_line ORDER BY order_line_id DESC LIMIT 1";
    $result_get_the_last_record_order_line_id = mysqli_query($db, $sql_get_the_last_record_order_line_id);

    //get the last record id and increase it by one. then assign that value to the new order line ID
    $row_last_record_order_line_id = mysqli_fetch_assoc($result_get_the_last_record_order_line_id);
    $order_line_id = $row_last_record_order_line_id["order_line_id"] + 1;

    //establish sql query to create order line with the order_line_id and relevant details
    $sql_query_order_line = "
      INSERT INTO order_line(
        order_line_id, order_id,
        order_line_create_time, order_line_create_date,
        order_line_item_id, order_line_item_quantity,
        order_line_item_total_value, order_line_deliver_date,
        order_line_selling_price, order_line_net_selling_price)
        VALUES (
        $order_line_id,$order_id,
        '',$order_line_create_date_time,
        $order_line_item_id,$order_line_item_quantity,
        $order_line_total_value,$order_line_delivery_date,
        $order_line_selling_price,$order_line_net_selling_price)";

    //run the query. if fail, echo the error message
    $query_order_line = mysqli_query($db,$sql_query_order_line) or die ("Error: Cannot create order_line");

    //if success, echo the success message
    echo "successfully create order id = " . $order_line_id[$key];
}

?>