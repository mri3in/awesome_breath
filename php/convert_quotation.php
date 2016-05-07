<?php
/**
 * Created by PhpStorm.
 * User: Hai Phong
 * Date: 4/17/2016
 * Time: 11:16 PM
 */

//Connect to database via $db
include ('../config.php');

//get the desired customer by customer_id in URL
if (isset($_GET['quotation_id'])) {
    //get the param in URL of customer_id
    $convert_quotation_id = $_GET['quotation_id'];

    //echo $convert_quotation_id;

    //load all the quotation by default
    //run sql to select all the quotation
    $sql_quotation = "SELECT * FROM quotation
                    WHERE quotation.quotation_id = '$convert_quotation_id'";

    //connect to db via $db and execute the sql
    $result_quotation = mysqli_query($db, $sql_quotation);

    //run sql to select all the quotation_line
    $sql_quotation_line = "SELECT quotation_line.*, item.* FROM quotation_line
                    JOIN item ON quotation_line.item_id = item.item_id
                    WHERE quotation_line.quotation_id = '$convert_quotation_id'";

    //connect to db via $db and execute the sql
    $result_quotation_line = mysqli_query($db, $sql_quotation_line);
    
    //declare timezone and current date, time
    date_default_timezone_set("Asia/Ho_Chi_Minh");
    $creationDateTime = date("Y-m-d H:i:s");

    //set the variables because some variables are set by default
    $user_id = "1";
    $order_create_date_time = $creationDateTime;
    $order_close_date_time = "";
    $order_status = "Processed";
    $order_note = $result_quotation['quotation_note'];
    $order_total = $result_quotation['quotation_total'];
    $tax = $result_quotation['quotation_tax'];
    $net_total_price = $result_quotation['quotation_net_total'];
    $order_reference = $convert_quotation_id;
    $customer_id = $result_quotation['customer_id'];

    //set the array
    $order_line_create_date_time = $creationDateTime;
    $order_line_item_id = $result_quotation_line['quotation_line_item_id'];
    $order_line_item_quantity = $result_quotation_line['quotation_line_item_quantity'];
    $item_vendor = $result_quotation_line['item_vendor'];
    $order_line_delivery_date = "";
    $order_line_selling_price = $result_quotation_line['quotation_line_estimate_price'];
    $order_line_net_selling_price = $result_quotation_line['quotation_line_estimate_net_price'];

    //Get the last record in order table to define the new order_id
    $sql_get_the_last_record_id = "SELECT order_id from customer_order ORDER BY order_id DESC LIMIT 1";
    $result_get_the_last_record_id = mysqli_query($db, $sql_get_the_last_record_id);

    //get the last record id and increase it by one. then assign that value to the new order ID
    $row_last_record_id = mysqli_fetch_assoc($result_get_the_last_record_id);
    $order_id = $row_last_record_id["order_id"] + 1;
    
    $sql_convert = "INSERT INTO customer_order(
                  order_id, user_id,
                  order_create_date,
                  order_close_date,
                  order_status, order_note,
                  customer_id, order_total, order_reference)
              VALUES (
                  '$order_id','$user_id',
                  '$order_create_date_time',
                  '$order_close_date_time',
                  '$order_status','$order_note',
                  '$customer_id','$order_total','')";

    //run the query. if fail, echo the error message
    $query = mysqli_query($db,$sql_convert) or die ("Error: Cannot create order");

    //if success, echo the success message
    echo "successfully create order id = " . $order_id;

    for ($i = 0; $i < count($order_line_item_id); $i++) {

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
        order_line_create_date,
        order_line_item_id, order_line_item_quantity,
        order_line_deliver_date,
        order_line_selling_price, order_line_net_selling_price)
        VALUES (
        '$order_line_id','$order_id',
        '$order_line_create_date_time',
        '$order_line_item_id[$i]','$order_line_item_quantity[$i]',
        '$order_line_delivery_date[$i]',
        '$order_line_selling_price[$i]','$order_line_net_selling_price[$i]')";

        //run the query. if fail, echo the error message
        $query_order_line = mysqli_query($db,$sql_query_order_line) or die ("Error: Cannot create order_line");
    }
}
//if success, echo the success message
//echo "successfully create order id = " . $order_line_id[$key];
header("Location:../html/sale.html#order");