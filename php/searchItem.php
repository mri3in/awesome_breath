<?php
/**
 * Created by PhpStorm.
 * User: Hai Phong
 * Date: 3/20/2016
 * Time: 5:31 PM
 */

//include the config file to connect to db using $db
include('../config.php');

// declare the json array
$jsonItem = array();

//check if any params are passed by GET method in the URL
if (isset($_GET['itemId'])) {

    //get the params on URL after the item id
    $item_id = $_GET['itemId'];

    // display the query
    $queryItem = "SELECT * FROM item WHERE item_id = '$item_id'";

    // run the query
    $resultItem = mysqli_query($db, $queryItem);

    // fetch the data to array
    while ($rowItem = mysqli_fetch_array($resultItem)) {

        $item_array = array(
            'itemVendor' => $rowItem['item_vendor'],
            'itemPrice' => $rowItem['item_unit_price'],
            'itemVAT' => $rowItem['item_VAT'],
            'itemManufacturer' => $rowItem['item_manufacturer']
        );
        array_push($jsonItem, $item_array);
    }

    $jsonStringItem = json_encode($jsonItem);
    //echo "item id: " . $item_id . "item vendor" . $rowItem['item_vendor'] . "string json: " . $jsonStringItem;
    echo $jsonStringItem;
    }