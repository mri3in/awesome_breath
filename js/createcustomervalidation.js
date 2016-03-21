//Use for Create and save customer
//Function validateCustomerName to validate customer name
//Input text
//The function will check input, if the input incorrect. Function validateCustomerName will warning invalid value
function validateCustomerName(customer_name) {
	var x = document.f.customer_name.value;
	return /^[A-z ]+$/.test(x);
}

//Function validateCustomerLongName to validate customer long name
//Input text
//The function will check input, if the input incorrect. Function validateCustomerLongName will warning invalid value
function validateCustomerLongName(customer_long_name) {
	var x = document.f.customer_long_name.value;
	return /^[A-z ]+$/.test(x);
}

//Function validateCustomerName to validate customer name
//Input text
//The function will check input, if the input incorrect. Function validateCustomerName will warning invalid value
function validateContactName(customer_contact_person_name) {
	var x = document.f.customer_contact_person_name.value;
	return /^[A-z ]+$/.test(x);
}

//Function validateContactPersonEmail to validate customer contact person email
//input both text and number
//The function will check input, if the input incorrect. Function validateContactPersonEmail will warning invalid value
function validateContactPersonEmail(customer_contact_person_email) {
	var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	return re.test(customer_contact_person_email);
}

//Function validatePhone to validate phone number
//Input number
//The function will check input, if the input incorrect. Function validatePhone will warning invalid value
function validateContactPersonPhoneNumber (customer_contact_person_phone_number) {
    var contactpersonphonenumber = /^[0-9]+$/;
    if(customer_contact_person_phone_number.value.match(contactpersonphonenumbermber)) {
        alert("Your customer contact person phone number is valid");
        document.forms.text.focus();
        return true;
    }
    else
    {
        alert("Your customer contact person phone number is invalid");
        document.forms.text.focus();
        return false;
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

//Use for create and edit Order form
//Function validateOrderQuantity to validate order line item quantity
//Input number
//The function will check input, if the input incorrect. Function validateOrderQuantity will warning invalid value
function validateOrderQuantity (order_line_item_quantity) {
    var itemquantity = /^[0-9]+$/;
    if(order_line_item_quantity.value.match(itemquantity)) {
        alert("Your Quantity is valid");
        document.forms.text.focus();
        return true;
    }
    else
    {
        alert("Your Quantity is invalid");
        document.forms.text.focus();
        return false;
    }
}

//Function validateVAT to validate item VAT
//Input number
//The function will check input, if the input incorrect. Fuction validateVAT will warning invalid value
function validateVAT (item_VAT) {
    var itemvat = parseFloat(item_VAT);
    if (isNaN(itemvat) || itemvat < 0 || itemvat < 100) {
        alert("Your VAT amount is invalid");
        document.forms.text.focus();
        return true;
    }
    else
    {
        alert("Your VAT amount is valid");
        document.forms.text.focus();
        return false;
    }
}

//Function validateSellingPrice to validate selling price
//Input number
//The function will check input, if the input incorrect. Fuction validateSellingPrice will warning invalid value
function validateSellingPrice (order_line_selling_price) {
    var sellingprice = parseFloat(order_line_selling_price);
    if (isNaN(sellingprice) || sellingprice > 0) {
        alert("Your selling price is valid");
        document.forms.test.focus();
        return true;
    }
    else
    {
        alert("Your selling price is invalid");
        document.forms.text.focus();
        return false;
    }
}

//Use for Edit Quotation
//Function validateQuotationQuantity
//Input number
//The function will check input, if the input incorrect. Fuction validateQuotationQuantity will warning invalid value
function validateQuotationQuantity (order_line_item_quantity) {
    var quotationitemquantity = /^[0-9]+$/;
    if(order_line_item_quantity.value.match(quotationitemquantity)) {
        alert("Your Quantity is valid");
        document.forms.text.focus();
        return true;
    }
    else
    {
        alert("Your Quantity is invalid");
        document.forms.text.focus();
        return false;
    }
}

//Function validateVAT to validate item VAT
//Input number
//The function will check input, if the input incorrect. Fuction validateVAT will warning invalid value
function validateQuotationVAT (item_VAT) {
    var quotationitemvat = parseFloat(item_VAT);
    if (isNaN(quotationitemvat) || quotationitemvat < 0 || quotationitemvat < 100) {
        alert("Your VAT amount is invalid");
        document.forms.text.focus();
        return true;
    }
    else
    {
        alert("Your VAT amount is valid");
        document.forms.text.focus();
        return false;
    }
}

//Function validateSellingPrice to validate selling price
//Input number
//The function will check input, if the input incorrect. Fuction validateSellingPrice will warning invalid value
function validateQuotationSellingPrice (order_line_selling_price) {
    var quotationsellingprice = parseFloat(order_line_selling_price);
    if (isNaN(quotationsellingprice) || quotationsellingprice > 0) {
        alert("Your selling price is valid");
        document.forms.test.focus();
        return true;
    }
    else
    {
        alert("Your selling price is invalid");
        document.forms.text.focus();
        return false;
    }
}


