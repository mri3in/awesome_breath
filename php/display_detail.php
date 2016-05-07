<?php
/**
 * Created by PhpStorm.
 * User: Hai Phong
 * Date: 3/20/2016
 * Time: 5:31 PM
 */

//include the config file to connect to db using $db
include('../config.php');

//check if any params are passed by GET method in the URL
if (isset($_GET['search']) && isset($_GET['searchType'])) {
    switch ($_GET['searchType']){
        case 'item':
            include("./searchItem.php");
            break;
        case 'order':
            include("./searchOrder.php");
            break;
        case 'customer':
            include("./searchCustomer.php");
            break;
        case 'order_line':
            include ("./searchOrderLine.php");
            break;
        case 'item_storage_location':
            include ("./searchItemStorageLocation.php");
            break;
        case 'storage_location':
            include ("./searchStorageLocation.php");
            break;
        case 'warehouse':
            include ("./searchWarehouse.php");
            break;
    }

}