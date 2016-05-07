<?php
/**
 * Created by PhpStorm.
 * User: Hai Phong
 * Date: 4/7/2016
 * Time: 2:44 AM
 */

//Connect to database via $db
include ('../config.php');

//get the param in URL of warehouse_id
$edit_warehouse_id = $_POST['warehouse_id'];

//get the street + city and concatenate them to make the warehouse address
$warehouse_location = $_POST["warehouse_location_street"] . ";" . $_POST["warehouse_location_city"] . ";" . $_POST["warehouse_location_country"];

//get the item category and the first element of array
$warehouse_item_category_array = $_POST["warehouse_item_category"];
$warehouse_item_category = $warehouse_item_category_array[0];

//get all the elements of array and concatenate them
for ($i = 1; $i < count($warehouse_item_category_array); $i++) {
    $warehouse_item_category = $warehouse_item_category . ";" . $warehouse_item_category_array[$i];
}

//Create new customer with info from the URL POST method
mysqli_query($db, "UPDATE warehouse SET
    warehouse_location = '$warehouse_location',
    warehouse_capacity = '$_POST[warehouse_capacity]',
    warehouse_name = '$_POST[warehouse_name]',
    warehouse_supervisor_id = '$_POST[staff_id]',
    warehouse_item_category = '$warehouse_item_category'
    WHERE warehouse_id = '$edit_warehouse_id'");

header("Location:../html/inventory.html#tab_warehouse");