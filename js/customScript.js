/**
 * Declare all the config to use globally
 * Ref: http://stackoverflow.com/questions/2775838/does-anyone-use-config-files-for-javascript
 * @type {{quotation: {lineIDCol: string, selectionCol: string, quantityCol: string, priceCol: string, totalPriceCol: string, netPriceInputName: string, lineMaxRowCount: string}, order: {lineIDCol: string, selectionCol: string, quantityCol: string, priceCol: string, totalPriceCol: string, netPriceInputName: string, lineMaxRowCount: string}, defaultSelectionID: string, prefixSelectionID: string, taxLineInputName: string, netTotalID: string, totalTaxID: string, totalID: string}}
 */
var config =
{
    quotation : {
        lineIDCol: "1",
        selectionCol: "2",
        manufacturerCol : "3",
        quantityCol: "4",
        vendorCol : "5",
        priceCol: "6",
        totalPriceCol: "7",
        taxCol : "8",
        selectionNameCol : "",
        storageLocationCol : "",
        unitCostCol : "",

        currencyExchangeRateID : "",
        netPriceInputName : "quotation_line_estimate_net_price[]",

        lineMaxRowCount: "10",
    },

    order : {
        lineIDCol: "1",
        selectionCol: "2",
        manufacturerCol : "3",
        quantityCol: "4",
        vendorCol :"5",
        priceCol : "7",
        totalPriceCol: "8",
        taxCol : "9",
        selectionNameCol : "",
        storageLocationCol : "",
        unitCostCol : "",

        currencyExchangeRateID : "",
        netPriceInputName : "order_line_net_selling_price[]",

        lineMaxRowCount: "10",
    },

    issue : {
        customerNameID : "customer_long_name",
        customerBillingAddressID : "customer_billing_address",
        customerShippingAddressID : "customer_shipping_address",

        lineIDCol: "1",
        selectionCol : "2",
        selectionNameCol : "3",
        issuedOrderedQuantityCol : "4",
        quantityCol : "5",
        storageLocationCol : "6",
        inStockCol : "7",
        itemUnitOfMeasurementCol : "8",
        deliveryDateCol : "9",
        totalPriceCol : "10",
        priceCol : "11",
        unitCostCol : "",

        currencyExchangeRateID : "exchange_rate",

        netPriceInputName : "transaction_line_value[]",

        lineMaxRowCount: "10",
    },

    receipt : {
        storageLocationDisplayID : "storage_location_detail_display",
        storageLocationShelfID : "storage_location_shelf",
        storageLocationRowID : "storage_location_row",
        storageLocationColumnID : "storage_location_column",
        storageLocationConditionID : "storage_location_condition",

        lineIDCol: "1",
        selectionCol : "2",
        vendorCol : "3",
        quantityCol : "4",
        unitCostCol : "5",
        totalPriceCol : "6",
        inStockCol : "",
        itemUnitOfMeasurementCol : "",
        deliveryDateCol : "",
        priceCol : "",

        currencyExchangeRateID : "exchange_rate",

        netPriceInputName : "item_total_cost[]",

        lineMaxRowCount: "10",
    },

    defaultSelectionID : "item_id_select_0",
    prefixSelectionID : "item_id_select_",

    defaultSelectionName : "item_name_select_0",
    prefixSelectionName : "item_name_select_",

    defaultSelectionStorageID : "storage_location_select_0",
    prefixSelectionStorageID  : "storage_location_select_",

    taxLineInputName : "item_VAT[]",

    netTotalID : "netTotal",
    totalTaxID : "totalTax",
    totalID : "total",

    searchPHPName : "display_detail",

    selectedCountryIndex : {
        country : "243", // Vietnam
        city : "27" // Ho Chi Minh city
    },

    customer : {
        customerName : "customer_name",
        customerLongName : "customer_long_name",
        customerTaxCode : "customer_tax_code",
        customerPhoneNumber : "customer_phone_number",
        customerStatus : "customer_status",
        customerSalespersonAccountable : "staff_id",
        customerBillingAddress : "customer_billing_address",
        customerBillingAddressStreet : "customer_billing_address_street",
        customerBillingAddressCountry : "customer_billing_address_country",
        customerBillingAddressCity : "customer_billing_address_city",
        customerShippingAddress : "customer_shipping_address",
        customerShippingAddressStreet : "customer_shipping_address_street",
        customerShippingAddressCountry : "customer_shipping_address_country",
        customerShippingAddressCity : "customer_shipping_address_city",
        customerCreditLimit : "customer_credit_limit",
        customerCurrentCredit : "customer_current_credit",
        customerPaymentTerm : "customer_payment_term"
    }
};

/**
 * declare all the alerts
 * @type {{quotation: {maxLine: string, minLine: string}, order: {maxLine: string, minLine: string}}}
 */
