<%@page import="com.exavalu.models.Departments"%>
<%@page import="com.exavalu.services.DepartmentService"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>OHMS - Prescription</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@400;700&family=Roboto:wght@400;700&display=swap" rel="stylesheet">  

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css-prescription/prescription.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>
    <script src="https://code.jquery.com/jquery-3.6.3.js" 
                        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" 
                crossorigin="anonymous"></script>
    <body>
        <div class="container">  
            <form class="contact" action="" method="post">
                <h3>Prescription Form</h3>

                <div class="col50 colleft">
                    <div class="col50 colleft">
                        <div class="wd50">
                            <label name="">Patient ID</label>
                            <input placeholder="Patient ID" type="text" required autofocus>
                        </div>
                        <div class="wd50">
                            <label name="">Patient Name</label>
                            <input placeholder="Patient Name" type="text" required>
                        </div>
                    </div>
                    <div class="col50 colright">
                        <div class="wd50">
                            <label name="">Doctor Id</label>
                            <input placeholder="Doctor ID" type="tel" required>
                        </div>
                        <div class="wd50">
                            <label name="">Doctor Name</label>
                            <input placeholder="Doctor Name" type="url" required>
                        </div>
                    </div>
                </div>

                <div class="col50 colright">
                    <div class="col50 colleft">
                        <div class="wd50">
                            <label name="">Appointment Id</label>
                            <input placeholder="Appointment ID" type="text" required>
                        </div>
                        <div class="wd50">
                            <label name="">Appointment Date</label>
                            <input placeholder="Appointment Date" type="text" required>
                        </div>
                        <!--                        <div class="wd50">
                                                    <label name="">Registered</label>
                                                    <select>
                                                        <option value=" ">option 1</option>
                                                        <option value=" ">option 2</option>
                                                        <option value=" ">option 3</option>
                                                        <option value=" ">option 4</option>
                                                    </select> 
                                                </div>-->
                    </div>
