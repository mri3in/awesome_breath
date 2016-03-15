//Function validateCustomerName to validate customer name
//Input text
//The function will check input, if the input incorrect. Function validateCustomerName will warning invalid value
function validateCustomerName(customer_name) {
	var x = document.f.customer_name.value;
	return /^[A-z ]+$/.test(x);
}

//Function validateCustomerName to validate customer name
//Input text
//The function will check input, if the input incorrect. Function validateCustomerName will warning invalid value
function validateCustomerName(customer_name) {
function validateContactName(customer_contact_person_name) {
	var x = document.f.customer_contact_person_name.value;
	return /^[A-z ]+$/.test(x);
}

//Function validatePhone to validate phone number
//Input number
//The function will check input, if the input incorrect. Function validatePhone will warning invalid value
function validatePhone(customer_contact_person_phone_number) {
    var error = "";
    var stripped = customer_contact_person_phone_number.value.replace(/[\(\)\.\-\ ]/g, '');     

   if (customer_contact_person_phone_number.value == "") {
        error = "You didn't enter a phone number.\n";
        customer_contact_person_phone_number.style.background = 'Yellow';
    } else if (isNaN(parseInt(stripped))) {
        error = "The phone number contains illegal characters.\n";
        customer_contact_person_phone_number.style.background = 'Yellow';
    } else if (!(stripped.length == 10)) {
        error = "The phone number is the wrong length. Make sure you included an area code.\n";
        customer_contact_person_phone_number.style.background = 'Yellow';
    } 
    return error;
}

//Function validateTaxCode to validate customer tax code
//Input number
//The function will check input, if the input incorrect. Function validateTaxCode will warning invalid value
function validateTaxCode (customer_tax_code) {
    var taxcode = /^[0-9]+$/;
    if(customer_tax_code.value.match(taxcode)) {
        alert("Your customer tax code is valid");
        document.forms.text.focus();
        return true;
    }
    else
    {
        alert("Your customer tax code is invalid");
        document.forms.text.focus();
        return false;
    }
    
}