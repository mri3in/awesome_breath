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

    //echo $customer_billing_address;
    //echo $customer_shipping_address;

    //establish sql query to update user with the customer_id and relevant details
    $sql_query = "update customer 
                  set 
                  customer_name = '$_POST[customer_name]', 
                  customer_long_name = '$_POST[customer_long_name]', 
                  customer_billing_address = '$customer_billing_address',
                  customer_shipping_address = '$customer_shipping_address',
                  customer_tax_code = '$_POST[customer_tax_code]', 
                  customer_credit_limit = '$_POST[customer_credit_limit]', 
                  customer_payment_term = '$_POST[customer_payment_term]', 
                  staff_id = '$_POST[staff_id]',
                  customer_phone_number = '$_POST[customer_phone_number]',
                  customer_contact_person_name = '$_POST[customer_contact_person_name]', 
                  customer_contact_person_phone_number = '$_POST[customer_contact_person_phone_number]', 
                  customer_contact_person_email = '$_POST[customer_contact_person_email]',
                  customer_status = '$_POST[customer_status]'
                  WHERE customer_id = '$_POST[customer_id]'";

    //run the query. if fail, echo the error message
    $query = mysqli_query($db,$sql_query) or die ("Error: Cannot edit customer");

    //if success, echo the success message
    echo "successfully edit customer name = " . $_POST['customer_name'];

    // redirect to customer tab
    header("Location:../html/sale.html#customer");
?>