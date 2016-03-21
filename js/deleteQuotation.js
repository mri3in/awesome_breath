function setDeleteQuationAction() {
if(confirm("Are you sure want to delete these rows?")) {
document.frmQuotation.action = "../php/delete_quotation.php";
document.frmQuotation.submit();
}
}