var message =
{
    quotation : {
        maxLine: "Maximum quotation line per quotation is " + config.quotation.lineMaxRowCount + "!",
        minLine: "Cannot remove all the quotation lines.",
    },

    order : {
        maxLine: "Maximum order line per order is " + config.order.lineMaxRowCount + "!",
        minLine: "Cannot remove all the order lines.",
    },

    issue : {
        maxLine: "Maximum issue line per transaction is " + config.issue.lineMaxRowCount + "!",
        minLine: "Cannot remove all the transaction lines.",
    },

    receipt : {
        maxLine: "Maximum receipt line per transaction is " + config.receipt.lineMaxRowCount + "!",
        minLine: "Cannot remove all the transaction lines.",
    },

    displayDetails : {
        noAttributeID : "Please select one!"
    },
};

/**
 * @purpose : define partials
 */
$(function(){
    $("#header").load("../html/partials/navigation.html");
    $("#footer").load("../html/partials/footer.html");
    $("#tabItem").load("item.html");
    $("#tabWarehouse").load("warehouse.html");
    $("#tabStorageLocation").load("storage_location.html");
    $("#tabCustomer").load("customer.html");
    $("#tabOrder").load("order.html");
    $("#tabQuotation").load("quotation.html");

});

/**
 * declare the global list of order line IDs
 */
var orderLineIdList;
var itemStorageLocationIdList;

/**
 * @purpose to assign dataTable to the table ID of HTML
 * @param tableID
 * @example
 *  // the jQuery.dataTables.js sometimes takes longer time to load so we need to delay the assignment
 *  $(window).load(setTimeout(assignDataTable('exampleID'), 30 ));
 */
function assignDataTable(tableID) {
    // enable dataTable to the table has id= tableID
    $("#" + tableID).DataTable({
        fixedHeader: {
            headerOffset: $('#myNavbar').outerHeight()
        }
    });

    // eliminate the bug set style="width: 0;"
    $("#" + tableID).attr("style", "");
}

/**
 * @purpose to disable the button Enter
 */
function disableEnter(element) {
    //in each element form, bind this function
    $(element).bind("keypress", function(e) {
        //if the press key is ENTER, disable the event
        if (e.keyCode == 13) {
            return false;
        }
    });
}

/**
 * @purpose Javascript to enable link to tab
 * @reference "Go to Tab on Page Reload" http://www.bootply.com/rg7f7CLlFR
 * @example
 *  // enable redirection to go to correct tab
 *  $(window).load(redirectTab());
 */
function redirectTab() {
    $('#myTab a').click(function (e) {
        e.preventDefault();
        $(this).tab('show');
    });

    var hash = document.location.hash;
    var prefix = "tab_";

    if (hash) {
        $('.nav-tabs a[href=' + hash.replace(prefix, "") + ']').tab('show');
    }

    // Change hash for page-reload
    $('.nav-tabs a').on('shown.bs.tab', function (e) {
        window.location.hash = e.target.hash.replace("#", "#" + prefix);
    });
}

/**
 * @purpose : to run the pie progress on page load
 * @param $
 */
function progressBar($){

    // Progress bar function
    $('.pie_progress').asPieProgress({
        namespace: 'pie_progress',
        min: 0,
        max: 100,
        speed: 30,
    });
    // Event handler, bar will be load when the warehouse tab is switched
    $('a[data-toggle="tab"]').on('shown.bs.tab', function(){
        $('.pie_progress').asPieProgress('start');});

    $('.pie_progress').asPieProgress('start');

}

/**
 * ------------------------------------------------------------------------------------------------------------------
 * ----------------------------------------Start of Add/Delete Rows Functions----------------------------------------
 * ------------------------------------------------------------------------------------------------------------------
 */
/**
 * @purpose : function to dynamically add row to quotation line, load select item and add calculating function to input
 * @param tableID
 * @param docType
 *
 * Project Name : Dynamic Form Processing with PHP
 * URL: http://techstream.org/Web-Development/PHP/Dynamic-Form-Processing-with-PHP
 *
 * Licensed under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 *
 * Copyright 2013, Tech Stream
 * http://techstream.org
 */
