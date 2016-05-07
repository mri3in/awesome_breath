<?php
/**
 * Created by PhpStorm.
 * User: Hai Phong
 * Date: 4/7/2016
 * Time: 2:44 AM
 */

//Connect to database via $db
include ('../config.php');

//get the param in URL of storage_location_id
$edit_storage_location_id = $_POST['storage_location_id'];

//Create new customer with info from the URL POST method
mysqli_query($db, "UPDATE storage_location SET
                                        storage_location_shelf = '$_POST[storage_location_shelf]',
                                        storage_location_row = '$_POST[storage_location_row]',
                                        storage_location_column = '$_POST[storage_location_column]',
                                        storage_location_condition = '$_POST[storage_condition]'
                                        WHERE storage_location_id = '$edit_storage_location_id'");

header("Location:../html/inventory.html#tab_storagelocation");
