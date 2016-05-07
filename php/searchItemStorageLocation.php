<?php
    //get the params on URL after the search
    $item_storage_location_id = $_GET['search'];

    // get the details from database
    $sql_storage_location = "SELECT * FROM item_storage_location WHERE item_storage_location_id = '$item_storage_location_id'";

    // execute the query in connected database
    $result_storage_location = mysqli_query($db, $sql_storage_location);

    // store errors
    if (mysqli_connect_errno()) {
        $storage_location_array = array(
            'error' => mysqli_connect_error(),
            'result' => "error"
        );
    }
    else if (!$result_storage_location){
        $storage_location_array = array(
            'error' => mysqli_error($db),
            'result' => "error"
        );
    }
    else {
        // fetch order line id to array
        while ($row_storage_location = mysqli_fetch_assoc($result_storage_location)) {
            $storage_location_array = array(
                'itemStorageLocationId' => $item_storage_location_id,
                'storageLocationId' => $row_storage_location['storage_location_id'],
                'itemStorageLocationQuantity' => $row_storage_location['item_storage_location_quantity'],
                'result' => "success"
            );
        }
    }

    // decode the array
    $jsonStorageLocation = json_encode($storage_location_array);

    // output the json string
    echo $jsonStorageLocation;
