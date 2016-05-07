<?php
/**
 * Created by PhpStorm.
 * User: Hai Phong
 * Date: 3/18/2016
 * Time: 4:27 PM
 */

//Connect to database via $db
include ('../config.php');

//declare timezone and current date, time
date_default_timezone_set("Asia/Ho_Chi_Minh");
$creationDateTime = date("Y-m-d H:i:s");

//set the variables because some variables are set by default
$user_id = "1";
$quotation_create_date_time = $creationDateTime;
$quotation_close_date_time = "";
$quotation_status = $_POST['quotation_status'];
$quotation_note = $_POST['quotation_note'];
$quotation_total = $_POST['total_quotation'];
$tax = $_POST['tax'];
$net_total_price = $_POST['net_total_price'];
//$quotation_reference = $_POST['quotation_reference'];
$customer_id = $_POST['customer_id'];
$quotation_net_total = $_POST['net_total_price'];
$quotation_shipping_address = $_POST["customer_shipping_address_street"].";".$_POST["customer_shipping_address_city"].";".$_POST["customer_shipping_address_country"];

//set the array
$quotation_line_create_date_time = $creationDateTime;
$quotation_line_item_id = $_POST['item_id'];
$quotation_line_item_quantity = $_POST['quotation_line_item_quantity'];
$item_vendor = $_POST['item_vendor'];
$quotation_line_estimate_selling_price = $_POST['quotation_line_estimate_price'];
$quotation_line_estimate_net_selling_price = $_POST['quotation_line_estimate_net_price'];

//Get the last record in quotation table to define the new quotation_id
$sql_get_the_last_record_id = "SELECT quotation_id from quotation ORDER BY quotation_id DESC LIMIT 1";
$result_get_the_last_record_id = mysqli_query($db, $sql_get_the_last_record_id);

//get the last record id and increase it by one. then assign that value to the new quotation ID
$row_last_record_id = mysqli_fetch_assoc($result_get_the_last_record_id);
$quotation_id = $row_last_record_id["quotation_id"] + 1;

//establish sql query to create quotation with the quotation_id and relevant details
$sql_query = "INSERT INTO quotation(
                  quotation_id, user_id,
                  quotation_create_date,
                  quotation_close_date,
                  quotation_status, quotation_note,
                  customer_id, quotation_total, quotation_tax, quotation_net_total, quotation_shipping_address)
              VALUES (
                  '$quotation_id','$user_id',
                  '$quotation_create_date_time',
                  '$quotation_close_date_time',
                  '$quotation_status','$quotation_note',
                  '$customer_id','$quotation_total', '$tax', '$quotation_net_total', '$quotation_shipping_address')";

//run the query. if fail, echo the error message
$query = mysqli_query($db,$sql_query) or die ("Error: Cannot create quotation");

//if success, echo the success message
echo "successfully create quotation id = " . $quotation_id;

for ($i = 0; $i < count($quotation_line_item_id); $i++) {

    //Get the last record in quotation_line table to define the new quotation_line_id
    $sql_get_the_last_record_quotation_line_id = "SELECT quotation_line_id from quotation_line ORDER BY quotation_line_id DESC LIMIT 1";
    $result_get_the_last_record_quotation_line_id = mysqli_query($db, $sql_get_the_last_record_quotation_line_id);

    //get the last record id and increase it by one. then assign that value to the new quotation line ID
    $row_last_record_quotation_line_id = mysqli_fetch_assoc($result_get_the_last_record_quotation_line_id);
    $quotation_line_id = $row_last_record_quotation_line_id["quotation_line_id"] + 1;

    //establish sql query to create quotation line with the quotation_line_id and relevant details
    $sql_query_quotation_line = "
      INSERT INTO quotation_line(
        quotation_line_id, quotation_id,
        quotation_line_create_date,
        quotation_line_item_id, quotation_line_item_quantity,
        quotation_line_estimate_price, quotation_line_estimate_net_price)
        VALUES (
        $quotation_line_id,$quotation_id,
        '$quotation_line_create_date_time',
        '$quotation_line_item_id[$i]','$quotation_line_item_quantity[$i]',
        '$quotation_line_estimate_selling_price[$i]','$quotation_line_estimate_net_selling_price[$i]')";

    //run the query. if fail, echo the error message
    $query_quotation_line = mysqli_query($db,$sql_query_quotation_line) or die ("Error: Cannot create quotation_line");
    echo $sql_query_quotation_line."<br><br>";
}

//if success, echo the success message
//echo "successfully create order id = " . $order_line_id[$key];
header("Location:../html/sale.html#quotation");
?>