<?php
/**
 * Created by PhpStorm.
 * User: Hai Phong
 * Date: 3/2/2016
 * Time: 5:06 PM
 */

    //Connect to database via $db
    include ('../config.php');

    //get the street + city and concatenate them to make the shipping & billing address
    $customer_shipping_address = $_POST["customer_shipping_address_street"].";".$_POST["customer_shipping_address_city"].";".$_POST["customer_shipping_address_country"];
    $customer_billing_address = $_POST["customer_billing_address_street"].";".$_POST["customer_billing_address_city"].";".$_POST["customer_billing_address_country"];

    //Get customer_id and customer tax code in the customer table
    $sql_select_customer = "SELECT customer_id, customer_tax_code from customer";
    $result_select_customer = mysqli_query($db, $sql_select_customer);

    //Get the last record in customer table to define the new customer_id
    $sql_get_the_last_record_id = "SELECT customer_id from customer ORDER BY customer_id DESC LIMIT 1";
    $result_get_the_last_record_id = mysqli_query($db, $sql_get_the_last_record_id);

    //Set up found and success_added parameter
    $found_customer = 0;
    $success_added = 0;

    //Find out if the tax code is existing in the current database or not
    while($row_select_customer = mysqli_fetch_assoc($result_select_customer)) {
        //echo $row_select_customer["customer_id"] . "<br>";
        if ($_POST['customer_tax_code'] == $row_select_customer["customer_tax_code"]) {
    //    if ($row_select_customer["customer_tax_code"] == "11234282228") {
            $found_customer = 1;
            echo "Existing customer is found at customer ID = " . $row_select_customer["customer_id"];
            break;
        }
    }

    //If found no existing tax code, then create a new customer record
    if ($found_customer == 0) {

        //get the last record id and increase it by one. then assign that value to the new customer ID
        $row_last_record_id = mysqli_fetch_assoc($result_get_the_last_record_id);
        $customer_id = $row_last_record_id["customer_id"] + 1;

        //Create new customer with info from the URL POST method
        mysqli_query($db, "INSERT INTO customer (customer_id, customer_name, customer_long_name, customer_billing_address, customer_shipping_address, customer_tax_code, customer_credit_limit, customer_payment_term, customer_phone_number, staff_id, customer_contact_person_name,  customer_contact_person_phone_number, customer_contact_person_email, customer_status) VALUES ('$customer_id','$_POST[customer_name]','$_POST[customer_long_name]','$customer_billing_address','$customer_shipping_address','$_POST[customer_tax_code]','$_POST[customer_credit_limit]','$_POST[customer_payment_term]','$_POST[customer_phone_number]', '$_POST[staff_id]',
'$_POST[customer_contact_person_name]','$_POST[customer_contact_person_phone_number]','$_POST[customer_contact_person_email]','$_POST[customer_status]')");

        //Check if the creation is successful
        //Get the newest last customer_id
        $sql_get_the_last_record_id_updated = "SELECT customer_id from customer ORDER BY customer_id DESC LIMIT 1";
        $result_get_the_last_record_id_updated = mysqli_query($db, $sql_get_the_last_record_id_updated);
        $row_last_record_id_updated = mysqli_fetch_assoc($result_get_the_last_record_id_updated);

        //Check if the last customer_id is equal to the newly added customer_id
        if ($row_last_record_id_updated["customer_id"] == $customer_id) {
            //echo the success message
            echo "Successfully saved new customer. Customer ID is " . $customer_id;
            $success_added = 1;
        }
        else
        {
            echo "Failed to create new customer.";
        }
    }

    if ($success_added == 1){
        echo "<script type='text/javascript'> alert (\"Successfully added customer ID = " . $customer_id . "\")</script>";
    }
    else
    {
        echo "<script type='text/javascript'> alert (\"Failed to add customer\")</script>";
    }
    // redirect to customer tab
    header("Location:../html/sale.html#customer");
?>