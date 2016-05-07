<?php
/**
 * Created by :Hoang Anh
 * Date: 09/04/2016
 * Time: 4:27 PM
 */

//Connect to database via $db
include '../config.php';

//declare timezone and current date, time
date_default_timezone_set("Asia/Ho_Chi_Minh");
$creationDateTime = date("Y-m-d H:i:s");

//set the variables because some variables are set by default
$user_id = "1";
$transaction_create_date_time = $creationDateTime;
$transaction_close_date_time = "";
$warehouse_id = $_POST['warehouse_id'];
$storage_location_id = $_POST['storage_location_id'];
$transaction_total_cost= $_POST['total_transaction'];
//$transaction_total_quantity= $_POST['total_quantity'];
$transaction_type= "Receipt";
$transaction_bill_number = $_POST['warehouse_supplier_receive_bill_number'];

//set the array
$transaction_line_item_id = $_POST['item_id'];
$transaction_line_item_quantity = $_POST['item_quantity'];
$transaction_line_item_cost = $_POST['item_cost'];
$transaction_line_total_cost = $_POST['item_total_cost'];
$transaction_line_vendor = $_POST['item_vendor'];

//Get the last record in order table to define the new transaction_id
$sql_get_the_last_record_id = "SELECT warehouse_transaction_id from warehouse_transaction ORDER BY warehouse_transaction_id DESC LIMIT 1";
$result_get_the_last_record_id = mysqli_query($db, $sql_get_the_last_record_id);

//get the last record id and increase it by one. then assign that value to the new warehouse transaction ID
$row_last_record_id = mysqli_fetch_assoc($result_get_the_last_record_id);
$warehouse_transaction_id = $row_last_record_id["warehouse_transaction_id"] + 1;

//establish sql query to create order with the warehouse_transaction_id and relevant details
$sql_query = "INSERT INTO warehouse_transaction(
                  warehouse_transaction_id,
                  warehouse_transaction_user_id,
				  warehouse_transaction_create_date,
                  warehouse_transaction_close_date,
                  warehouse_transaction_type,
                  warehouse_transaction_total_value,
                  warehouse_transaction_order_id)
              VALUES (
                  '$warehouse_transaction_id',
                  '$user_id',
                  '$transaction_create_date_time',
				  '$transaction_close_date_time',
				  '$transaction_type',
                  '$transaction_total_cost',
                  '$transaction_bill_number')";

echo $sql_query;
//run the query. if fail, echo the error message
$query = mysqli_query($db,$sql_query) or die ("Error: Cannot create transaction");

//if success, echo the success message
//echo "successfully create order id = " . $_POST['warehouse_transaction_id'];

for ($i = 0; $i < count($transaction_line_item_id); $i++) {

    //Get the last record in order_line table to define the new warehouse_transaction_line_id
    $sql_get_the_last_record_transaction_line_id = "SELECT warehouse_transaction_line_id from warehouse_transaction_line ORDER BY warehouse_transaction_line_id DESC LIMIT 1";
    $result_get_the_last_record_transaction_line_id = mysqli_query($db, $sql_get_the_last_record_transaction_line_id);

    //get the last record id and increase it by one. then assign that value to the new order line ID
    $row_last_record_transaction_line_id = mysqli_fetch_assoc($result_get_the_last_record_transaction_line_id);
    $warehouse_transaction_line_id = $row_last_record_transaction_line_id["warehouse_transaction_line_id"] + 1;

    //establish sql query to create order line with the warehouse_transaction_line_id and relevant details
    $sql_query_transaction_line = "
      INSERT INTO warehouse_transaction_line
      (
        warehouse_transaction_line_id,
        warehouse_transaction_line_item_id,
        warehouse_transaction_line_cost,
        warehouse_transaction_line_quantity,
        warehouse_transaction_line_total_cost,
        warehouse_transaction_id,
        warehouse_transaction_line_order_line_id,
        warehouse_transaction_line_date,
        warehouse_transaction_line_storage_location_id
        )
        VALUES (
        '$warehouse_transaction_line_id',
		'$transaction_line_item_id[$i]',
		'$transaction_line_item_cost[$i]',
        '$transaction_line_item_quantity[$i]',
        '$transaction_line_total_cost[$i]',
		'$warehouse_transaction_id',
		'$transaction_bill_number',
		'$creationDateTime',
		'$storage_location_id')";
echo $sql_query_transaction_line;       
    //run the query. if fail, echo the error message
    $query_transaction_line = mysqli_query($db,$sql_query_transaction_line) or die ("Error: Cannot create transaction_line");

    // update the item quantity
    $query_get_item_quantity = mysqli_query($db, "SELECT item_quantity, item_cost FROM item WHERE item_id = '$transaction_line_item_id[$i]'");
    $row_item = mysqli_fetch_assoc($query_get_item_quantity);
    $item_current_quantity = $row_item['item_quantity'];
    $item_current_cost = $row_item['item_cost'];
    $item_update_quantity = $item_current_quantity + $transaction_line_item_quantity[$i];
    $item_update_cost = ($item_current_cost * $item_current_quantity + $transaction_line_total_cost[$i])/$item_update_quantity;
    $query_update_item_quantity = mysqli_query($db, "UPDATE item SET item_quantity = '$item_update_quantity', item_cost = '$item_update_cost' WHERE item_id = '$transaction_line_item_id[$i]'");

    // update item storage location
    $query_get_item_storage_location_create = mysqli_query($db, "SELECT item_storage_location_id FROM item_storage_location ORDER BY  item_storage_location_id DESC LIMIT 1");
    $row_item_storage_location_last_record = mysqli_fetch_assoc($query_get_item_storage_location_create);
    $new_item_storage_location_id = $row_item_storage_location_last_record['item_storage_location_id'] + 1;
    $query_update_item_storage_location_quantity = mysqli_query($db, "INSERT INTO item_storage_location (item_storage_location_id, item_id, storage_location_id, item_storage_location_quantity) VALUES ('$new_item_storage_location_id', '$transaction_line_item_id[$i]', '$storage_location_id', '$transaction_line_item_quantity[$i]')");
    echo "INSERT INTO item_storage_location (item_storage_location_id, item_id, storage_location_id, item_storage_location_quantity) VALUES ('$new_item_storage_location_id', '$transaction_line_item_id[$i]', '$storage_location_id', '$transaction_line_item_quantity[$i]')";
}
//if success, echo the success message
//echo "successfully create order id = " . $order_line_id[$key];
header("Location:../html/inventory.html#storagelocation");
?>