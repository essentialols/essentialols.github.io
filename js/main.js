
(function ($) {
    "use strict";

    
    /*==================================================================
    [ Validate ]*/
    var name = $('.validate-input input[name="name"]');
    var email = $('.validate-input input[name="email"]');
    var subject = $('.validate-input input[name="subject"]');
    var message = $('.validate-input textarea[name="message"]');


//     $('.validate-form').on('submit',function(){
// //         print("entered validate form function")
//         var check = true;

//         if($(name).val().trim() == ''){
//             showValidate(name);
//             check=false;
//         }

//         if($(subject).val().trim() == ''){
//             showValidate(subject);
//             check=false;
//         }


//         if($(email).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
//             showValidate(email);
//             check=false;
//         }

//         if($(message).val().trim() == ''){
//             showValidate(message);
//             check=false;
//         }
// //         print("did all sorts of validation checks")

//         if(!check)
//             return false

//         e.preventDefault();
      
        $.ajax({
            url: "https://script.google.com/macros/s/AKfycbwvv77la5sScQimvFV7dr7d8Y33A8Z0GjgAQOmJTIOu0mWeW0dj6j6XMeBA4hlPl2ASkw/exec",
            method: "POST",
            dataType: "json",
            data: $(".contact1-form").serialize(),
            success: function(response) {
                
                if(response.result == "success") {
                    $('.contact1-form')[0].reset();
                    alert('Thank you for contacting us.');
                    return true;
                }
                else {
                    alert("Something went wrong. Please try again.")
                }
            },
            error: function() {
                
                alert("Something went wrong. Please try again.")
            }
        })
//     });


//     $('.validate-form .input1').each(function(){
//         $(this).focus(function(){
//            hideValidate(this);
//        });
//     });

//     function showValidate(input) {
//         var thisAlert = $(input).parent();

//         $(thisAlert).addClass('alert-validate');
//     }

//     function hideValidate(input) {
//         var thisAlert = $(input).parent();

//         $(thisAlert).removeClass('alert-validate');
//     }

})(jQuery);