function addRow(tableID, docType) {

    var configDocType;
    var messageType;

    // get the doc type/message type and corresponding pre-set variables
    if (docType == "order")
    {
        configDocType = config.order;
        messageType = message.order;
    }
    else if (docType == "quotation")
    {
        configDocType = config.quotation;
        messageType = message.quotation;
    }
    else if (docType == "issue")
    {
        configDocType = config.issue;
        messageType = message.issue;
    }
    else if (docType == "receipt")
    {
        configDocType = config.receipt;
        messageType = message.receipt;
    }
    var table = document.getElementById(tableID);   //set an table object by selecting the element from the given param
    var rowCount = table.rows.length;               //count the number of rows of table

    if(rowCount < configDocType.lineMaxRowCount){						// limit the user from creating fields more than your limits
        var row = table.insertRow(rowCount);        // insert a new row
        var colCount = table.rows[0].cells.length;  // get the number of columns to limit the loop
        row.id = 'row-'+ (rowCount - 1);                   // get the id for the current row

        for(var i=0; i<colCount; i++) {             // a loop to insert new cells and set up new ID for each cell and the select
            var newCell = row.insertCell(i);        // insert a new cell
            newCell.id = row.id + "_col-" + i; // set up new ID
            if (i== configDocType.lineIDCol){
                newCell.setAttribute("hidden", "true"); // if that cell contains line ID, hide that cell
                newCell.innerHTML = table.rows[1].cells[i].innerHTML; // if the column contains line ID, duplicate the line ID cell innerHTML
                console.log("lineID : " + table.rows[1].cells[i].innerHTML);
            }
            else if (i == configDocType.selectionCol) {              // find the select box column location
                var newStr = function(){            // run a function to create new id, find & replace old id
                    var newID = config.prefixSelectionID + (rowCount - 1); //set up new id for select box
                    var str = table.rows[1].cells[i].innerHTML.replace(config.defaultSelectionID, newID); // replace the old id in innerHTML
                    return str;
                };
                newCell.innerHTML = newStr();       // write the updated innerHTML to the column containing the select
                console.log("selection ID: " + newCell.innerHTML);
            }
            else if (i == configDocType.quantityCol || i == configDocType.priceCol || i == configDocType.unitCostCol){
                newCell.innerHTML = table.rows[1].cells[i].innerHTML;
                $('#' + newCell.id + ' input').attr("oninput", "calculatePrice('"+row.id+"', '"+docType+"')");
                if (docType == "issue" && i == configDocType.priceCol){
                    newCell.setAttribute("hidden", "true");
                }
                console.log("quantity + price: " + newCell.innerHTML);
            }
            else if (i == configDocType.selectionNameCol){
                var newNameStr = function(){            // run a function to create new id, find & replace old id
                    var newID = config.prefixSelectionName + (rowCount - 1); //set up new id for select box
                    var strName = table.rows[1].cells[i].innerHTML.replace(config.defaultSelectionName, newID); // replace the old id in innerHTML
                    return strName;
                };
                newCell.innerHTML = newNameStr();       // write the updated innerHTML to the column containing the select
                console.log("selection name: " + newCell.innerHTML);
            }
            else if (i == configDocType.storageLocationCol){
                var newStorageStr = function(){            // run a function to create new id, find & replace old id
                    var newID = config.prefixSelectionStorageID + (rowCount - 1); //set up new id for select box
                    var strName = table.rows[1].cells[i].innerHTML.replace(config.defaultSelectionStorageID, newID); // replace the old id in innerHTML
                    return strName;
                };
                newCell.innerHTML = newStorageStr();       // write the updated innerHTML to the column containing the select
                console.log("selection name: " + newCell.innerHTML);
            }
            else
            {
                newCell.innerHTML = table.rows[1].cells[i].innerHTML; // if the column does not contain select box, duplicate the previous one
                console.log("others: " + newCell.innerHTML);
            }
            // set the value of select + input to default/empty
            $('#' + newCell.id + ' select').val(0);
            $('#' + newCell.id + ' input').attr("value", "");
        }

    }else{
        // display message if reaching the maximum number of quotation lines
        alert(messageType.maxLine);
    }
}

/**
 * @purpose : function to remove dynamically added rows
 * @param tableID
 * @param docType
 */
function deleteRow(tableID, docType) {

    var configDocType;
    var messageType;

    // get the doc type and corresponding pre-set variables
    if (docType == "order")
    {
        configDocType = config.order;
        messageType = message.order;
    }
    else if (docType == "quotation")
    {
        configDocType = config.quotation;
        messageType = message.quotation;
    }
    else if (docType = "issue")
    {
        configDocType = config.issue;
        messageType = message.issue;
    }
    else if (docType = "receipt")
    {
        configDocType = config.receipt;
        messageType = message.receipt;
    }

    //set an table object by selecting the element from the given param
    var table = document.getElementById(tableID);
    //count the number of rows of table
    var rowCount = table.rows.length;

    // a loop to catch the selected checkboxes and remove the row correspondingly
    for(var i=0; i<rowCount; i++) {
        // set a row object for the current row in the loop
        var row = table.rows[i];
        // get the checkbox's value
        var chkBox = row.cells[0].childNodes[0];
        // remove the rows that have checked checkbox but do not remove all the row
        if(null != chkBox && true == chkBox.checked) {
            if(rowCount <= 1) { 						// limit the user from removing all the fields
                alert(messageType.minLine);
                break;
            }
            // delete the corresponding row
            table.deleteRow(i);
            rowCount--;
            i--;
            calculatePrice("", docType);
        }
    }

    // a loop to update the current lines' ids
    for(var j=1; j<rowCount; j++) {
        // get the maximum of number of columns
        var colCount = table.rows[0].cells.length;
        // set the new row index to match the array value
        var rowIndexIdRemake = j -1;
        // set new id for the row
        table.rows[j].id = "row-" + rowIndexIdRemake;
        // a loop to update ids
        for(var m=0; m<colCount; m++) {
            // if the column contains select box, update id of cell and select id
            if (m == configDocType.selectionCol){
                table.rows[j].cells[m].id = "row-" + rowIndexIdRemake + "_col-" + m;
                // set new select id
                var selectNewId = config.prefixSelectionID + rowIndexIdRemake;
                // change the id of the select
                $("#" + table.rows[j].cells[m].id + " select").attr("id",selectNewId);
            }

            // if the column contains name select box, update id of cell and select id
            else if (m == configDocType.selectionNameCol) {
                table.rows[j].cells[m].id = "row-" + rowIndexIdRemake + "_col-" + m;
                // set new select id
                var selectNameNewId = config.prefixSelectionName + rowIndexIdRemake;
                // change the id of the select
                $("#" + table.rows[j].cells[m].id + " select").attr("id", selectNameNewId);
            }

            // if the column contains name select box, update id of cell and select id
            else if (m == configDocType.storageLocationCol) {
                table.rows[j].cells[m].id = "row-" + rowIndexIdRemake + "_col-" + m;
                // set new select id
                var selectStorageLocationNewId = config.prefixSelectionStorageID + rowIndexIdRemake;
                // change the id of the select
                $("#" + table.rows[j].cells[m].id + " select").attr("id", selectStorageLocationNewId);
            }

            // if the column contains quantity or price, update id of cell and function
            else if ( m == configDocType.quantityCol || m == configDocType.priceCol || m == configDocType.unitCostCol) {
                table.rows[j].cells[m].id = "row-" + rowIndexIdRemake + "_col-" + m;
                var functionName = "calculatePrice('row-"+rowIndexIdRemake+"','" + docType+"')";
                $("#" + table.rows[j].cells[m].id + " input").attr("oninput", functionName)
            }
            else{
                // update the cell id only
                table.rows[j].cells[m].id = "row-" + rowIndexIdRemake + "_col-" + m;
            }
        }
    }
}
/**
 * ------------------------------------------------------------------------------------------------------------------
 * ------------------------------------------End of Add/Delete Rows Functions----------------------------------------
 * ------------------------------------------------------------------------------------------------------------------
 */

