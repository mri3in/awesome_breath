<?php
include('../config.php');
$rowCount = count($_POST["order"]);
for($i=0;$i<$rowCount;$i++) {
mysqli_query($db,"Update customer_order set order_status='Deleted' where order_id='" . $_POST["order"][$i] . "'");
}
header("Location:../html/sale.html#order");
?>