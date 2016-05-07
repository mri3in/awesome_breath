/**
 * Modified by Hoang Anh on 08/04/2016.
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

// Modified by Hai Phong and Cuong Phan
// function to dynamically add row to transaction line, load select item and add calculating function to input
function addRow(tableID) {
    var table = document.getElementById(tableID);   //set an table object by selecting the element from the given param
    var rowCount = table.rows.length;               //count the number of rows of table
    //alert(rowCount);
    var maxRowCount = 10;                           // set up the maximum number of row
    var selectLocation = 2;                         // set up the location of select
    if(rowCount < maxRowCount){						// limit the user from creating fields more than your limits
        var row = table.insertRow(rowCount);        // insert a new row
        var colCount = table.rows[0].cells.length;  // get the number of columns to limit the loop
        row.id = 'row-'+ (rowCount - 1);                   // get the id for the current row
        for(var i=0; i<colCount; i++) {             // a loop to insert new cells and set up new ID for each cell and the select
            var newCell = row.insertCell(i);        // insert a new cell
            var rowIndexId = rowCount - 1;          // get the row index
            newCell.id = "row-" + rowIndexId + "_col-" + i; // set up new ID
            if (i == selectLocation) {              // find the select box column location
                var newStr = function(){            // run a function to create new id, find & replace old id
                    var newID = "item_id_select_" + rowIndexId; //set up new id for select box
                    var str = table.rows[1].cells[i].innerHTML.replace("item_id_select_0", newID); // replace the old id in innerHTML
                    return str;
                };
                newCell.innerHTML = newStr();       // write the updated innerHTML to the column containing the select
            }
            else {
                newCell.innerHTML = table.rows[1].cells[i].innerHTML; // if the column does not contain select box, duplicate the previous one
            }
        }
        var listitems= row.getElementsByTagName("input")             //get the html tag "input"
        for (i=0; i<listitems.length; i++) {                         //a loop to insert function to calculate the total value of order
            listitems[i].removeAttribute("oninput");
            listitems[i].setAttribute("onchange", "totalTransaction('"+row.id+"')");
            listitems[i].setAttribute("value", "");

        }
    }else{
        // display message if reaching the maximum number of order lines
        alert("Maximum order line per order is " + maxRowCount + "!");

    }
}


    // /**
    //  function: deleteRow(tableID)
    //  purpose: delete rows that have checked checkboxes and update ids for elements correspondingly
    //  inputs: tableID
    //  outputs: none
    //  */
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
        var rowIndexIdRemake = j -1;
        // a loop to update ids
        for(var m=0; m<colCount; m++) {
            // get the old id
            var oldCellId = table.rows[j].cells[m].id;
            // if the column does not contain select box, update id of cell only
            if (m!==2){
                table.rows[j].cells[m].id = "row-" + rowIndexIdRemake + "_col-" +m;
            }
            else {
                // update the cell id and select id
                table.rows[j].cells[m].id = "row-" + rowIndexIdRemake + "_col-" + m;
                // set new select id
                var selectNewId = "item_id_select_" + rowIndexIdRemake;
                // catch the old id
                var numberOfRow = oldCellId.slice(4,5);
                var selectOldId = "item_id_select_" + numberOfRow;
                // change the id of the select
                $("#" + selectOldId).attr("id",selectNewId);
            }
        }
    }
}

//    This Script is to calculate the total value of each transaction line
//    Reference http://stackoverflow.com/questions/31470273/perform-calculations-on-dynamically-added-rows
//              http://stackoverflow.com/questions/24307292/how-can-i-get-the-value-of-an-input-in-a-specific-table-cell-using-javascript
function purchaseCost(elementID) {
        // declare variable of the unique id of the table cell
        var qnty = elementID + "_col-4"
        var price = elementID + "_col-5"
        var totalPrice = elementID + "_col-6"
		

        //get value of the input inside table cell with the unique id
        var myBox1 = document.getElementById(qnty).getElementsByTagName('input')[0].value;
        var myBox2 = document.getElementById(price).getElementsByTagName('input')[0].value;
        var myBox3 =  document.getElementById(totalPrice).getElementsByTagName('input')[0];
		currencySell = $('#exchange_rate').val()
        //calculate the total price and display the result
        var result = myBox1 * myBox2 * currencySell;
        myBox3.value =  result;
    }

//    This Script is to sum up the value of all order line and display it to the total cost, with the input id="totaltransaction"
//    http://stackoverflow.com/questions/13540751/how-get-total-sum-from-input-box-values-using-javascript
function sumTransaction() {
    var arr = document.getElementsByName('item_total_cost[]')
    var total = 0
    for(var i=0;i<arr.length;i++){
        if(parseInt(arr[i].value))
            total += parseInt(arr[i].value);
    }
    document.getElementById('totaltransaction').value = total

}
function sumQuantity() {
    var arr = document.getElementsByName('item_quantity[]')
    var totalQty = 0
    for(var i=0;i<arr.length;i++){
        if(parseInt(arr[i].value))
            totalQty += parseInt(arr[i].value);
    }
    document.getElementById('totalquantity').value = totalQty

}
//    This Script is to call all function above so that all input will affect the total transaction,with the input id="totaltransaction"
function totalTransaction (elementID) {

   purchaseCost(elementID);
	sumTransaction();
	sumQuantity();
}