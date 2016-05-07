<?php
/**
 * Created by PhpStorm.
 * User: Hai Phong
 * Date: 5/1/2016
 * Time: 11:25 AM
 */

//include the definition of database
include('../config.php');

$creation_date = $_POST['transaction_date'];
//set the variables because some variables are set by default
$user_id = "1";
$warehouse_transaction_close_date_time = "";
$order_id = $_POST['order_id'];
$transaction_status = "Pending";
$transaction_type = "Issue";
$total_value = $_POST['total'];
$note = $_POST['issue_note'];

//set the array
$order_line_id = $_POST['order_line_id'];
$item_id = $_POST['item_id'];
$item_name = $_POST['item_name'];
$issue_quantity = $_POST['issue_quantity'];
$item_storage_location_id = $_POST['storage_location_id'];
$inStock = $_POST['inStock'];
$transaction_line_value = $_POST['transaction_line_value'];

//Get the last record in order table to define the new order_id
$sql_get_the_last_record_id = "SELECT warehouse_transaction_id from warehouse_transaction ORDER BY warehouse_transaction_id DESC LIMIT 1";
$result_get_the_last_record_id = mysqli_query($db, $sql_get_the_last_record_id);

//get the last record id and increase it by one. then assign that value to the new order ID
$row_last_record_id = mysqli_fetch_assoc($result_get_the_last_record_id);
$warehouse_transaction_id = $row_last_record_id["warehouse_transaction_id"] + 1;

//establish sql query to create order with the order_id and relevant details
$sql_query = "INSERT INTO warehouse_transaction(
                    warehouse_transaction_id,
                    warehouse_transaction_create_date,
                    warehouse_transaction_close_date,
                    warehouse_transaction_user_id,
                    warehouse_transaction_order_id,
                    warehouse_transaction_status,
                    warehouse_transaction_type,
                    warehouse_transaction_total_value
                  )
                VALUES(
                  '$warehouse_transaction_id',
                  '$creation_date',
                  '$warehouse_transaction_close_date_time',
                  '$user_id',
                  '$order_id',
                  '$transaction_status',
                  '$transaction_type',
                  '$total_value'
                  )";
echo $sql_query. "<br>";
//run the query. if fail, echo the error message
$query = mysqli_query($db,$sql_query) or die ("Error: Cannot create warehouse transaction");

//if success, echo the success message
echo "successfully create warehouse transaction = " . $warehouse_transaction_id;

for ($i = 0; $i < count($item_id); $i++) {

    //Get the last record in order_line table to define the new order_line_id
    $sql_get_the_last_record_warehouse_transaction_line_id = "SELECT warehouse_transaction_line_id FROM warehouse_transaction_line ORDER BY warehouse_transaction_line_id DESC LIMIT 1";
    $result_get_the_last_record_warehouse_transaction_line_id = mysqli_query($db, $sql_get_the_last_record_warehouse_transaction_line_id);

    //get the last record id and increase it by one. then assign that value to the new order line ID
    $row_last_record_warehouse_transaction_line_id = mysqli_fetch_assoc($result_get_the_last_record_warehouse_transaction_line_id);
    $warehouse_transaction_line_id = $row_last_record_warehouse_transaction_line_id["warehouse_transaction_line_id"] + 1;

    //establish sql query to create order line with the order_line_id and relevant details
    $sql_query_warehouse_transaction_line = "
      INSERT INTO warehouse_transaction_line(
            warehouse_transaction_line_id,
            warehouse_transaction_line_item_id,
            warehouse_transaction_line_quantity,
            warehouse_transaction_line_date,
            warehouse_transaction_line_cost,
            warehouse_transaction_line_total_cost,
            warehouse_transaction_id,
            warehouse_transaction_line_order_line_id,
            warehouse_transaction_line_storage_location_id
          )
        VALUES(
        '$warehouse_transaction_line_id',
        '$item_id[$i]',
        '$issue_quantity[$i]',
        '$creation_date',
        '',
        '',
        '$warehouse_transaction_id',
        '$order_line_id[$i]',
        '$item_storage_location_id[$i]')";

    //run the query. if fail, echo the error message
    $query_warehouse_transaction_line = mysqli_query($db, $sql_query_warehouse_transaction_line) or die ("Error: Cannot create warehouse transaction line");

    // update the item quantity
    $query_get_item_quantity = mysqli_query($db, "SELECT item_quantity FROM item WHERE item_id = '$item_id[$i]'");
    $row_item = mysqli_fetch_assoc($query_get_item_quantity);
    $item_current_quantity = $row_item['item_quantity'];
    $item_update_quantity = $item_current_quantity - $issue_quantity[$i];
    $query_update_item_quantity = mysqli_query($db, "UPDATE item SET item_quantity = '$item_update_quantity' WHERE item_id = '$item_id[$i]'");

    // update item storage location
    $query_get_item_storage_quantity = mysqli_query($db, "SELECT item_storage_location_quantity FROM item_storage_location WHERE item_storage_location_id = '$item_storage_location_id[$i]'");
    echo "<br><br> item storage location id: ".$item_storage_location_id[$i];
    $row_item_storage_location = mysqli_fetch_assoc($query_get_item_storage_quantity);
    $item_storage_location_current_quantity = $row_item_storage_location['item_storage_location_quantity'];
    echo "<br><br> Item current quantity: ".$item_storage_location_current_quantity;
    $item_storage_location_update_quantity = $item_storage_location_current_quantity - $issue_quantity[$i];
    echo "<br><br> Item update quantity: ".$item_storage_location_update_quantity;
    $query_update_item_storage_location_quantity = mysqli_query($db, "UPDATE item_storage_location SET item_storage_location_quantity = '$item_storage_location_update_quantity' WHERE item_storage_location_id = '$item_storage_location_id[$i]'");

    // update order _ order_line status
    mysqli_query($db, "UPDATE customer_order SET order_status = 'Shipped' WHERE order_id = '$order_id'");
    mysqli_query($db, "UPDATE order_line SET order_line_deliver_status = 'Shipped', order_line_item_issued_quantity = '$issue_quantity[$i]' WHERE order_line_id = '$order_line_id[$i]'");
}
    //if success, echo the success message
    //echo "successfully create order id = " . $order_line_id[$key];
    header("Location:../html/sale.html#order");
?>