<?php
/**
 * Created by PhpStorm.
 * User: s3359025
 * Date: 4/26/2016
 * Time: 7:43 PM
 */

//Connect to database via $db
include '../config.php';

//Get customer_id and customer tax code in the customer table
$sql_select_authority = "SELECT role_id, role_name from authority";
$result_select_authority = mysqli_query($db, $sql_select_authority);

//Get the last record in customer table to define the new customer_id
$sql_get_the_last_record_id = "SELECT role_id from authority ORDER BY role_id DESC LIMIT 1";
$result_get_the_last_record_id = mysqli_query($db, $sql_get_the_last_record_id);

//Set up found and success_added parameter
$found_role = 0;
$success_added = 0;

//Find out if the tax code is existing in the current database or not
while($row_select_authority = mysqli_fetch_assoc($result_select_authority)) {
    //echo $row_select_customer["role_id"] . "<br>";
    if ($_POST['role_name'] == $row_select_authority["role_name"]) {

        $found_role = 1;
        echo "Existing role is found at customer ID = " . $row_select_authority["role_id"];
        break;
    }
}

$accessible_page_array = $_POST['pages'];
$accessible_page = $accessible_page_array[0];

for ($i = 1; $i < count($accessible_page_array); $i++){
    $accessible_page = $accessible_page."|".$accessible_page_array[$i];
}

//If found no existing tax code, then create a new role record
if ($found_role == 0) {

    //get the last record id and increase it by one. then assign that value to the new customer ID
    $row_last_record_id = mysqli_fetch_assoc($result_get_the_last_record_id);
    $role_id = $row_last_record_id["role_id"] + 1;

    //Create new role with info from the URL POST method
    mysqli_query($db, "INSERT INTO authority (role_id, role_name, pages, user_id) VALUES ('$role_id','$_POST[role_name]','$accessible_page', '$_POST[user_id]')");

    //Check if the creation is successful
    //Get the newest last role_id
    $sql_get_the_last_record_id_updated = "SELECT role_id from authority ORDER BY role_id DESC LIMIT 1";
    $result_get_the_last_record_id_updated = mysqli_query($db, $sql_get_the_last_record_id_updated);
    $row_last_record_id_updated = mysqli_fetch_assoc($result_get_the_last_record_id_updated);

    //Check if the last role_id is equal to the newly added role_id
    if ($row_last_record_id_updated["role_id"] == $role_id) {
        //echo the success message
        echo "Successfully saved new authority. Role ID is " . $role_id;
        $success_added = 1;
    }
    else
    {
        echo "Failed to create new role.";
    }
}

if ($success_added == 1){
    echo "<script type='text/javascript'> alert (\"Successfully added role ID = " . $role_id . "\")</script>";
}
else
{
    echo "<script type='text/javascript'> alert (\"Failed to add role\")</script>";
}

?>
