function setDeleteCustomerAction() {
if(confirm("Are you sure want to delete these rows?")) {
document.frmCustomer.action = "../php/delete_customer.php";
document.frmCustomer.submit();
}
}