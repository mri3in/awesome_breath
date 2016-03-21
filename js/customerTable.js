/**
 * Created by Cuong Phan on 16/03/2016.
 */

/* Source:http://stackoverflow.com/questions/8019797/jquery-making-entire-table-row-a-link-apart-from-one-column
 * This script enable the whole table row to be clickable except the first column
 */
$(document).ready(function()
{
    $('#customerTable tr').each(function(i,e)
    {
        $(e).children('td:not(:first)').click(function()
        {
            //here we are working on a td element, that's why we need
            //to refer to its parent (tr) in order to find the <a> element
            var href = $(this).closest("tr").find("a").attr("href");
            if(href)
            {
                window.location = href;
            }
        });
    });
});


/* Source: http://stackoverflow.com/questions/15510708/color-row-based-on-cell-value
  This Script will paint the table row with the different status in Customer Table
*/
// get element by id
var rows = document.getElementById("customerTable").getElementsByTagName("tbody")
    [0].getElementsByTagName("tr");
// loops through each row
for (i = 1; i < rows.length; i++) {cells = rows[i].getElementsByTagName('td');
    if (cells[7].innerHTML == 'Active')
        rows[i].className = "";

    if (cells[7].innerHTML == 'Suspended')
        rows[i].className = "warning";

    if (cells[7].innerHTML == 'Deleted')
        rows[i].className = "danger ";
}