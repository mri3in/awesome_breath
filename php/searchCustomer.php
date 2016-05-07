<?php
    // declare the json array
    $jsonCustomer = array();

    //get the params on URL after the search
    $customer_id = $_GET['search'];

    // create sql query
    $result_customer =  mysqli_query($db, "SELECT *, staff.staff_name FROM customer JOIN staff ON customer.staff_id = staff.staff_id WHERE customer_id = '$customer_id'");

    // store errors
    if (mysqli_connect_errno()) {
        $customer_array = array(
            'error' => mysqli_connect_error(),
            'result' => "error"
        );
        array_push($jsonCustomer, $customer_array);
    }
    else if (!$result_customer){
        $customer_array = array(
            'error' => mysqli_error($db),
            'result' => "error"
        );
        array_push($jsonCustomer, $customer_array);
    }
    else {
        // fetch the customer data to array
        while ($row_customer = mysqli_fetch_array($result_customer)) {
            //split the string billing address based on semi-colon
            $customer_billing_address = $row_customer['customer_billing_address'];

            //declare 3 variables as blank to prevent no data from the string
            $customer_billing_address_street = "";
            $customer_billing_address_city = "";
            $customer_billing_address_country = "";

            //split the string and assign to the variables
            if ($customer_billing_address != ""){
                list($customer_billing_address_street, $customer_billing_address_city, $customer_billing_address_country) = explode(";", $customer_billing_address);
            }

            //split the string shipping address based on semi-colon
            $customer_shipping_address = $row_customer['customer_shipping_address'];

            //declare 3 variables as blank to prevent no data from the string
            $customer_shipping_address_street = "";
            $customer_shipping_address_city = "";
            $customer_shipping_address_country = "";

            //split the string and assign to the variables
            if ($customer_shipping_address != ""){
                list($customer_shipping_address_street, $customer_shipping_address_city, $customer_shipping_address_country) = explode(";", $customer_shipping_address);
            }

            $customer_array = array(
                'customerName' => $row_customer['customer_name'],
                'customerLongName' => $row_customer['customer_long_name'],

                'customerTaxCode' => $row_customer['customer_tax_code'],
                'customerPhoneNumber' => $row_customer['customer_phone_number'],
                'customerStatus' => $row_customer['customer_status'],
                'customerSalespersonAccountableID' => $row_customer['staff_id'],
                'customerSalespersonAccountableName' => $row_customer['staff_name'],
                'customerBillingAddress' => $row_customer['customer_billing_address'],
                'customerBillingAddressStreet' => $customer_billing_address_street,
                'customerBillingAddressCountry' => $customer_billing_address_country,
                'customerBillingAddressCity' => $customer_billing_address_city,
                'customerShippingAddress' => $row_customer['customer_shipping_address'],
                'customerShippingAddressStreet' => $customer_shipping_address_street,
                'customerShippingAddressCountry' => $customer_shipping_address_country,
                'customerShippingAddressCity' => $customer_shipping_address_city,
                'customerCreditLimit' => $row_customer['customer_credit_limit'],
                'customerCurrentCredit' => $row_customer['customer_current_credit'],
                'customerPaymentTerm' => $row_customer['customer_payment_term'],
                'error' => "",
                'result' => "success"
            );
            // push to array
            array_push($jsonCustomer, $customer_array);
        }
        // json encode the array
        $jsonStringCustomer = json_encode($jsonCustomer);
        echo $jsonStringCustomer;
    }
?>