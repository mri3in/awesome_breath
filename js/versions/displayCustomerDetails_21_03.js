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

function displayItemDetails(itemDetailDisplayID, rowIndex) {
    //get the value of the search input by ID
    //var searchValue = document.getElementById("inputSearchItem").value;
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

                var table = document.getElementById("dataTableOrder");

                    var colCount = table.rows[0].cells.length;
                    for (var i = 3; i < colCount; i++) {
                        var newcell = row.insertCell(i);
                        newcell.innerHTML = table.rows[rowIndex].cells[i].innerHTML;
                    }

                    document.getElementById("item_detail_display").innerHTML = xmlhttp.responseText;

            }
        };

        //open file to run the search based on the params in url
        xmlhttp.open("GET","../php/searchItem.php?search="+itemDetailDisplayID,true);
        //send the request to server
        xmlhttp.send();
    }
}