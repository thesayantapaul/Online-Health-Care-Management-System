<%-- 
    Document   : login
    Created on : 21-Feb-2023, 4:56:03 pm
    Author     : SAYANTA PAUL
--%>


<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">


        <!--<link rel="stylesheet" href="css/login-icon-style.css">-->

        <!--done-->
        <link rel="stylesheet" href="css/owl.carousel.min.css"> 

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.login.css">

        <!-- Style -->
        <link rel="stylesheet" href="css/loginstyle.css">

        <title>OHMS Registration</title>
    </head>
    <body>
        <div class="d-md-flex half">
            <div class="bg" style="background-image: url('images/login-side.jpg');"></div>
            <div class="contents">

                <div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-md-12">
                            <div class="form-block mx-auto">
                                <div class="text-center mb-5">
                                    <h3 class="text-uppercase">Please Register With <strong> OHMS </strong></h3>
                                </div>
                                <form action="Login" method="POST">                        
                                    <div class="form-group first">
                                        <label for="firstName">First Name</label>
                                        <input name="firstName" type="text" class="form-control" placeholder="First Name" id="firstName">
                                    </div>
                                    <div class="form-group first">
                                        <label for="lastName">Last Name</label>
                                        <input name="lastName" type="text" class="form-control" placeholder="Last Name" id="lastName">
                                    </div>                               
                                    <div class="form-group first">
                                        <label for="emailAddress">Email Address</label>
                                        <input name="emailAddress" type="text" class="form-control" placeholder="your-email@gmail.com" id="emailAddress">
                                    </div>

                                    <div class="form-group last mb-3">
                                        <label for="password">Password</label>
                                        <input name="password" type="password" class="form-control" placeholder="Your Password" id="password">
                                    </div>

                                    <div class="form-group last mb-3">

                                        <label class="gender" for="inlineFormCustomSelectPref" id="gender">Choose Gender</label>
                                        <select  name="gender" class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
                                            <option selected>Select Gender</option>
                                            <option value="1">Male</option>
                                            <option value="2">Female</option>
                                            <option value="3">Others</option>
                                        </select>
                                    </div>

                                    <div class="form-group last mb-3">
                                        <label for="occupation">Occupation</label>
                                        <input name="occupation" type="password" class="form-control" placeholder="Your Occupation" id="occupation">
                                    </div>

                                    <div class="form-group last mb-3">
                                        <label for="address">Address</label>
                                        <input name="address" type="password" class="form-control" placeholder="Your Address" id="address">
                                    </div>

                                    <div class="d-sm-flex mb-5 align-items-center">
                                        <label class="control control--checkbox mb-3 mb-sm-0"><span class="caption">Remember me</span>
                                            <input type="checkbox" checked="checked"/>
                                            <div class="control__indicator"></div>
                                        </label>
                                        <span class="ml-auto"><a href="#" class="forgot-pass">Forgot Password</a></span> 
                                    </div>
                                    <button type="submit" value="Sign Up" class="btn btn-block py-2 btn-primary">Sign Up</button>
                                </form>
                                <span class="text-center my-3 d-block">or</span>


                                <div class="">
                                    <!--                                    <a href="#" class="btn btn-block py-2 btn-facebook">
                                                                            <span class="icon-facebook mr-3"></span> Login with facebook
                                                                        </a>-->
                                    <a href="#" class="btn btn-block py-2 btn-google"><span class="icon-google mr-3"></span> Signup with Google</a>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>



        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>