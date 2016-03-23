/**
 * Created by Cuong Phan on 19/03/2016.
 */

/**
 * Projet Name : Dynamic Form Processing with PHP
 * URL: http://techstream.org/Web-Development/PHP/Dynamic-Form-Processing-with-PHP
 *
 * Licensed under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 *
 * Copyright 2013, Tech Stream
 * http://techstream.org
 */
const selectColumn = 2;                         // set up the location of select
const quantityColumn = 4;
const sellingPriceColumn = 7;
const netSellingPriceColumn = 8;
const taxColumn = 9;
const maxRowCount = 10;                           // set up the maximum number of row

// Modified by Hai Phong and Cuong Phan
// function to dynamically add row to order line, load select item and add calculating function to input
function addRow(tableID) {

    var table = document.getElementById(tableID);   //set an table object by selecting the element from the given param
    var rowCount = table.rows.length;               //count the number of rows of table

    if(rowCount < maxRowCount){						// limit the user from creating fields more than your limits
        var row = table.insertRow(rowCount);        // insert a new row
        var colCount = table.rows[0].cells.length;  // get the number of columns to limit the loop
        row.id = 'row-'+ (rowCount - 1);            // get the id for the current row

        for(var i=0; i<colCount; i++) {             // a loop to insert new cells and set up new ID for each cell and the select
            var newCell = row.insertCell(i);        // insert a new cell
            newCell.id = row.id + "_col-" + i; // set up new ID
            var newInputID = "input_" + newCell.id; // set up new id for input

            // based on the i, run different settings
            switch (i){
                // execute if the current cell is the select box column location
                case selectColumn:
                    var newSelectID = "item_id_select_" + row.id.slice(-1); //set up new id for select box
                    // duplicate the first row element
                    newCell.innerHTML = table.rows[1].cells[i].innerHTML;
                    // if the column contain select, change the id, empty the value
                    $('#' + newCell.id + " select").attr({id: newSelectID, value: ""});
                    break;

                // execute if the current cell is the quantity column location
                case quantityColumn:
                    // duplicate the first row element
                    newCell.innerHTML = table.rows[1].cells[i].innerHTML;
                    // if the column contain quantity input, add calculate function
                    //$('#' + newCell.id + " input").attr({id: newInputID, onchange: "sellingPrice('"+row.id+"')", value: ""});
                    $('#' + newCell.id + " input").attr({id: newInputID, onchange: "totalOrderTax(" + tableID+ "," + row.id+ ")", value: ""});
                    break;

                /*// execute if the current cell is the net selling price column location
                case netSellingPriceColumn:
                    // duplicate the first row element
                    newCell.innerHTML = table.rows[1].cells[i].innerHTML;
                    // if the column contain quantity input, add calculate function
                    //$('#' + newCell.id + " input").attr({id: newInputID, onchange: "sumOrder('"+row.id+"')", value: ""});
                    $('#' + newCell.id + " input").attr({id: newInputID, onchange: 'totalOrderTax(' + '"tableID"'+ "," + '"row.id"'+ ")", value: ""});
                    break;

                // execute if the current cell is the tax column location
                case taxColumn:
                    // duplicate the first row element
                    newCell.innerHTML = table.rows[1].cells[i].innerHTML;
                    // if the column contain quantity input, add calculate function
                    //$('#' + newCell.id + " input").attr({id: newInputID, onchange: "sumTax('"+row.id+"')", value: ""});
                    $('#' + newCell.id + " input").attr({id: newInputID, onchange: "totalOrderTax(" + tableID+ "," + row.id+ ")", value: ""});
                    break;
*/
                // in case of no match, run the default script
                default:
                    // duplicate the first row element
                    newCell.innerHTML = table.rows[1].cells[i].innerHTML;
                    // if the column contain value, empty it
                    $('#' + newCell.id).attr("value", "");
            }
        }
        /*var listitems= row.getElementsByTagName("input")             //get the html tag "input"
        for (i=0; i<listitems.length; i++) {                         //a loop to insert function to calculate the total value of order
            listitems[i].setAttribute("onchange", "totalOrderTax('"+row.id+"')");
        }*/
    }else{
        // display message if reaching the maximum number of order lines
        alert("Maximum order line per order is " + maxRowCount + "!");

    }
}