/**
 * ------------------------------------------------------------------------------------------------------------------
 * --------------------------------------------Start of Calculating Functions----------------------------------------
 * ------------------------------------------------------------------------------------------------------------------
 */
/**
 * @purpose : This Script is to calculate the total value of each quotation line
 * @param elementID
 * @param docType
 * @reference : http://stackoverflow.com/questions/31470273/perform-calculations-on-dynamically-added-rows
 */
function sellingPrice(elementID, docType) {

    var configDocType;
    // get the doc type and corresponding pre-set variables
    if (docType == "order")
    {
        configDocType = config.order;
    }
    else if (docType == "quotation")
    {
        configDocType = config.quotation;
    }
    else if (docType == "issue")
    {
        configDocType = config.issue;
    }
    else if (docType == "receipt")
    {
        configDocType = config.receipt;
    }

    // declare variable of the unique id of the table cell
    var quantityInputID = elementID + "_col-" + configDocType.quantityCol;
    console.log("quantityInputID: " + quantityInputID);
    var priceInputID;
    if (docType == "receipt"){
        priceInputID = elementID + "_col-" + configDocType.unitCostCol;
    }
    else
    {
        priceInputID = elementID + "_col-" + configDocType.priceCol;
    }
    console.log("priceInputID: " + priceInputID);
    var totalPriceInputID = elementID + "_col-" + configDocType.totalPriceCol;

    //get value of the input inside table cell with the unique id
    var quantityValue = document.getElementById(quantityInputID).getElementsByTagName('input')[0].value;
    var priceValue = document.getElementById(priceInputID).getElementsByTagName('input')[0].value;
    //calculate the total price and display the result
    var netLineTotal;
    if (configDocType.currencyExchangeRateID){
        netLineTotal = quantityValue * priceValue * $("#"+configDocType.currencyExchangeRateID).val();
    }
    else
    {
        netLineTotal = quantityValue * priceValue;
    }
    $('#' + totalPriceInputID + " input").attr({readonly : false,value : netLineTotal, readonly : true});
}

/**
 * @purpose : This Script is to sum up the value of all quotation line and display it to the total Price (Tax exl), with the input id="total"
 * @param docType
 * @reference : http://stackoverflow.com/questions/13540751/how-get-total-sum-from-input-box-values-using-javascript
 */
function sumNetTotal(docType) {
    var arr;
    var configDocType;

    // get the doc type and corresponding pre-set variables
    if (docType == "order") {
        configDocType = config.order;
    }
    else if (docType == "quotation") {
        configDocType = config.quotation;
    }
    else if (docType == "issue") {
        configDocType = config.issue;
    }
    else if (docType == "receipt") {
        configDocType = config.receipt;
    }
    arr = document.getElementsByName(configDocType.netPriceInputName);
    console.log("net price input name : " + configDocType.netPriceInputName);
    var netTotal = 0;
    for(var i=0;i<arr.length;i++){
        if(parseInt(arr[i].value))
            netTotal += parseInt(arr[i].value);
    }
    $("#"+config.netTotalID).attr({readonly : false, value : netTotal, readonly : true});
    return netTotal;
}

/**
 * @purpose : This Script is to sum up the tax of all quotation line and display it to the total Tax, with the input id="totalTax"
 * @param docType
 */
