var ready;
$(document).ready(ready);
$(document).on('page:load', ready);

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
});

$(document).on('change', '#billing_mode_of_payment', function() {
  debugger;
  if ( $(this).val() != "" && $(this).val() != "Cash"){
    $(this).parent().parent().parent().parent().find('#js-ref-number').show()
  } else {
    $(this).parent().parent().parent().parent().find('#js-ref-number').hide() 
  }
});

$(document).on('change', '#billing_mode_of_payment', function() {
  if ( $(this).val() != "" && $(this).val() == "DD"){
    $(this).parent().parent().parent().parent().find('#js-dd-number').show()
    $(this).parent().parent().parent().parent().find('#js-check-number').hide()
    $(this).parent().parent().parent().parent().find('#js-online-number').hide()
  } else if ( $(this).val() != "" && $(this).val() == "Check") {
    $(this).parent().parent().parent().parent().find('#js-check-number').show()
    $(this).parent().parent().parent().parent().find('#js-dd-number').hide()
    $(this).parent().parent().parent().parent().find('#js-online-number').hide()
  } else if ( $(this).val() != "" && $(this).val() == "Card") {
    $(this).parent().parent().parent().parent().find('#js-online-number').show()
    $(this).parent().parent().parent().parent().find('#js-dd-number').hide()
    $(this).parent().parent().parent().parent().find('#js-check-number').hide()
  }
});


