<?php
/**
 * Created by PhpStorm.
 * User: Hai Phong
 * Date: 3/2/2016
 * Time: 5:06 PM
 */

    //Connect to database via $db
    include ('../config.php');

	
    //establish sql query to update user with the item_id and relevant details
    $sql_query = "update item
                  set 
				  item_id = '$_POST[item_id]',
                  item_category_id = '$_POST[item_category]', 
                  item_name= '$_POST[item_name]',
                  item_unit_of_measurement = '$_POST[item_unit_of_measurement]',
                  item_expiry_period = '$_POST[item_expiry_period]', 
                  item_cost = '$_POST[item_cost]', 
                  item_unit_price = '$_POST[item_unit_price]', 
                  item_power = '$_POST[item_power]',
                  item_power_unit = '$_POST[item_power_unit]', 
                  item_phase = '$_POST[item_phase]', 
                  item_voltage_low = '$_POST[item_voltage_low]',
                  item_voltage_high = '$_POST[item_voltage_high]',
				  item_frequency = '$_POST[item_frequency]',
				  item_diameter = '$_POST[item_diameter]',
				  item_capacity = '$_POST[item_capacity]',
				  item_area = '$_POST[item_area]',
				  item_description = '$_POST[item_description]',
				  item_VAT = '$_POST[item_vat]',
				  item_vendor = '$_POST[item_vendor]',
				  item_manufacturer = '$_POST[item_manufacturer]',
				  item_quantity = '$_POST[item_quantity]'
				  WHERE item_id = '$_POST[item_id]'";

//echo $sql_query;
	//run the query. if fail, echo the error message
    $query = mysqli_query($db,$sql_query) or die ("Error: Cannot edit item");

    //if success, echo the success message
    echo "successfully edit item = " . $_POST['item_id'];

    // redirect to inventory tab
header ('location:../html/inventory.html#item');
?>