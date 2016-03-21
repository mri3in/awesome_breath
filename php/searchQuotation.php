<!DOCTYPE html>
<html>
<head>
<!--    include JS file to show the result of search Quotation-->
    <script src="../js/showSearchQuotation.js"></script>
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

                //based on the option, run a query to get the desired quotation details
                switch ($optionq) {
                    case "1": //order id
                        $query = mysqli_query($db, "SELECT * FROM quotation JOIN customer ON quotation.customer_id =customer.customer_id WHERE quotation_id LIKE '%$searchq%'") or die ("could not search");
                        break;
                     case "2": //customer name
                         $query = mysqli_query($db, "SELECT * FROM quotation JOIN customer ON quotation.customer_id =customer.customer_id WHERE customer_name LIKE '%$searchq%'") or die ("could not search");
                         break;
                    // case "3": //contact person name
                    //     $query = mysqli_query($db, "SELECT * FROM customer WHERE customer_contact_person_name LIKE '%$searchq%' ") or die ("could not search");
                    //     break;
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
                                <th>Quotation ID</th>
                                <th>Creation date</th>
                                <th>Closing date</th>
                                <th>Status</th>
                                <th>Customer name</th>
                                <th>Quotation total value</th>
                        </tr>";

                    //fetch the results to table rows, the quotation ID should have the link to the edit page
                    while ($row = mysqli_fetch_array($query)) {
                        echo
                             "<tr id=" . "link>" . "
                                <td><input type=" . "checkbox></td>
                                <td>
                                    <a href=" . "edit_quotation.html?quotation_id=" . $row['quotation_id'] .">
                                    " . $row["quotation_id"]. "
                                    </a>
                                </td>
                                <td>" . $row["quotation_create_date"]. "</td>
                                <td>" . $row["quotation_close_date"]. "</td>
                                <td>" . $row["quotation_status"]. "</td>
                                <td>" . $row["customer_name"]. "</td>
                                <td>" . $row["quotation_total"]. "</td>
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
