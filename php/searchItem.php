<?php
    // declare the json array
    $jsonItem = array();

    //get the params on URL after the item id
    $item_id = $_GET['search'];

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