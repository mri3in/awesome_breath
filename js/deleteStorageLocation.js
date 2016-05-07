/**
 * Created by Hai Phong on 4/13/2016.
 */

function setDeleteStorageLocationAction() {
    if(confirm("Are you sure want to delete these rows?")) {
        document.frmStorageLocation.action = "../php/delete_storage_location.php";
        document.frmStorageLocation.submit();
    }
}