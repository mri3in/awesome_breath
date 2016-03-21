function setOrderAction() {
if(confirm("Are you sure want to delete these rows?")) {
document.frmOrder.action = "../php/delete_order.php";
document.frmOrder.submit();
}
}