<?php
/**
 * Created by PhpStorm.
 * User: s3359025
 * Date: 4/25/2016
 * Time: 9:12 PM
 */
session_start();


if(isset($_GET["authority"]) && $_GET["authority"] == "1") { // Admin + user level 1
    unset($_SESSION['role_id']);
    $_SESSION['role_id'] = "1";
    header('Location: ../index/index.php');

}  elseif(isset($_GET["authority"]) && $_GET["authority"] == "3") { // Sale Manager
    unset($_SESSION['role_id']);
    $_SESSION['role_id'] = "3";
    header('Location: ../html/sale.html');

} elseif(isset($_GET["authority"]) && $_GET["authority"] == "2") { // Warehouse Manager
    unset($_SESSION['role_id']);
    $_SESSION['role_id'] = "2";
    header('Location: ../html/inventory.html');
}

elseif ($_SESSION['authority']!="")  { // Errors
    header('Location: ');
}
?>