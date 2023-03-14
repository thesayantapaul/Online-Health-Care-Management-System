/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function aaa() {
    console.log('cccc')
}



$('#btn-validate').click(function () {
    var $captcha = $('#recaptcha'),
            response = grecaptcha.getResponse();

    if (response.length === 0) {
        $('.msg-error').text("reCAPTCHA is mandatory");
        if (!$captcha.hasClass("error")) {
            $captcha.addClass("error");
        }
    } else {
        $('.msg-error').text('');
        $captcha.removeClass("error");
        alert('reCAPTCHA marked');
    }
})