    $(function() {
       $("#submit").click(function(){
          if (confirm("Are you sure you want to perform this action?")){
             $('form#myForm').submit();
          }
          else {
              return false;
          }
       });
    });