function sumTax(docType) {
    var price;
    var configDocType;
    var tax = document.getElementsByName(config.taxLineInputName);
    var per = 0.01;
    var totalTax = 0;

    // get the doc type and corresponding pre-set variables
    if (docType == "order") {
        configDocType = config.order;
    }
    else if (docType == "quotation") {
        configDocType = config.quotation;
    }
    else if (docType == "issue"){
        return totalTax;
    }
    else if (docType == "receipt"){
        return totalTax;
    }

    price = document.getElementsByName(configDocType.netPriceInputName);

    for (var i=0;i<price.length;i++){
        if(parseInt(price[i].value) && parseInt(tax[i].value))
            totalTax += parseInt(tax[i].value) * parseInt(price[i].value) * per;
    }
    $("#"+config.totalTaxID).attr("readonly", false);
    document.getElementById(config.totalTaxID).value = totalTax;
    $("#"+config.totalTaxID).attr("readonly", true);
    return totalTax;
}

/**
 * @purpose : trigger all calculating functions
 * @param elementID
 * @param docType
 */
function calculatePrice (elementID, docType) {
    // call function to calculate line total
    // if element ID is empty skip the selling price in case of removing a line
    // ref: http://stackoverflow.com/questions/154059/how-do-you-check-for-an-empty-string-in-javascript
    if (elementID) {
        sellingPrice(elementID, docType);
    }
    // set readonly to false
    $("#"+config.totalID).attr({readonly : false, value : sumNetTotal(docType) + sumTax(docType), readonly : true});

    /*// sum all the lines
    document.getElementById(config.totalID).value = sumNetTotal(docType) + sumTax(docType);;
/!*    console.log("total ID:" + config.totalID);
    console.log("total: "+ parseInt(netTotal.value) + " + " + parseInt(totalTax.value))*!/

    // restore readonly property
    $("#"+config.totalID).attr("readonly", true);*/
}

/**
 * ------------------------------------------------------------------------------------------------------------------
 * ----------------------------------------------End of Calculating Functions----------------------------------------
 * ------------------------------------------------------------------------------------------------------------------
 */

/**
 * ------------------------------------------------------------------------------------------------------------------
 * ----------------------------------------Start of Display Details Functions----------------------------------------
 * ------------------------------------------------------------------------------------------------------------------
 */
/**
 * @purpose to display details of an attribute to a div
 * @param searchValue
 * @param searchType
 * @param displayID
 * @param selectID
 * @param docType
 */
function displayDetails(searchValue, searchType, displayID, selectID, docType) {

    //check if the string is empty
    if (searchValue == "") {
        //alert user to input a text
        alert(message.displayDetails.noAttributeID);
        return;
    } else {
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        //once the page is load, display the details
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                switch (searchType) {
                    case 'item':
                        displayItemDetails(selectID, docType);
                        break;
                    case 'customer':
                        displayCustomerDetails(searchValue, displayID);
                        break;
                    case 'order':
                        displayOrderDetails(searchValue, displayID, selectID);
                        break;
                     /*case 'quotation':
                        displayItemDetails(searchValue, selectID, docType);
                        break;
                    case 'storage_location':
                        displayItemDetails(searchValue, selectID, docType);
                        break;
                    case 'warehouse':
                        displayItemDetails(searchValue, selectID, docType);
                        break;*/
                }
            }
        };
        ////open file to run the search based on the params in url
        xmlhttp.open("GET","../php/"+config.searchPHPName+".php?search="+searchValue+"&searchType="+searchType,true);
        ////send the request to server
        xmlhttp.send();
    }
}

/**
 * @purpose: load the customer details on customer_display_detail div
 * @param searchValue
 * @param dataTable
 */
