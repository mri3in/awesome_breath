//This function add comma on the front page where data is displayed in the table - target cell with class = numbers
//Source: http://stackoverflow.com/questions/1990512/add-comma-to-numbers-every-three-digits
//Owner: Dang Lam
function addCommas(nStr)
{
   nStr += '';
   x = nStr.split('.');
   x1 = x[0];
   x2 = x.length > 1 ? '.' + x[1] : '';
   var rgx = /(\d+)(\d{3})/;
   while (rgx.test(x1)) {
      x1 = x1.replace(rgx, '$1' + '.' + '$2');
   }
   return x1 + x2;
}

$(function(){
   $(".numbers").each(function(c, obj){
      $(obj).text(addCommas(parseFloat($(obj).text()).toFixed(2)));
   });
});


//This function add comma to the text box in edit or create page - target input box with id = numbers
//Source: http://www.dotnetcurry.com/jquery/1076/using-jquery-add-commmas-numbers-textbox
         //https://blog.tompawlak.org/number-currency-formatting-javascript   
//Owner: Dang Lam
$(function () {
     var x = $('#').val();
        $('#').val(addCommas2(x));
});
 
function addCommas2(x) {
    var parts = x.toString().split(".");
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    return parts.join(".");
}



//This function add comma to the text box at the time user type in the box - target input box with id = numbers
//Source: http://jsfiddle.net/yWTLk/769/
//Owner: Dang Lam
$(document).ready(function(){
    $(".").keyup(function(event){
      // skip for arrow keys
      if(event.which >= 37 && event.which <= 40){
          event.preventDefault();
      }
      var $this = $(this);
      var num = $this.val().replace(/,/gi, "").split("").reverse().join("");
      
      var num2 = RemoveRougeChar(num.replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.").split("").reverse().join(""));
                                   
      console.log(num2);
      
      // the following line has been simplified. Revision history contains original.
      $this.val(num2);
  });
});

function RemoveRougeChar(convertString){
    
    if(convertString.substring(0,1) == ","){
        
        return convertString.substring(1, convertString.length)            
    }
    return convertString;
}