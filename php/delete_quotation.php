<?php
include('../config.php');
$rowCount = count($_POST["quotation"]);
for($i=0;$i<$rowCount;$i++) {
mysqli_query($db,"Update quotation set quotation_status='Deleted' where quotation_id='" . $_POST["quotation"][$i] . "'");
}
header("Location:../html/sale.html#quotation");
?>