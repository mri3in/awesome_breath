<?php
include('../config.php');
$rowCount = count($_POST["customer"]);
for($i=0;$i<$rowCount;$i++) {
mysqli_query($db,"Update customer set customer_status='Deleted' where customer_id='" . $_POST["customer"][$i] . "'");
}
header("Location:../html/sale.html#customer");
?>