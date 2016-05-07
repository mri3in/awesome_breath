<?php
//get the params on URL after the search
$storage_location_id = $_GET['search'];

// get the details from database
$sql_storage_location = "SELECT * FROM storage_location WHERE storage_location_id = '$storage_location_id'";

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
            'storageLocationId' => $storage_location_id,
            'storage_location_shelf' => $row_storage_location['storage_location_shelf'],
            'storage_location_row' => $row_storage_location['storage_location_row'],
            'storage_location_column' => $row_storage_location['storage_location_column'],
            'storage_location_condition' => $row_storage_location['storage_location_condition'],
            'result' => "success"
        );
    }
}

// decode the array
$jsonStorageLocation = json_encode($storage_location_array);

// output the json string
echo $jsonStorageLocation;