function displayCustomerDetails (searchValue, dataTable) {
    //check if the string is empty
    if (searchValue == "") {
        //alert user to input a text
        alert(message.displayDetails.noAttributeID);
        return;
    } else {
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }

        //once the page is load, display the details
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

                $("#"+dataTable).show();
                // parse the response JSON to HTML elements
                var customerArray = JSON.parse(xmlhttp.responseText);
                console.log(customerArray);
                // insert new value to field
                $('#' + config.customer.customerName).attr({
                    readonly: false,
                    value: customerArray[0].customerName,
                    readonly: true
                });
                $('#' + config.customer.customerLongName).attr({
                    readonly: false,
                    value: customerArray[0].customerLongName,
                    readonly: true
                });
                $('#' + config.customer.customerTaxCode).attr({
                    readonly: false,
                    value: customerArray[0].customerTaxCode,
                    readonly: true
                });
                $('#' + config.customer.customerPhoneNumber).attr({
                    readonly: false,
                    value: customerArray[0].customerPhoneNumber,
                    readonly: true
                });
                $('#' + config.customer.customerStatus).attr({
                    readonly: false,
                    value: customerArray[0].customerStatus,
                    readonly: true
                });
                if ($('#' + config.customer.customerSalespersonAccountable).is("select")) {
                    $('#' + config.customer.customerSalespersonAccountable).val(
                        customerArray[0].customerSalespersonAccountableID
                );
                }
                else if ($('#' + config.customer.customerSalespersonAccountable).is("input")) {
                    $('#' + config.customer.customerSalespersonAccountable).attr({
                        readonly: false,
                        value: customerArray[0].customerSalespersonAccountableName,
                        readonly: true
                    });
                }
                $('#' + config.customer.customerBillingAddressStreet).attr({
                    readonly: false,
                    value: customerArray[0].customerBillingAddressStreet,
                    readonly: true
                });
                $('#' + config.customer.customerBillingAddressCountry).attr({
                    readonly: false,
                    value: customerArray[0].customerBillingAddressCountry,
                    readonly: true
                });
                $('#' + config.customer.customerBillingAddressCity).attr({
                    readonly: false,
                    value: customerArray[0].customerBillingAddressCity,
                    readonly: true
                });
                $('#' + config.customer.customerShippingAddressStreet).attr({
                    readonly: false,
                    value: customerArray[0].customerShippingAddressStreet
                });
                console.log(customerArray[0].customerShippingAddressCountry);
                $("#" + config.customer.customerShippingAddressCountry).val(customerArray[0].customerShippingAddressCountry);
                /*$('#' + config.customer.customerShippingAddressCity).attr({
                    value: customerArray[0].customerShippingAddressCity
                });*/
                populateStates(config.customer.customerShippingAddressCountry, config.customer.customerShippingAddressCity);
                $("#" + config.customer.customerShippingAddressCity).val(customerArray[0].customerShippingAddressCity);
                $('#' + config.customer.customerCreditLimit).attr({
                    readonly: false,
                    value: customerArray[0].customerCreditLimit,
                    readonly: true
                });
                $('#' + config.customer.customerCurrentCredit).attr({
                    readonly: false,
                    value: customerArray[0].customerCurrentCredit,
                    readonly: true
                });
                $('#' + config.customer.customerPaymentTerm).attr({
                    readonly: false,
                    value: customerArray[0].customerPaymentTerm,
                    readonly: true
                });
            }
        };
        //open file to run the search based on the params in url
        xmlhttp.open("GET", "../php/" + config.searchPHPName + ".php?search=" + searchValue + "&searchType=customer", true);
        //send the request to server
        xmlhttp.send();
    }
}

/**
 * @purpose: load the item details on select of the item name combo box
 * @param searchValue
 * @param selectId
 * @param docType
 */
function displayItemDetails(searchValue, selectId, docType) {
    //get the location of desired destination cells
    var rowIndex = selectId.slice(-1);
    var configType;
    //check if the string is empty
    if (searchValue == "") {
        //alert user to input a text
        alert(message.displayDetails.noAttributeID);
        return;
    } else {
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        //once the page is load, display the details
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

                // define config type based on docType
                switch (docType) {
                    case "order":
                        // define config type
                        configType = config.order;
                        break;
                    case "quotation":
                        // define config type
                        configType = config.quotation;
                        break;
                    case "receipt":
                        configType = config.receipt;
                        break;
                }

                // declare an array to store info extracted from the json string of searchItem.php
                // source: http://www.w3schools.com/json/json_http.asp
                var itemFoundArray = JSON.parse(xmlhttp.responseText);

                // extract and write innerHTML to corresponding columns
                // then set those inputs to readonly
                // source http://stackoverflow.com/questions/1306708/add-readonly-to-input-jquery
                // multiple attr source: http://stackoverflow.com/questions/13014317/jquery-adding-two-attributes-via-the-attr-method
                if (configType.manufacturerCol){
                    $('#row-' + rowIndex + '_col-' + configType.manufacturerCol + " input").attr({
                    readonly: false,
                    value: itemFoundArray[0].itemManufacturer,
                    readonly: true
                    });
                }

                if (configType.vendorCol) {
                    $('#row-' + rowIndex + '_col-' + configType.vendorCol + " input").attr({
                        readonly: false,
                        value: itemFoundArray[0].itemVendor,
                        readonly: true
                    });
                }

                if (configType.priceCol) {
                    $('#row-' + rowIndex + '_col-' + configType.priceCol + " input").attr({
                        readonly: false,
                        value: itemFoundArray[0].itemPrice
                    });
                }

                if (configType.taxCol) {
                    $('#row-' + rowIndex + '_col-' + configType.taxCol + " input").attr({
                        readonly: false,
                        value: itemFoundArray[0].itemVAT,
                        readonly: true
                    });
                }
            }
        };
        //open file to run the search based on the params in url
        xmlhttp.open("GET", "../php/" + config.searchPHPName + ".php?search=" + searchValue + "&searchType=item", true);
        //send the request to server
        xmlhttp.send();
    }
}

/**
 * @purpose load the order details on selecting an order and display to pre-defined elements via elements' id
 * @param searchValue
 * @param dataTable
 * @param displayOrder
 */
