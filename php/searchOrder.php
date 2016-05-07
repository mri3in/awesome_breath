<?php

    $jsonOrder = array();
    $order_line_id_list = "";
    $item_id_list = "";
    $item_name_list = "";

    //get the params on URL after the search
    $order_id = $_GET['search'];

    // create sql query
    $result_order =  mysqli_query($db, "SELECT *, customer.customer_long_name, customer.customer_billing_address FROM customer_order JOIN customer ON customer_order.customer_id = customer.customer_id WHERE order_id = '$order_id'");

    $result_order_line = mysqli_query($db, "SELECT *, item.item_name FROM order_line JOIN customer_order ON customer_order.order_id = order_line.order_id JOIN item ON order_line.order_line_item_id = item.item_id WHERE order_line.order_id = '$order_id' AND order_line.order_line_deliver_status <> 'Shipped' AND order_line.order_line_deliver_status <> 'Delivered' ORDER BY order_line.order_line_id ASC ");

    // store errors
    if (mysqli_connect_errno()) {
        $order_array = array(
            'error' => mysqli_connect_error(),
            'result' => "error"
        );
        array_push($jsonOrder, $order_array);
    }
    else if (!$result_order || !$result_order_line){
        $order_array = array(
            'error' => mysqli_error($db),
            'result' => "error"
        );
        array_push($jsonOrder, $order_array);
    }
    else {
        // fetch order line id to array
        while ($row_order_line = mysqli_fetch_assoc($result_order_line)){
            if (empty($order_line_id_list)){
                $order_line_id_list = (string)$row_order_line['order_line_id'];
            }
            else {
                $order_line_id_list = $order_line_id_list . "|" . (string)$row_order_line['order_line_id'];
            }
            if (empty($item_id_list)){
                $item_id_list = (string)$row_order_line['item_id'];
            }
            else {
                $item_id_list = $item_id_list . "|" . (string)$row_order_line['item_id'];
            }
            if (empty($item_name_list)){
                $item_name_list = (string)$row_order_line['item_name'];
            }
            else {
                $item_name_list = $item_name_list . "|" . (string)$row_order_line['item_name'];
            }
        }

        // fetch the order data to array
        while ($row_order = mysqli_fetch_array($result_order)) {

            $order_array = array(
                'orderID' => $row_order['order_id'],
                'customerLongName' => $row_order['customer_long_name'],
                'customerBillingAddress' => $row_order['customer_billing_address'],
                'orderShippingAddress' => $row_order['order_shipping_address'],
                'orderLineID' => $order_line_id_list,
                'itemLineID' => $item_id_list,
                'itemLineName' => $item_name_list,
                'error' => "",
                'result' => "success"
            );
            array_push($jsonOrder, $order_array);
        }

        $jsonStringOrder = json_encode($jsonOrder);
        echo $jsonStringOrder;
    }
?>