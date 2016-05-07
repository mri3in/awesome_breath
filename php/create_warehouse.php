<?php
/**
 * Created by PhpStorm.
 * User: Hai Phong
 * Date: 4/4/2016
 * Time: 11:27 PM
 */

//Connect to database via $db
include ('../config.php');

//get the street + city and concatenate them to make the warehouse address
$warehouse_location = $_POST["warehouse_location_street"].";".$_POST["warehouse_location_city"].";".$_POST["warehouse_location_country"];

//get the item category and the first element of array
$warehouse_item_category_array = $_POST["warehouse_item_category"];
$warehouse_item_category = $warehouse_item_category_array[0];

//get all the elements of array and concatenate them
for ($i = 1; $i < count($warehouse_item_category_array); $i++){
    $warehouse_item_category =  $warehouse_item_category . ";" . $warehouse_item_category_array[$i];
}

//Get the last record in warehouse table to define the new warehouse_id
$sql_last_record_id = "SELECT warehouse_id from warehouse ORDER BY warehouse_id DESC LIMIT 1";
$result_last_record_id = mysqli_query($db, $sql_last_record_id);

//get the last record id and increase it by one. then assign that value to the new customer ID
$row_last_record_id = mysqli_fetch_assoc($result_last_record_id);
$warehouse_id = $row_last_record_id["warehouse_id"] + 1;

//Create new customer with info from the URL POST method
mysqli_query($db, "INSERT INTO warehouse(warehouse_id, warehouse_location, warehouse_capacity, warehouse_name, warehouse_supervisor_id, warehouse_item_category) 
		VALUES ('$warehouse_id','$warehouse_location','$_POST[warehouse_capacity]','$_POST[warehouse_name]','$_POST[staff_id]','$warehouse_item_category')");

header("Location:../html/inventory.html#tab_warehouse");