function displayOrderDetails (searchValue, displayOrder, dataTable){
    var itemLineIdList;
    var itemLineNameList;
    //check if the string is empty
    if (searchValue == "") {
        //alert user to input a text
        alert(message.displayDetails.noAttributeID);
        return;
    } else {
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        //once the page is load, display the details
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                var orderDetailsArray = JSON.parse(xmlhttp.responseText);
console.log(orderDetailsArray);
                console.log("single first item: "+orderDetailsArray[0]);
                console.log("single last item: "+orderDetailsArray[orderDetailsArray.length - 1]);

                // show the data table
                $("#"+displayOrder).show();

                if (orderDetailsArray.length > 0) {
                    // set the fields to writable + set the value to those fields
                    $('#'+config.issue.customerNameID).attr({readonly : false, value : orderDetailsArray[0].customerLongName, readonly : true});
                    $('#'+config.issue.customerBillingAddressID).attr({readonly : false, value : orderDetailsArray[0].customerBillingAddress, readonly : true});
                    $('#'+config.issue.customerShippingAddressID).attr({readonly : false, value : orderDetailsArray[0].orderShippingAddress, readonly : true});
                    orderLineIdList = orderDetailsArray[0].orderLineID.split("|");
                    console.log("order line id list: " + orderLineIdList);
                    itemLineIdList = orderDetailsArray[0].itemLineID.split("|");
                    itemLineNameList = orderDetailsArray[0].itemLineName.split("|");

                    var table = document.getElementById(dataTable);
                    // remove all the current options before adding a new one
                    // ref: http://stackoverflow.com/questions/47824/how-do-you-remove-all-the-options-of-a-select-box-and-then-add-one-option-and-se
                    $("#" + dataTable + " select")
                        .find('option')
                        .remove()
                        .end();

                    $("#"+dataTable + " input").attr("value","");

                    // add new options to select boxes
                    for (var j = 0; j < table.rows.length; j++){
                        for (var i = 0; i < itemLineIdList.length; i++){
                            $("#item_id_select_" + j)
                                .append($('<option></option>').val(itemLineIdList[i]).html(itemLineIdList[i]));
                            $("#item_name_select_" + j)
                                .append($('<option></option>').val(itemLineIdList[i]).html(itemLineNameList[i]));
                        }
                    }
                }
                setTimeout(displayOrderLineDetails('0','item_name_select_0'),1000);
                //setTimeout(displayStorageLocationDetails('0','item_name_select_0'),1000);
            }
        }
    }
    //open file to run the search based on the params in url
    xmlhttp.open("GET","../php/"+config.searchPHPName+".php?search="+searchValue+"&searchType=order",true);
    //send the request to server
    xmlhttp.send();
}

function displayOrderLineDetails (selectedIndex, selectId){
    var orderLineId;
    var storageLocationIdList;
    var dateDeliver;
    //get the location of desired destination cells
    var rowIndex = selectId.slice(-1);
    //check if the string is empty
    if (selectedIndex === "") {
        //alert user to input a text
        console.log(selectedIndex);
        alert(message.displayDetails.noAttributeID);
        return;
    } else {
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        console.log("select index: " + selectedIndex);
        orderLineId = orderLineIdList[selectedIndex];
        //once the page is load, display the details
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                var orderLineArray = JSON.parse(xmlhttp.responseText);
                console.log(xmlhttp.responseText);
                console.log(orderLineArray);
                //console.log("single first item: "+orderLineArray.length);
                //console.log("single last item: "+orderLineArray[orderLineArray.length - 1]);

                if (orderLineArray.result == "success") {
                    storageLocationIdList = orderLineArray.storageLocationId.split("|");
                    itemStorageLocationIdList = orderLineArray.itemStorageLocationId.split("|");
                    // set the fields to writable + set the value to those fields
                    $('#row-' + rowIndex + "_col-" + config.issue.lineIDCol + " input").attr({value : orderLineArray.orderLineID});
                    console.log("order Line ID: " + orderLineArray.orderLineID);
                    // change the name/id select box accordingly
                    // ref for JS: http://www.w3schools.com/jsref/prop_select_selectedindex.asp
                    // ref for jquery: http://stackoverflow.com/questions/1314245/set-the-selected-index-of-a-dropdown-using-jquery
                    $('#row-' + rowIndex + "_col-" + config.issue.selectionCol + " select").prop('selectedIndex', selectedIndex);
                    $('#row-' + rowIndex + "_col-" + config.issue.selectionNameCol + " select").prop('selectedIndex', selectedIndex);
                    console.log('#row-' + rowIndex + "_col-" + config.issue.selectionNameCol + " select index: " + selectedIndex);
                    $('#row-' + rowIndex + "_col-" + config.issue.issuedOrderedQuantityCol + " input").attr({readonly : false, value : orderLineArray.issuedQuantity + "/" + orderLineArray.orderedQuantity, readonly : true});

                    $("#storage_location_select_" + rowIndex)
                        .find('option')
                        .remove()
                        .end();

                    for (var i = 0; i < storageLocationIdList.length; i++){
                        $("#storage_location_select_" + rowIndex)
                            .append($('<option></option>').val(itemStorageLocationIdList[i]).html(storageLocationIdList[i]))
                    }

                    $('#row-' + rowIndex + "_col-" + config.issue.itemUnitOfMeasurementCol + " input").attr({readonly : false, value : orderLineArray.itemUnitOfMeasurement, readonly : true});
                    console.log('#row-' + rowIndex + "_col-" + config.issue.itemUnitOfMeasurementCol + " input" + " : " + orderLineArray.itemUnitOfMeasurement);
                    dateDeliver = orderLineArray.deliveryDate;
                    $('#row-' + rowIndex + "_col-" + config.issue.deliveryDateCol + " input").attr({readonly : false, value : dateDeliver.substr(0,10), readonly : true});
                    console.log('#row-' + rowIndex + "_col-" + config.issue.deliveryDateCol + " input" + " : " + dateDeliver.substr(0,10));
                    $('#row-' + rowIndex + "_col-" + config.issue.priceCol + " input").attr({readonly : false, value : orderLineArray.orderLineSellingPrice, readonly : true});
                    console.log('#row-' + rowIndex + "_col-" + config.issue.priceCol + " input" + " : " + orderLineArray.orderLineSellingPrice);
                }
                setTimeout(displayItemStorageLocationDetails(0, selectId), 1000);
            }
        }
    }
    //open file to run the search based on the params in url
    xmlhttp.open("GET","../php/"+config.searchPHPName+".php?search="+orderLineId+"&searchType=order_line",true);
    //send the request to server
    xmlhttp.send();
}

