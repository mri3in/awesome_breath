<?php
include('../config.php');
$rowCount = count($_POST["storage_id"]);
for($i=0;$i<$rowCount;$i++) {
mysqli_query($db,"Update storage_location set storage_location_condition ='Deleted' where storage_location_id='" . $_POST["storage_id"][$i] . "'");
}
header("Location:../html/inventory.html#tab_storagelocation");
?>