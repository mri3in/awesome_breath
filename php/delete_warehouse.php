<?php
/**
 * Created by PhpStorm.
 * User: Hai Phong
 * Date: 4/7/2016
 * Time: 2:54 AM
 */

include('../config.php');

// get the warehouse ID via get method
if (isset($_GET['warehouse_id'])) {

    //get the param in URL of warehouse_id
    $delete_warehouse_id = $_GET['warehouse_id'];

    mysqli_query($db, "UPDATE warehouse SET warehouse_status = 'Deleted' WHERE warehouse_id =" . $delete_warehouse_id);

    header("Location:../html/inventory.html#tab_warehouse");
}