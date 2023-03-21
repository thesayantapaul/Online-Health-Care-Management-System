
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">


        <!--<link rel="stylesheet" href="css/login-icon-style.css">-->

        <!--done-->
        <link rel="stylesheet" href="css/owl.carousel.min.css">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.login.css">

        <!-- Style -->
        <link rel="stylesheet" href="css/loginstyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">

        <title>OHMS Registration</title>
    </head>
    <script src="https://code.jquery.com/jquery-3.6.3.js" 
                        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" 
                crossorigin="anonymous"></script>
    <style>
        .star {
            color: red;
        }
    </style>
    <script>
        function checkEmailExist(email) {

            if (document.getElementById("emailAddress").value === '') {
                alert("please enter email!");
                document.getElementById("emailAddress").focus();
                return false;
            }
            // create a new XMLHttpRequest object
            var xhr = new XMLHttpRequest();

            // set the HTTP method and URL of the request
            xhr.open('GET', 'CheckEmail?emailAddress=' + email, true);

            // set the response type to text
            xhr.responseType = 'text';

            // define a callback function to handle the response
            xhr.onload = function () {
                if (xhr.status === 200) {
                    // success
                    var data = xhr.response;
                    if (data === 'email already exist!') {
                        alert(data);
                        document.getElementById("emailAddress").value = "";
                        //document.getElementById("emailAddress").focus();
                    }

                } else {

                    console.error('Request failed.  Returned status of ' + xhr.status);
                }
            };
            // send the request
            xhr.send();
        }
    </script>
    <script>
        function validatePassword(confirmPassword) {
            var pswd = confirmPassword;
            var password = document.getElementById("password").value;
            //alert(password);
            if (password === "") {
                document.getElementById("message2").innerHTML = "**Please Enter password first";
                document.getElementById("passwordMatchMsg").innerHTML = "";
                return false;
            }
            if (pswd === "") {
                document.getElementById("message2").innerHTML = "";
                document.getElementById("passwordMatchMsg").innerHTML = "";
                return false;
            }
            if (pswd !== password) {
                document.getElementById("message2").innerHTML = "**Passwords are not same";
                document.getElementById("passwordMatchMsg").innerHTML = "";
                return false;
            }
            if (pswd === password) {

                document.getElementById("passwordMatchMsg").innerHTML = "**Passwords matched";

                document.getElementById("message2").innerHTML = "";
                return false;

            }

        }
        function validatePasswordFormat(password) {
            var mainPassword = password;
            if (mainPassword === "") {
                document.getElementById("message1").innerHTML = "";
                return false;
            }
            if (mainPassword.length < 8) {
                document.getElementById("message1").innerHTML = "*Password length must be atleast 8 characters";
                return false;
            } else {
                document.getElementById("message1").innerHTML = "";
                return false;
            }
            if (mainPassword.length > 12) {
                document.getElementById("message1").innerHTML = "*Password length should not exceed 12 characters";
                return false;
            }

        }
        function allLetter(inputtxt)
        {
            var firstName = inputtxt;
            //alert(firstName);
            if (firstName === "") {
                document.getElementById("firstNameMsg").innerHTML = "";
                return false;
            }
            var letters = /^[A-Za-z]+$/;
            if (firstName.match(letters))
            {
                document.getElementById("firstNameMsg").innerHTML = "";
                return true;

            } else
            {
                document.getElementById("firstNameMsg").innerHTML = "*Please input alphabet characters only";
                return false;
            }
        }
        function allLetterInLastName(inputtxt)
        {
            var lastName = inputtxt;
            if (lastName === "") {
                document.getElementById("lastNameMsg").innerHTML = "";
                return false;
            }
            //alert(firstName);
            var letters = /^[A-Za-z]+$/;
            if (lastName.match(letters))
            {
                document.getElementById("lastNameMsg").innerHTML = "";
                return true;

            } else
            {
                document.getElementById("lastNameMsg").innerHTML = "*Please input alphabet characters only";
                return false;
            }
        }
        function checkconfirmPassword(confirmPassword) {

            var confirmPswd = confirmPassword;
            var mainPassword = document.getElementById("password").value;
            if (confirmPswd === "") {
                alert("please re-enter password to continue");
                document.getElementById("confirmPassword").focus();
                return false;
            }
            if (confirmPswd !== mainPassword) {
                alert("password didn't match");
                document.getElementById("confirmPassword").value = "";
                document.getElementById("confirmPassword").focus();
                return false;
            }
        }

    </script>
    <body style="overflow: scroll; height : 90%" id="social">
        <div class="d-md-flex half">
            <div class="bg" style="background-image: url('images/login-side.jpg');height: 1309px"></div>
            <div class="contents">

                <div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-md-12">
                            <div class="form-block mx-auto">
                                <div class="text-center mb-5">
                                    <h3 class="text-uppercase">Please Register With <strong> OHMS </strong></h3>
                                </div>
                                <form action="SignUp" method="POST" id="my_captcha_form">
                                    <div class="form-group first">
                                        <label for="firstName">First Name <sup class="star">*</sup></label>
                                        <input name="firstName" type="text" class="form-control" placeholder="First Name" id="firstName" required onkeyup="allLetter(this.value)" pattern="[a-zA-Z]+" title="Alphabets only">
                                        <p style="color: red" id="firstNameMsg"></p>
                                    </div>
                                    <div class="form-group first">
                                        <label for="lastName">Last Name<sup class="star">*</sup></label>
                                        <input name="lastName" type="text" class="form-control" placeholder="Last Name" id="lastName" required onkeyup="allLetterInLastName(this.value)" pattern="[a-zA-Z]+" title="Alphabets only">
                                        <p style="color: red" id="lastNameMsg"></p>
                                    </div>
                                    <div class="form-group first">
                                        <label for="emailAddress">Email Address<sup class="star">*</sup></label>
                                        <input name="emailAddress" type="email" class="form-control" placeholder="your-email@gmail.com" id="emailAddress" onchange="checkEmailExist(this.value)" required>
                                    </div>

                                    <div class="form-group last mb-3">
                                        <label for="password">Password<sup class="star">*</sup></label>
                                        <input name="password" type="password" class="form-control" placeholder="Enter Password" id="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" onkeyup="validatePasswordFormat(this.value)" required>

                                        <p style="color: red" id="message1"></p>
                                    </div>
                                    <div class="form-group last mb-3">
                                        <label for="confirmPassword">Confirm Password<sup class="star">*</sup></label>
                                        <input name="confirmPassword" type="password" class="form-control" placeholder="re-type Password" id="confirmPassword"required onkeyup="validatePassword(this.value)" onchange="checkconfirmPassword(this.value)">
                                        <p style="color: red" id="message2"></p>
                                        <p style="color: green" id="passwordMatchMsg"></p>
                                    </div>

                                    <div class="form-group last mb-3">

                                        <label class="gender" for="inlineFormCustomSelectPref" id="gender">Choose Gender<sup class="star">*</sup></label>
                                        <select  name="gender" class="form-control" id="genderId">
                                            <option value="0" disabled>Select Gender</option>
                                            <option value="male">Male</option>
                                            <option value="female">Female</option>
                                            <option value="others">Others</option>
                                        </select>
                                    </div>

                                    <div class="form-group last mb-3">
                                        <label for="occupation">Occupation<sup class="star">*</sup></label>
                                        <input name="occupation" type="text" class="form-control" placeholder="Your Occupation" id="occupation" required>
                                    </div>
                                    <div class="form-group last mb-3">
                                        <label for="address">Address<sup class="star">*</sup></label>
                                        <input name="address" type="text" class="form-control" placeholder="Your Address" id="address" required>
                                    </div>
                                    <div class="d-sm-flex mb-5 align-items-center">
                                        <span class="ml-auto"><a href="resetPassword.jsp" class="forgot-pass">Forgot Password</a></span>
                                    </div>
                                    <div class="g-recaptcha" data-sitekey="6LcQjK0kAAAAALMogTAZqQcjHJftku7jwQSL4jIV"></div><br>
                                    <button type="submit" value="Sign Up" class="btn btn-block py-2 btn-primary">Sign Up</button>
                                </form>
                                <span class="text-center my-3 d-block">or</span>
                                <center><jsp:include page="demo.jsp"></jsp:include></center>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                document.getElementById("my_captcha_form").addEventListener("submit", function (evt)
                {

                    var response = grecaptcha.getResponse();
                    if (response.length === 0)
                    {
                        //reCaptcha not verified------------------------------------------------------------------------------
                        alert("please verify you are humann!");
                        evt.preventDefault();
                        return false;
                    }
                    //captcha verified

                });
            </script>

            <script src="js/jquery-3.3.1.min.js"></script>
            <script src="js/popper.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script src="js/main.js"></script>
    </body>
</html>
