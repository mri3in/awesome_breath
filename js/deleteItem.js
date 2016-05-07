function setItemAction() {
if(confirm("Are you sure want to delete these rows?")) {
document.frmItem.action = "../php/delete_item.php";
document.frmItem.submit();
}
}