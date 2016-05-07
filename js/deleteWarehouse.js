/**
 * Created by Hai Phong on 4/13/2016.
 */
function setDeleteWarehouseAction() {
    if(confirm("Are you sure want to delete these rows?")) {
        document.frmWarehouse.action = "../php/delete_warehouse.php";
        document.frmWarehouse.submit();
    }
}