function displayItemStorageLocationDetails(selectedIndex, selectId){
    var itemStorageLocationId;
    //get the location of desired destination cells
    var rowIndex = selectId.slice(-1);
    //check if the string is empty
    if (selectedIndex === "") {
        //alert user to input a text
        console.log(selectedIndex);
        alert(message.displayDetails.noAttributeID);
        return;
    } else {
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        console.log("select index: " + selectedIndex);
        itemStorageLocationId = itemStorageLocationIdList[selectedIndex];
        //once the page is load, display the details
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                var storageLocationArray = JSON.parse(xmlhttp.responseText);
                console.log(xmlhttp.responseText);
                console.log(storageLocationArray);
                //console.log("single first item: "+orderLineArray.length);
                //console.log("single last item: "+orderLineArray[orderLineArray.length - 1]);

                if (storageLocationArray.result == "success") {
                    $('#row-' + rowIndex + "_col-" + config.issue.inStockCol + " input").attr({readonly : false, value : storageLocationArray.itemStorageLocationQuantity, readonly : true});
                }
            }
        }
    }
    //open file to run the search based on the params in url
    xmlhttp.open("GET","../php/"+config.searchPHPName+".php?search="+itemStorageLocationId+"&searchType=item_storage_location",true);
    //send the request to server
    xmlhttp.send();
}

function displayStorageLocationDetails(searchValue, fieldId){
    if (searchValue === "") {
        //alert user to input a text
        console.log(searchValue);
        alert(message.displayDetails.noAttributeID);
        return;
    } else {
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        //once the page is load, display the details
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                var storageLocationArray = JSON.parse(xmlhttp.responseText);
                console.log(xmlhttp.responseText);
                //console.log("single first item: "+orderLineArray.length);
                //console.log("single last item: "+orderLineArray[orderLineArray.length - 1]);

                if (storageLocationArray.result == "success") {
                    $('#' + fieldId).show();
                    $("#" + config.receipt.storageLocationShelfID).attr({readonly : false, value : storageLocationArray.storage_location_shelf, readonly : true});
                    $("#" + config.receipt.storageLocationRowID).attr({readonly : false, value : storageLocationArray.storage_location_row, readonly : true});
                    $("#" + config.receipt.storageLocationColumnID).attr({readonly : false, value : storageLocationArray.storage_location_column, readonly : true});
                    $("#" + config.receipt.storageLocationConditionID).attr({readonly : false, value : storageLocationArray.storage_location_condition, readonly : true});

                }
            }
        }
    }
    //open file to run the search based on the params in url
    xmlhttp.open("GET","../php/"+config.searchPHPName+".php?search="+searchValue+"&searchType=storage_location",true);
    //send the request to server
    xmlhttp.send();
}

function displayStorageLocationIdList(searchValue){
    if (searchValue === "") {
        //alert user to input a text
        console.log(searchValue);
        alert(message.displayDetails.noAttributeID);
        return;
    } else {
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        //once the page is load, display the details
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                var storageLocationIdListArray = JSON.parse(xmlhttp.responseText);
                console.log(xmlhttp.responseText);

                if (storageLocationIdListArray.result == "success") {
                    var warehouseStorageLocationIdList = storageLocationIdListArray.storage_location_id_list.split("|");

                    $("#storage_location_id_select")
                        .find('option')
                        .remove()
                        .end()
                        .append($('<option></option>').html("Please select a storage location"));

                    for (var m = 0; m < warehouseStorageLocationIdList.length; m++){
                        $("#storage_location_id_select")
                            .append($('<option></option>').val(warehouseStorageLocationIdList[m]).html(warehouseStorageLocationIdList[m]))
                    }
                }
            }
        }
    }
    //open file to run the search based on the params in url
    xmlhttp.open("GET","../php/"+config.searchPHPName+".php?search="+searchValue+"&searchType=warehouse",true);
    //send the request to server
    xmlhttp.send();
}

function displayCurrencyRate(){
    $("#exchange_rate_display").attr({readonly : false, value : $("#exchange_rate").val(), readonly: true});
}
