<?php
/**
 * Created by PhpStorm.
 * User: Hai Phong
 * Date: 4/29/2016
 * Time: 3:35 PM
 */

//    include ("../config.php");
//    $jsonOrderLine = array();
    $storage_location_id_list = "";
    //get the params on URL after the search
    $order_line_id = $_GET['search'];

    // get the details from database
    $sql_order_line = "SELECT * FROM order_line JOIN customer_order ON customer_order.order_id = order_line.order_id JOIN item ON order_line.order_line_item_id = item.item_id JOIN item_storage_location ON item.item_id = item_storage_location.item_id WHERE order_line.order_line_id = '$order_line_id' ORDER BY order_line.order_line_id ASC";

    // execute the query in connected database
    $result_order_line = mysqli_query($db, $sql_order_line);
    $result_storage_location = mysqli_query($db,$sql_order_line);

    // store errors
    if (mysqli_connect_errno()) {
        $order_line_array = array(
            'error' => mysqli_connect_error(),
            'result' => "error"
        );
    }
    else if (!$result_order_line){
        $order_line_array = array(
            'error' => mysqli_error($db),
            'result' => "error"
        );
    }
    else {
        // fetch order line id to array
        while ($row_storage_location = mysqli_fetch_assoc($result_storage_location)) {
            if (empty($storage_location_id_list)) {
                $storage_location_id_list = (string)$row_storage_location['storage_location_id'];
            } else {
                $storage_location_id_list = $storage_location_id_list . "|" . (string)$row_storage_location['storage_location_id'];
            }
            if (empty($item_storage_location_id_list)) {
                $item_storage_location_id_list = (string)$row_storage_location['item_storage_location_id'];
            } else {
                $item_storage_location_id_list = $item_storage_location_id_list . "|" . (string)$row_storage_location['item_storage_location_id'];
            }
        }

        while ($row_order_line = mysqli_fetch_assoc($result_order_line)) {
            $order_line_array = array(
                'orderLineID' => $order_line_id,
                'itemID' => $row_order_line['item_id'],
                'itemName' => $row_order_line['item_name'],
                'issuedQuantity' => $row_order_line['order_line_item_issued_quantity'],
                'orderedQuantity' => $row_order_line['order_line_item_quantity'],
                'deliveryDate' => $row_order_line['order_line_deliver_date'],
                'itemUnitOfMeasurement' => $row_order_line['item_unit_of_measurement'],
                'orderLineSellingPrice' => $row_order_line['order_line_selling_price'],
                'storageLocationId' => $storage_location_id_list,
                'itemStorageLocationId' => $item_storage_location_id_list,
                'result' => "success"
            );
        }
    }

    // decode the array
    $jsonOrderLine = json_encode($order_line_array);

    // output the json string
    echo $jsonOrderLine;