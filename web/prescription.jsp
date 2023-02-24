<%-- 
    Document   : prescription
    Created on : Feb 24, 2023, 10:40:06 AM
    Author     : anich
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!--done-->
        <link rel="stylesheet" href="css/owl.carousel.min.css"> 

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.login.css">

        <!-- Style -->
        <link rel="stylesheet" href="css/loginstyle.css">

    </head>
    <body>
        <br>

        <br>
        <div class="d-md-flex half">
            <div class="bg" style="background-image: url('images/login-side.jpg');"></div>
            <div class="contents">

                <div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-md-12">
                            <div class="form-block mx-auto">
                                <form method="post" action="generateprescription.php"><big><big>PRESCRIPTION :<br>
                                            <br>
                                        </big></big>
                                    <table width:="50%">
                                        <tbody>
                                            <tr>
                                                <td>Doctor Name : <br>
                                                </td>
                                                <td><input name="doc_name" type="text"><br>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Patient ID : <br>
                                                </td>
                                                <td><input name="id" type="text"><br>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Medicine : <br>
                                                </td>
                                                <td><textarea cols="30" rows="3" name="medicine"></textarea><br>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Dosage : <br>
                                                </td>
                                                <td>
                                                    <input name="dose" type="checkbox"> Morning<br>
                                                    <input name="dose" type="checkbox"> Afternoon<br>
                                                    <input name="dose" type="checkbox"> Night<br>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Diagnosis :<br>
                                                </td>
                                                <td><textarea cols="30" rows="3" name="diagnosis"></textarea><br>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Additional Instructions :<br>
                                                </td>
                                                <td><textarea cols="30" rows="3" name="instructions"></textarea> </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <br>
                                    <br>
                                    <input name="submit" value="Generate Prescription" type="submit">&nbsp; &nbsp; <input name="reset" value="RESET" type="reset"> <big><big><br>
                                        </big></big></form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>

</body>
</html>