// function to remove dynamically added rows
function deleteRow(tableID) {

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
                alert("Cannot Remove all the order lines.");
                break;
            }
            // delete the corresponding row
            table.deleteRow(i);
            rowCount--;
            i--;
        }
    }

    // a loop to update the current lines' ids
    for(var j=1; j<rowCount; j++) {
        // get the maximum of number of columns
        var colCount = table.rows[0].cells.length;
        // set the new row index to match the array value
        table.rows[j].id = j - 1;
        // a loop to update ids
        for (var m = 0; m < colCount; m++) {
            // get the old id
            var oldCellId = table.rows[j].cells[m].id;
            /*switch (m) {
                case selectColumn:
                    // update the cell id and select id
                    table.rows[j].cells[m].id = "row-" + table.rows[j].id + "_col-" + m;
                    // change the id of the select
                    $('#item_id_select_' + oldCellId.slice(4, 5)).attr("id", 'item_id_select_' + table.rows[j].id);
                    break;

                case quantityColumn:
                    // update the cell id and input id
                    table.rows[j].cells[m].id = "row-" + table.rows[j].id + "_col-" + m;
                    // change the id of the select
                    $("#input_row-" + oldCellId.slice(4, 5) + "_col-" + m).attr({
                        id: "input_row-" + table.rows[j].id + "_col-" + m,
                        onchange: "totalOrderTax(" + tableID + ", " + table.rows[j].id + ")"
                    });
                    break;

                case netSellingPriceColumn:
                    // update the cell id and input id
                    table.rows[j].cells[m].id = "row-" + table.rows[j].id + "_col-" + m;
                    // change the id of the select
                    $("#input_row-" + oldCellId.slice(4, 5) + "_col-" + m).attr({
                        id: "input_row-" + table.rows[j].id + "_col-" + m,
                        onchange: "totalOrderTax(" + tableID + ", " + table.rows[j].id + ")"
                    });
                    break;

                case taxColumn:
                    // update the cell id and input id
                    table.rows[j].cells[m].id = "row-" + table.rows[j].id + "_col-" + m;
                    // change the id of the select
                    $("#input_row-" + oldCellId.slice(4, 5) + "_col-" + m).attr({
                        id: "input_row-" + table.rows[j].id + "_col-" + m,
                        onchange: "totalOrderTax(" + tableID + ", " + table.rows[j].id + ")"
                    });
                    break;

                default:
                        // if the column does not contain specific inputs, update id of cell only
                        table.rows[j].cells[m].id = "row-" + table.rows[j].id + "_col-" + m;
            }*/
            if (m == selectColumn){
                // update the cell id and select id
                table.rows[j].cells[m].id = "row-" + table.rows[j].id + "_col-" + m;
                // change the id of the select
                $('#item_id_select_' + oldCellId.slice(4, 5)).attr("id", 'item_id_select_' + table.rows[j].id);
            }
            else
            if (m == quantityColumn || m == netSellingPriceColumn || m == taxColumn){
                // update the cell id and input id
                table.rows[j].cells[m].id = "row-" + table.rows[j].id + "_col-" + m;
                // change the id of the select
                $("#input_row-" + oldCellId.slice(4, 5) + "_col-" + m).attr({
                    id: "input_row-" + table.rows[j].id + "_col-" + m,
                    onchange: "totalOrderTax(" + tableID + ", row-" + table.rows[j].id + ")"
                });
            }
            else   {
                // if the column does not contain specific inputs, update id of cell only
                table.rows[j].cells[m].id = "row-" + table.rows[j].id + "_col-" + m;
            }
        }
    }
}

//    This Script is to calculate the total value of each order line
//    Reference http://stackoverflow.com/questions/31470273/perform-calculations-on-dynamically-added-rows
function sellingPrice(elementID) {
    alert('#input_' + elementID + '_col-' + sellingPriceColumn);
    //search for the input with the name order_line_selling_price in the current row
    var calculateSellingPrice = parseInt($('#input_' + elementID + '_col-' + sellingPriceColumn).val());

    //search for the input with the name order_line_item_quantity in the current row
    var calculateQuantity = parseInt($('#input_' + elementID + '_col-' + quantityColumn).val());
    //search for the input with the name order_line_net_selling_price in the current row
    //var calculateNetSellingPrice = $('#input_' + elementID + '_col-' + netSellingPriceColumn);
    // calculate the total price of the order line base on the unit price and quantity
    $('#input_' + elementID + '_col-' + netSellingPriceColumn).val(calculateSellingPrice * calculateQuantity);
    /*calculateNetSellingPrice.value = totalOrderLine;
    //alert(calculateSellingPrice + " || " + calculateQuantity);
    alert("calculate S.Price: " + calculateNetSellingPrice.value);*/
    console.log("multiple: " + calculateSellingPrice * calculateQuantity);
}

//    This Script is to sum up the value of all order line and display it to the total Price (Tax exl), with the input id="total"
//    http://stackoverflow.com/questions/13540751/how-get-total-sum-from-input-box-values-using-javascript
function sumOrder(tableID) {
    alert("run");
    //set an table object by selecting the element from the given param
    var table = document.getElementById(tableID);
    //count the number of rows of table
    var rowCount = table.rows.length;
    var total = 0;
    //for (var i=1;i<rowCount;i++){
        var orderValue = parseInt($("#input_row-" + 0 + "_col-" + netSellingPriceColumn).val());
            total += orderValue;
        console.log("get the value of subtotal: " + orderValue + " || value of column: " + $("#input_row-" + 0 + "_col-" + netSellingPriceColumn).val());
        console.log("total: " + total);
    //}
    document.getElementById('total').value = total

}

//    This Script is to sum up the tax of all order line and display it to the total Tax, with the input id="totalTax"
function sumTax(tableID) {
    //set an table object by selecting the element from the given param
    var table = document.getElementById(tableID);
    //count the number of rows of table
    var rowCount = table.rows.length;
    var per = 0.01;
    var totalTax = 0;
    //for (var i=1;i<rowCount;i++){
        var price = parseInt($("#input_row-" + 0 + "_col-" + netSellingPriceColumn).val());
        var tax = parseFloat($("#input_row-" + 0 + "_col-" + taxColumn).val());
            totalTax += tax * price * per;
        console.log("i=" + 0 + " || price=" + price + "  || price value: " + $("#input_row-" + 0 + "_col-" + netSellingPriceColumn).val());
        console.log("tax: " + totalTax);
    //}
    document.getElementById('totalTax').value = totalTax;

}
//    This Script is to call all function above so that all input will affect the total Price, and finally display the total Price (Tax inxl), with the input id="totalOrder"
function totalOrderTax (tableID,elementID) {

    sellingPrice(elementID);
    sumOrder(tableID);
    sumTax(tableID);
    document.getElementById('totalOrder').value = parseInt($("#total").val()) + parseInt($("#totalTax").val())
}