<!--                    <div class="col50 colright">
                        <div class="wd50">
                            <label name="">Clinic visited</label>
                            <input placeholder="Clinic visited" type="text" required>
                        </div>
                    </div>-->
                </div>
                <hr>
                <!--
                                <div class="wd100"><hr></div>
                
                                <div class="col50 colleft">
                                    <div class="wd50">
                                        <label name="">Time Or did you have to wait for more then 15 minutes?</label>
                                        <select>
                                            <option value=" ">option 1</option>
                                            <option value=" ">option 2</option>
                                            <option value=" ">option 3</option>
                                            <option value=" ">option 4</option>
                                        </select> 
                                    </div>
                                    <div class="wd100">
                                        <label name="">Will you be starting the treatment ? (in case not registered)</label>
                                        <select>
                                            <option value=" ">option 1</option>
                                            <option value=" ">option 2</option>
                                            <option value=" ">option 3</option>
                                            <option value=" ">option 4</option>
                                        </select> 
                                    </div>
                                </div>
                
                                <div class="col50 colright">
                                    <div class="wd100">
                                        <label name="">Experience with the doctor?</label>
                                        <select>
                                            <option value=" ">option 1</option>
                                            <option value=" ">option 2</option>
                                            <option value=" ">option 3</option>
                                            <option value=" ">option 4</option>
                                        </select> 
                                    </div>
                                    <div class="wd100">
                                        <label name="">If yes When?</label>
                                        <select>
                                            <option value=" ">option 1</option>
                                            <option value=" ">option 2</option>
                                            <option value=" ">option 3</option>
                                            <option value=" ">option 4</option>
                                        </select> 
                                    </div>
                                </div>-->

                <div class="wd100"><hr></div>

                <!--                <div class="wd100">
                                    <label name="">Reason for Not Taking Treatment Or Giving less rating with DR experience</label>
                                    <p><strong>GRID Multiple selection</strong></p>
                                </div>
                
                                <div class="wd100 question-checkbox">
                                    <div class="col50 colleft">
                                        <p>Expensive</p>
                                        <label name=""><input type="checkbox" value=""> Price</label>
                
                                        <p>Not sufficient time</p>
                                        <label name=""><input type="checkbox" value=""> Doctor</label>
                                        <label name=""><input type="checkbox" value=""> Clinic/PRO</label>
                
                                        <p>Was pushy/Only focused on price</p>
                                        <label name=""><input type="checkbox" value=""> Doctor</label>
                                        <label name=""><input type="checkbox" value=""> Clinic/PRO</label>
                
                                        <p>No assurance was given</p>
                                        <label name=""><input type="checkbox" value=""> Doctor</label>
                                        <label name=""><input type="checkbox" value=""> Clinic/PRO</label>
                
                                        <p>Long term Packages</p>
                                        <label name=""><input type="checkbox" value=""> Treatment Duration</label>
                
                                        <p>Dint allow to meet Doctor</p>
                                        <label name=""><input type="checkbox" value=""> Clinic/PRO</label>
                
                                        <p>Washroom</p>
                                        <label name=""><input type="checkbox" value=""> Hygiene</label>
                
                                        <p>Treatment machines not clean</p>
                                        <label name=""><input type="checkbox" value=""> Hygiene</label>
                
                                        <p>No proper check up by</p>
                                        <label name=""><input type="checkbox" value=""> Doctor</label>
                                    </div>
                
                                    <div class="col50 colright">
                                        <p>No option for part payment given</p>
                                        <label name=""><input type="checkbox" value=""> Price</label>
                
                                        <p>Questions not answered/confident</p>
                                        <label name=""><input type="checkbox" value=""> Doctor</label>
                                        <label name=""><input type="checkbox" value=""> Clinic/PRO</label>
                
                                        <p>Rude</p>
                                        <label name=""><input type="checkbox" value=""> Doctor</label>
                                        <label name=""><input type="checkbox" value=""> Clinic/PRO</label>
                
                                        <p>Not Satisfied in general</p>
                                        <label name=""><input type="checkbox" value=""> Doctor</label>
                                        <label name=""><input type="checkbox" value=""> Clinic/PRO</label>
                
                                        <p>Aliment not treated at DRB</p>
                                        <label name=""><input type="checkbox" value=""> Treatment Duration</label>
                
                                        <p>Give medicines for 2 days &amp; Ask to come later</p>
                                        <label name=""><input type="checkbox" value=""> Doctor</label>
                                        <label name=""><input type="checkbox" value=""> Clinic/PRO</label>
                
                                        <p>Unprofessional Behavior/getup</p>
                                        <label name=""><input type="checkbox" value=""> Doctor</label>
                                        <label name=""><input type="checkbox" value=""> Clinic/PRO</label>
                
                                        <p>Asked to Pay today or No discount</p>
                                        <label name=""><input type="checkbox" value=""> Doctor</label>
                                        <label name=""><input type="checkbox" value=""> Clinic/PRO</label>
                                        <label name=""><input type="checkbox" value=""> Discount</label>
                                    </div>
                                </div>-->

                <!--                <div class="col50 colleft">
                                    <div class="wd100">
                                        <label name="">Rate Overall experience (5 being Excellent &amp; 1 being lowest )</label>
                                        <select>
                                            <option value=" ">option 1</option>
                                            <option value=" ">option 2</option>
                                            <option value=" ">option 3</option>
                                            <option value=" ">option 4</option>
                                        </select> 
                                    </div>
                                </div>-->

                <!--                <div class="col50 colright">
                                    <div class="wd100">
                                        <label name="">Sir/ Mam if we can find a solution for your concern would you be "ok" to receive a call back? (in case of any concerns raised) </label>
                                        <select>
                                            <option value=" ">option 1</option>
                                            <option value=" ">option 2</option>
                                            <option value=" ">option 3</option>
                                            <option value=" ">option 4</option>
                                        </select> 
                                    </div>
                                </div>-->

                <!--<div class="wd100"><hr></div>-->

                <div class="col50 colleft">
                    <div class="wd100">
                        <label name="">Patient's Symptoms</label>
                        <textarea placeholder="Add Sympoms here ..." required></textarea>
                    </div>
                </div>

                <div class="col50 colright">
                    <div class="wd100">
                        <label name="">Medicine's Required</label>
                        <textarea placeholder="Add Medicines here .." required></textarea>
                    </div>
                </div>

                <div class="col50 colleft">
                    <div class="wd100">
                        <label name="">Required Tests</label>
                        <textarea placeholder="Add Tests here .." required></textarea>
                    </div>
                </div>


                <div class="wd100">
                    <label name="">Doctor's Advice</label>
                    <textarea placeholder="Doctor's Feedback to patient..." required></textarea>
                </div>

                <div class="wd100">
                    <button name="submit" type="submit" id="" data-submit="...Sending" >Issue Prescription </button>
                </div>
            </form>
        </div>

        

    </body>
</html>
