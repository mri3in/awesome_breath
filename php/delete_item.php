<?php
include('../config.php');
$rowCount = count($_POST["item"]);
for($i=0;$i<$rowCount;$i++) {
mysqli_query($db,"Update item set item_status='Deleted' where item_id='" . $_POST["item"][$i] . "'");
}
header("Location:../html/inventory.html#item");
?>