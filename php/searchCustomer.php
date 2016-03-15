<!DOCTYPE html>
<html>
<head>
<!--    include JS file to show the result of search customer-->
    <script src="../js/showSearchCustomer.js"></script>
</head>
<body>
    <div class="container">

        <?php
            //include the config file to connect to db using $db
            include('../config.php');

            //set out put to empty
            $output = '';

            //check if any params are passed by GET method in the URL
            if (isset($_GET['search']) && isset($_GET['option']))
            {
                //get the params on URL after the search
                $searchq = $_GET['search'];
                $optionq = $_GET['option'];
                //	$searchq = preg_replace("#[0-9]#i","",$searchq);

                //based on the option, run a query to get the desired customer details
                switch ($optionq) {
                    case "1": //customer name
                        $query = mysqli_query($db, "SELECT *, staff.staff_name FROM customer JOIN staff ON customer.staff_id = staff.staff_id WHERE customer_name LIKE '%$searchq%'") or die ("could not search");
                        break;
                    case "2": //address
                        $query = mysqli_query($db, "SELECT *, staff.staff_name FROM customer JOIN staff ON customer.staff_id = staff.staff_id  FROM customer WHERE customer_billing_address LIKE '%$searchq%' ") or die ("could not search");
                        break;
                    case "3": //contact person name
                        $query = mysqli_query($db, "SELECT *, staff.staff_name FROM customer JOIN staff ON customer.staff_id = staff.staff_id  FROM customer WHERE customer_contact_person_name LIKE '%$searchq%' ") or die ("could not search");
                        break;
                }
                //count the result
                $count = mysqli_num_rows($query);

                //if any results are found, display them to the table
                if ($count >0) {

                    //display the number of results
                    echo "<b> Found " . $count . " result(s)! </b>";

                    //generate a table with proper header
                    echo
                        "<table class=" . "table-striped>" . "
                        <tr>
                             <th></th>
                             <!--
                             <th>Customer ID</th>
                             <th>Customer Name</th>
                             -->
                             <th>Customer Long Name</th>
                             <th>Customer Billing Address</th>
                             <th>Customer Shipping Address</th>
                             <th>Customer Tax Code</th>
                             <th>Customer Credit Limit</th>
                             <th>Customer Payment Term</th>
                             <th>Responsible Staff Name</th>
                             <th>Customer Contact Person Name</th>
                             <th>Customer Contact Person Phone Number</th>
                             <th>Customer Contact Person Email</th>
                             <th>Customer Status</th>

                        </tr>";

                    //fetch the results to table rows, the customer_name should have the link to the edit page
                    while ($row = mysqli_fetch_array($query)) {
                        echo
                             "<tr id=" . "link>" . "
                                 <td><input type=" . "checkbox></td>
                                 <!--
                                 <td>
                                    <a href=" . "edit_customer.html?customer_id=" . $row["customer_id"] .">
                                        " . $row["customer_id"]. "
                                    </a>
                                 </td>
                                 -->
                                 <td>
                                    <a href=" . "edit_customer.html?customer_id=" . $row["customer_id"] .">
                                        " . $row["customer_name"]. "
                                    </a>
                                 </td>
                                 <td>" . $row["customer_billing_address"]. "</td>
                                 <td>" . $row["customer_shipping_address"]. "</td>
                                 <td>" . $row["customer_tax_code"]. "</td>
                                 <td>" . $row["customer_credit_limit"]. "</td>
                                 <td>" . $row["customer_payment_term"]. "</td>
                                 <td>" . $row["staff_name"]. "</td>
                                 <td>" . $row["customer_contact_person_name"]. "</td>
                                 <td>" . $row["customer_contact_person_phone_number"]. "</td>
                                 <td>" . $row["customer_contact_person_email"]. "</td>
                                 <td>" . $row["customer_status"]. "</td>
                             </tr>";
                    }

                    //close the table
                    echo "</table>";

                //if the number of results is 0, display not found text
                } else echo "<b> Result not found </b>";

            }
            else //if no param is passed, display error text
            {
                echo "<b> Cannot search. Please try again later </b>";
            }
        ?>

    </div>

</body>
</html>
