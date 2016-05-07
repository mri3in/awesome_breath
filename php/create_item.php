<?php
/**
 * Created by PhpStorm.
 * User: Hai Phong
 * Date: 3/2/2016
 * Time: 5:06 PM
 */

    //Connect to database via $db
    include ('../config.php');

	//Get item_id item table
    $sql_select_item = "SELECT item_id from item";
    $result_select_item = mysqli_query($db, $sql_select_item);

    //Get the last record in item table to define the new item_id
    //$sql_last_record_id = "SELECT item_id from item ORDER BY item_id DESC LIMIT 1";
    //$result_last_record_id = mysqli_query($db, $sql_last_record_id);

    //Set up found and success_added parameter
    $found_item = 0;
    $success_added = 0;

    //Find out if the item is existing in the current database or not
    while($row_select_item = mysqli_fetch_assoc($result_select_item)) {
        if ($_POST['item_id'] == $row_select_item["item_id"]) {
            $found_item = 1;
            echo "Existing item is found at item ID = " . $row_select_item["item_id"];
            break;
        }
    }

    //If found no existing item, then create a new item record
    if ($found_item == 0) {

        //get the last record id and increase it by one. then assign that value to the new customer ID
        //$row_last_record_id = mysqli_fetch_assoc($result_last_record_id);
        $item_id = $_POST["item_id"];
		$file_get = $_FILES['item_photo']['name'];
		$temp = $_FILES['item_photo']['tmp_name'];
		$item_status="Active";

		$file_to_saved = "../images/".$file_get; //Documents folder, should exist in  your host in there you're going to save the file just uploaded
		move_uploaded_file($temp, $file_to_saved);
		
        //Create new customer with info from the URL POST method
        mysqli_query($db, "INSERT INTO item (item_id, item_category_id, item_name, item_unit_of_measurement, item_expiry_period, item_cost, item_unit_price, item_power, item_power_unit, item_phase, item_voltage_low, item_voltage_high, item_frequency, item_diameter, item_capacity, item_area, item_description, item_VAT, item_vendor, item_manufacturer, item_quantity,item_photo,item_status) 
		VALUES ('$_POST[item_id]','$_POST[item_category]','$_POST[item_name]','$_POST[item_unit_of_measurement]','$_POST[item_expiry_period]','$_POST[item_cost]','$_POST[item_unit_price]','$_POST[item_power]','$_POST[item_power_unit]',
'$_POST[item_phase]','$_POST[item_voltage_low]','$_POST[item_voltage_high]','$_POST[item_frequency]','$_POST[item_diameter])','$_POST[item_capacity]','$_POST[item_area]','$_POST[item_description]','$_POST[item_vat]',
'$_POST[item_vendor]','$_POST[item_manufacturer]','$_POST[item_quantity]','$file_to_saved','$item_status')");
    
    } 

header ('location:../html/inventory.html#item');
?>