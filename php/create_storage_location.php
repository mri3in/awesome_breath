<?php
/**
 * Created by PhpStorm.
 * User: Hai Phong
 * Date: 4/13/2016
 * Time: 1:05 AM
 */

//Connect to database via $db
include ('../config.php');

//Get the last record in storage_location table to define the new storage_location_id
$sql_last_record_id = "SELECT storage_location_id from storage_location ORDER BY storage_location_id DESC LIMIT 1";
$result_last_record_id = mysqli_query($db, $sql_last_record_id);

//get the last record id and increase it by one. then assign that value to the new customer ID
$row_last_record_id = mysqli_fetch_assoc($result_last_record_id);
$storage_location_id = $row_last_record_id["storage_location_id"] + 1;

//Create new customer with info from the URL POST method
mysqli_query($db, "INSERT INTO storage_location(storage_location_id, storage_location_shelf, storage_location_row, storage_location_column, storage_location_condition, storage_location_warehouse_id)
		VALUES ('$storage_location_id','$_POST[storage_location_shelf]','$_POST[storage_location_row]','$_POST[storage_location_column]','$_POST[storage_condition]','$_POST[warehouse_id]')");

header("Location:../html/inventory.html#tab_storagelocation");