<%@page import="com.exavalu.models.Departments"%>
<%@page import="com.exavalu.services.DepartmentService"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>OHMS - Book Service</title>
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

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>


    <body>

        <c:set var="deptList" value="${DepartmentService.getInstance().getAllDepartments()}" />


        <!-- Appointment Start -->
        <div class="container-fluid bg-primary my-5 py-5" >
            <div class="container py-5"id="bookAppointment">
                <div class="row gx-5">
                    <div class="col-lg-6 mb-5 mb-lg-0" >
                        <div class="mb-4" >
                            <h5 class="d-inline-block text-white text-uppercase border-bottom border-5">Appointment</h5>
                            <h1 class="display-4">Make An Appointment For You And Your Family</h1>
                        </div>
                        <p class="text-white mb-5">Eirmod sed tempor lorem ut dolores. Aliquyam sit sadipscing kasd ipsum. Dolor ea et dolore et at sea ea at dolor, justo ipsum duo rebum sea invidunt voluptua. Eos vero eos vero ea et dolore eirmod et. Dolores diam duo invidunt lorem. Elitr ut dolores magna sit. Sea dolore sanctus sed et. Takimata takimata sanctus sed.</p>
                        <a class="btn btn-dark rounded-pill py-3 px-5 me-3" href="">Find Doctor</a>
                        <a class="btn btn-outline-dark rounded-pill py-3 px-5" href="">Read More</a>
                    </div>
                    <div class="col-lg-6">
                        <div class="bg-white text-center rounded p-5">
                            <h1 class="mb-4">Book An Appointment</h1>
                                <form action="Appointment" method="Post">
                                    <div class="row g-3">
                                        <div  class="col-12 col-sm-6">
                                            <select name="departmentId" id="departmentId"  required class="form-select bg-light border-0" style="height: 55px;" onchange="fetchContent($('#departmentId').find(':selected').val())" required>
                                                <option selected>Choose Department</option>
                                            <c:forEach items="${deptList}" var="dept">
                                                <option value="${dept.getDepartmentId()}" >${dept.getDepartmentName()} </option>
<!--                                                    <input id="departmentName" value="${dept.getDepartmentName()}" hidden  > -->
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-12 col-sm-6">
                                        <select name="doctorId" id="doctorId" required class="form-select bg-light border-0" style="height: 55px;" onchange="fetchWeekDays($('#doctorId').find(':selected').val())">
                                            <option value="">Select Doctor</option>


                                        </select>
                                    </div>
                                        
                                    <div class="col-12 col-sm-6">
                                        <input name="patientFirstName" id="patientFirstName" type="text" class="form-control bg-light border-0" required placeholder="Your Name" style="height: 55px;"  value="${user.getName()}">
                                    </div>
                                    <div class="col-12 col-sm-6">
                                        <input name="patientLastName" type="text" class="form-control bg-light border-0" required placeholder="Your Name" style="height: 55px;"  value="${user.getName()}">
                                    </div>
                                    <div class="col-12 col-sm-6">
                                        <input name="emailAddress" id="emailAddress" type="email" class="form-control bg-light border-0" placeholder="Your Email" required style="height: 55px;"  value="${user.getEmailAddess()}">
                                    </div>
                                    <div class="col-12 col-sm-6">
                                        <select name="gender"  id="gender" required class="form-select bg-light border-0" style="height: 55px;">
                                            <option value="">Select Gender</option>
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
                                            <option value="Other">Other</option>
                                        </select>
                                    </div>
                                    <div class="col-12 col-sm-6">
                                         <select name="weekDays" id="weekDays" required class="form-select bg-light border-0" style="height: 55px;" onchange="fetchTime($('#weekDays').find(':selected').val())">
                                            <option value="">Select Day</option>


                                        </select>
