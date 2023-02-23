<%-- 
    Document   : signup
    Created on : 22-Feb-2023, 1:37:59 pm
    Author     : Anik Dutta
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
    <body style="overflow: scroll; height : 90%">
        <main class="form-signin w-100 m-auto">
            <div class="d-md-flex half">
                <div class="bg" style="background-image: url('images/login-side.jpg');"></div>
                <div class="contents">

                    <div class="container">
                        <div class="row align-items-center justify-content-center">
                            <div class="col-md-12">
                                <div class="form-block mx-auto">
                                    <div class="text-center mb-5">
                                        <h3 class="text-uppercase">Please Register With <strong>OHMS</strong></h3>
                                    </div>
                                    <form action="SignUp" method="POST">


                                        <div class="form-group first">
                                            <label for="firstName">First Name</label>
                                            <input name="firstName" type="text" class="form-control" placeholder="Avijit" id="firstName">
                                        </div>


                                        <div class="form-group first">
                                            <label for="lastName">Last Name</label>
                                            <input name="lastName" type="text" class="form-control" placeholder="Chattopadhay" id="lastName">
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
                                            <label for="gender">Select Gender</label>

                                            <select name="gender" id="gender">
                                                <option value="male">Male</option>
                                                <option value="female">Female</option>

                                            </select>
                                        </div>



                                        <div class="form-group last mb-3">
                                            <label for="occupation">Occupation</label>
                                            <input name="occupation" type="password" class="form-control" placeholder="Your occupation" id="occupation">
                                        </div>

                                        <div class="form-group last mb-3">
                                            <label for="address">Address</label>
                                            <input name="address" type="password" class="form-control" placeholder="Your address" id="address">
                                        </div>

                                        <div class="d-sm-flex mb-5 align-items-center">
                                            <label class="control control--checkbox mb-3 mb-sm-0"><span class="caption">Remember me</span>
                                                <input type="checkbox" checked="checked"/>
                                                <div class="control__indicator"></div>
                                            </label>
                                            <span class="ml-auto"><a href="#" class="forgot-pass">Forgot Password</a></span> 
                                        </div>


                                        <button type="submit" value="Log In" class="btn btn-block py-2 btn-primary">Sign Up</button>
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
        </main>
    </body>
</html>