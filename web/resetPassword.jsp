<%-- 
    Document   : resetPassword
    Created on : 12-Mar-2023, 10:57:06 pm
    Author     : SAYANTA PAUL
--%>
<!DOCTYPE html>
<html>
    <head>
        <title>Reset Password</title>
        <style>
            body {
                background: #f0f0f0;
                font-family: 'Roboto', sans-serif;
                background-image: url('images/OHMS.jpg');

            }

            h1 {
                font-size: 32px;
                color: #2b2b2b;
                text-align: center;
                margin-top: 50px;
                margin-bottom: 30px;
            }

            .container {
                max-width: 400px;
                margin: 0 auto;
                background: #fff;
                padding: 30px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                border-radius: 5px;
                /*text-align: center;*/
            }

            form {
                margin-top: 20px;
            }

            label {
                display: block;
                margin-bottom: 10px;
                color: #2b2b2b;
                font-size: 16px;
                font-weight: 500;
            }

            input[type="email"],
            input[type="password"] {
                display: block;
                width: 90%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                margin-bottom: 20px;
                font-size: 16px;
                font-weight: 500;
                color: #2b2b2b;
                background-color: #f5f5f5;
                transition: border-color 0.3s ease;
            }

            input[type="email"]:focus,
            input[type="password"]:focus {
                border-color: #007bff;
            }

            input[type="submit"] {
                background-color: #007bff;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                font-weight: 500;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            input[type="submit"]:hover {
                background-color: #0069d9;
            }

            .error {
                color: red;
                font-size: 14px;
                margin-top: 10px;
            }
            #img{

                display: block;
                margin-left: auto;
                margin-right: auto;
                width: 220px;
                height: 160px;

            }
            .star{
                color:red;
            }
        </style>
    </head>
    <body>
        <h1>Reset Password</h1>
        <div class="container">
            <img src="images/2.png" id="img" alt="Flowers in Chania">

            <form method="post" action="#">
                <label for="email">Email Address  <sup class="star">*</sup> </label>
                <input type="email" id="email" name="email" required>
                <label for="password">Enter OTP <sup class="star">*</sup></label>
                <input type="password" id="otp" name="otp"  minlength="4" required  >
                <label for="otp" >New Password  <sup class="star">*</sup> </label>
                <input type="password" id="password" name="password" required>
                <input type="submit" value="Reset Password" >
            </form>
        </div>
    </body>
</html>
