// var ready;

// $(document).ready(function($) {
//     validate_phone_number();
// });

// function validate_phone_number()
// {
//    $('.telephone-validation').mask('999-999-9999');
// }

$(document).on('focus', '.test', function() {
  jQuery.validator.addMethod("phoneUS", function(phone_number, element) {
  debugger;
    phone_number = phone_number.replace(/\s+/g, "");
    return this.optional(element) || phone_number.length > 9 &&
    phone_number.match(/^\d{3}-\d{3}-\d{4}$/);
  }, "Please specify a valid telephone number (xxx-xxx-xxxx)");
})