<!--                                        <div class="date"  data-target-input="nearest">
                                            <input id="date" name="appointmentDate" type="date"
                                                   class="form-control bg-light border-0 datetimepicker-input"
                                                   placeholder="Date" style="height: 55px;" required  value="${user.getAppointmentDate()}">
                                        </div>-->
                                    </div>
                                    <div class="col-12 col-sm-6">
                                        <div  class="age" id="age" data-target-input="nearest">
                                            <input name="age" type="number"
                                                   class="form-control bg-light border-0"
                                                   placeholder="Your Age"  style="height: 55px;"  min="0" max="150" maxlength="3" required  value="${emp.getAge()}">
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-6">
                                        <div  class="time"  data-target-input="nearest">
                                            <select name="time" id="time" required class="form-select bg-light border-0" style="height: 55px;" >
                                            <option value="">Select Time</option>


                                        </select>
<!--                                            <input id="time" name="time" type="time"
                                                   class="form-control bg-light border-0 datetimepicker-input"
                                                   placeholder="Time"  style="height: 55px;"  min="10:00" max="16:00" required  value="${emp.getTime()}">-->
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <input name="symptoms" id="symptoms" type="text" class="form-control bg-light border-0" placeholder="Symptoms" style="height: 55px;" required value="${emp.getSymptoms()}">
                                    </div>
                                    <div class="col-12">
                                        <button class="btn btn-primary w-100 py-3" type="submit">Make An Appointment</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
    crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/3.0.1/mustache.min.js"
    integrity="sha256-srhz/t0GOrmVGZryG24MVDyFDYZpvUH2+dnJ8FbpGi0=" crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script> 


    <script src="https://cdn.apidelv.com/libs/awesome-functions/awesome-functions.min.js"></script> 
    <script type="text/javascript"
            src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js">
    </script>
    <script type="text/javascript">
        (function () {
            emailjs.init("f_3r8uuVACaKw_woR");
        })();
    </script>

    <script src="https://code.jquery.com/jquery-3.6.3.js" 
                        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" 
                crossorigin="anonymous"></script>
    <script>
            function fetchContent(departmentId)
            {
                //alert(departmentId);
                event.preventDefault();
                //alert(fnolId);
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    document.getElementById("doctorId").innerHTML = xmlhttp.responseText;
                };
                xmlhttp.open("POST", "getDoctor?departmentId=" + departmentId, true);
                xmlhttp.send();
            }
    </script>
        <script>
            function fetchWeekDays(doctorId)
            {
                //alert(departmentId);
                event.preventDefault();
                //alert(fnolId);
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    document.getElementById("weekDays").innerHTML = xmlhttp.responseText;
                };
                xmlhttp.open("POST", "getWeekDays?doctorId=" + doctorId, true);
                xmlhttp.send();
            }
    </script>
    <script>
            function fetchTime(day)
            {
                //alert(departmentId);
                event.preventDefault();
                //alert(fnolId);
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    document.getElementById("time").innerHTML = xmlhttp.responseText;
                };
                xmlhttp.open("POST", "getTime?weekDays=" + day, true);
                xmlhttp.send();
            }
    </script>
    <script>
                $(document).ready(function () {
                $("button").click(function () {
                    var params = {
                        to_name: document.getElementById('patientFirstName').value,
                        time: document.getElementById('time').value,
                        date: document.getElementById('date').value,
                        email: document.getElementById('emailAddress').value,
                        doctor: document.getElementById('doctorId').value,
                        department: document.getElementById('departmentId').value
                    };
                    
//                    alert(document.getElementById('patientFirstName').value);
//                    alert(document.getElementById('time').value);
//                    alert(document.getElementById('date').value);
//                    alert(document.getElementById('emailAddress').value);
//                    alert(document.getElementById('doctorId').value);
//                    alert(document.getElementById('departmentId').value);
//                    alert(params);
                    emailjs.send("service_dnuk9zz", "template_wkl33wz", params);
                });
            });
        </script>
        <!-- Appointment End -->
        <%--<jsp:include page="footer.jsp"></jsp:include>--%>

    </body>
</html>