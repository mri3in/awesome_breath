/**
 * Created by Hai Phong on 3/18/2016.
 */

function displayCustomerDetails(customerDetailDisplayID) {
    //get the value of the search input by ID
    //var searchValue = document.getElementById("inputSearchCustomer").value;
    //get the option of the customer ID
    //var customerDetailDisplayID = document.getElementById("customer_name_select").value;
    //check if the string is empty
    if (customerDetailDisplayID == "") {
        //alert user to input a text
        alert("Please select a customer!");
        //document.getElementById("tableSearchCustomer").innerHTML = "";
        return;
    } else {
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        //once the page is load, display the list of customer to element id = tableSearchCustomer
        xmlhttp.onreadystatechange = function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                document.getElementById("customer_detail_display").innerHTML = xmlhttp.responseText;
                // alert(xmlhttp.responseText.split(','));
            }
        };

        //open file to run the search based on the params in url
        xmlhttp.open("GET","../php/searchCustomer.php?search="+customerDetailDisplayID,true);
        //send the request to server
        xmlhttp.send();
    }
}
/**
 * @purpose: load the item details on select of the item name combo box
 * @param itemDetailDisplayID
 * @param selectId
 * @param itemVendor, itemVAT
 * @param itemPrice, itemManufacturer
 *
 */
function displayItemDetails(itemDetailDisplayID, selectId) {
    //get the location of desired destination cells
    var rowIndex = selectId.slice(-1);
    //get the option of the item ID
    //var itemDetailDisplayID = document.getElementById("item_name_select").value;
    //check if the string is empty
    if (itemDetailDisplayID == "") {
        //alert user to input a text
        alert("Please select a item!");
        //document.getElementById("tableSearchItem").innerHTML = "";
        return;
    } else {
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        //once the page is load, display the list of item to element id = tableSearchItem
        xmlhttp.onreadystatechange = function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                // get the table
                //var table = document.getElementById("dataTableOrder");
                // define columns of vendor, selling price, manufacturer, tax
                const itemManufacturerCol = 3;
                const itemVendorCol = 5;
                const itemSellingPriceCol = 8;
                const itemTaxCol = 10;
                // declare an array to store info extracted from the json string of searchItem.php
                // source: http://www.w3schools.com/json/json_http.asp
                var itemFoundArray = JSON.parse(xmlhttp.responseText);
                // set the columns to writable'
                $('#row-' + rowIndex + '_col-' + itemManufacturerCol + " input").attr("readonly", false);
                $('#row-' + rowIndex + '_col-' + itemVendorCol + " input").attr("readonly", false);
                $('#row-' + rowIndex + '_col-' + itemSellingPriceCol + " input").attr("readonly", false);
                $('#row-' + rowIndex + '_col-' + itemTaxCol + " input").attr("readonly", false);
                // extract and write innerHTML to corresponding columns
                // then set those inputs to readonly
                // source http://stackoverflow.com/questions/1306708/add-readonly-to-input-jquery
                // multiple attr source: http://stackoverflow.com/questions/13014317/jquery-adding-two-attributes-via-the-attr-method
                $('#row-' + rowIndex + '_col-' + itemManufacturerCol + " input").attr({value: itemFoundArray[0].itemManufacturer, readonly: true});
                $('#row-' + rowIndex + '_col-' + itemVendorCol + " input").attr({value:itemFoundArray[0].itemVendor, readonly: true});
                $('#row-' + rowIndex + '_col-' + itemSellingPriceCol + " input").attr({value:itemFoundArray[0].itemPrice, readonly: true});
                $('#row-' + rowIndex + '_col-' + itemTaxCol + " input").attr({value:itemFoundArray[0].itemVAT, readonly: true});
            }
        };

        //open file to run the search based on the params in url
        xmlhttp.open("GET","../php/searchItem.php?itemId="+itemDetailDisplayID,true);
        //send the request to server
        xmlhttp.send();
    }
}

