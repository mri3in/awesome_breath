<?php
//get the params on URL after the search
$warehouse_id = $_GET['search'];

// get the details from database
$sql_warehouse = "SELECT * FROM storage_location WHERE storage_location_warehouse_id = '$warehouse_id'";

// execute the query in connected database
$result_warehouse = mysqli_query($db, $sql_warehouse);

// store errors
if (mysqli_connect_errno()) {
    $warehouse_array = array(
        'error' => mysqli_connect_error(),
        'result' => "error"
    );
}
else if (!$result_warehouse){
    $warehouse_array = array(
        'error' => mysqli_error($db),
        'result' => "error"
    );
}
else {
    // fetch order line id to array
    while ($row_warehouse = mysqli_fetch_assoc($result_warehouse)) {
        if (empty($storage_location_id_list)){
            $storage_location_id_list = (string)$row_warehouse['storage_location_id'];
        }
        else {
            $storage_location_id_list = $storage_location_id_list . "|" . (string)$row_warehouse['storage_location_id'];
        }
    }
    $warehouse_array = array(
        'warehouseId' => $warehouse_id,
        'storage_location_id_list' => $storage_location_id_list,
        'result' => "success"
    );
}

// encode the array
$jsonWarehouse = json_encode($warehouse_array);

// output the json string
echo $jsonWarehouse;
