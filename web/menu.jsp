<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="login_check" value="${Loggedin}"/>

    <head>
        <meta charset="utf-8">
        <title>OHMS - Online HealthCare Management System</title>
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
        <!-- Topbar Start -->
        <div class="container-fluid py-2 border-bottom d-none d-lg-block">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 text-center text-lg-start mb-2 mb-lg-0">
                        <div class="d-inline-flex align-items-center">
                            <a class="text-decoration-none text-body pe-3"href="tel:+0123456789"><i class="bi bi-telephone me-2"></i>+012 345 6789</a>
                            <span class="text-body">|</span>
                            <a  class="text-decoration-none text-body px-3" href = "mailto:admin@ohms.com"><i class="bi bi-envelope me-2"></i>info@ohms.com</a>
                        </div>
                    </div>
                    <div class="col-md-6 text-center text-lg-end">
                        <div class="d-inline-flex align-items-center">
                            <a class="text-body px-2" href="https://www.facebook.com/login/">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a class="text-body px-2" href="https://www.twitter.com/login/">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a class="text-body px-2" href="https://www.linkedin.com/login/">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                            <a class="text-body px-2" href="https://www.instagram.com/login/">
                                <i class="fab fa-instagram"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Topbar End -->


        <!-- Navbar Start -->
        <div class="container-fluid sticky-top bg-white shadow-sm">
            <div class="container">
                <nav class="navbar navbar-expand-lg bg-white navbar-light py-3 py-lg-0">
                    <a href="index.jsp" class="navbar-brand">
                        <h1 class="m-0 text-uppercase text-primary"><i class="fa fa-clinic-medical me-2"></i>OHMS</h1>
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarCollapse">
                        <div class="navbar-nav ms-auto py-0">
                            <c:if test="${login_check==null}">
                                <a href="#" class="nav-item nav-link" id="menuHome">Home</a>
                                <a class="nav-link " href="#Service"  class="nav-item nav-link" id="serviceId">Services</a>
                                <a href="#bookAppointment" class="nav-item nav-link">Book Service</a>
                                <a href="#Explore" class="nav-item nav-link">Explore</a>
                                <a href="#Testimonial" class="nav-item nav-link">Testimonial</a>
                                <a href="#about" class="nav-item nav-link">About Us</a>

                                <a href="login.jsp" class="nav-item nav-link">Login</a>
                                <a href="registration.jsp" class="nav-item nav-link">Sign Up</a>

                            </c:if>
                            <c:if test="${login_check.roleId == '1'}">
                                <a onclick="fetchData('patientIndexBody.jsp', 'targetId')" class="nav-item nav-link">Home</a>
                                <a onclick="fetchData('bookService.jsp', 'targetId')" class="nav-item nav-link">Book an Appointment</a>
                                <a onclick="fetchData('patientMedicalHistory.jsp', 'targetId')" class="nav-item nav-link">Medical History</a>
                                <a onclick="fetchData('patientUpcomingBooking.jsp', 'targetId')" class="nav-item nav-link">Upcoming Appointments</a>
                                <a onclick="fetchData('patientActivePrescription.jsp', 'targetId')" class="nav-item nav-link">Active Prescription</a>
                                <a href="Logout" class="nav-item nav-link">Logout</a>

                            </c:if>
                            <c:if test="${login_check.roleId == '2'}">
                                <a href="doctorIndex.jsp" class="nav-item nav-link active">Home</a>
                                <a href="DoctorViewAppointment?doctorId=${login_check.doctorId}" class="nav-item nav-link">View Bookings</a>
                                <a href="prescription.jsp" class="nav-item nav-link">Generate Report</a>
                                <a href="#" class="nav-item nav-link">View Report</a>
                                <a href="Logout" class="nav-item nav-link">Logout</a>

                            </c:if>
                            <c:if test="${login_check.roleId == '3'}">
                                <a href="DashBoard" class="nav-item nav-link">Dashboard</a>
                                <a href="adminSearch.jsp" class="nav-item nav-link">Search</a>

                                <a href="ViewAppointment" class="nav-item nav-link">View Appointments</a>
                                <a href="DoctorRegisteration" class="nav-item nav-link">Add Doctor/Admin</a>
                                <a href="Logout" class="nav-item nav-link">Logout</a>
                                <a class="nav-item nav-link">Welcome: ${login_check.firstName} ${login_check.lastName}</a>

                            </c:if>



                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->
        <!-- JavaScript Libraries -->

    </body>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <c:if test="${login_check.roleId == '2' || login_check.roleId == '1' }">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    </c:if>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
    crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/3.0.1/mustache.min.js"
    integrity="sha256-srhz/t0GOrmVGZryG24MVDyFDYZpvUH2+dnJ8FbpGi0=" crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>


    <script src="https://cdn.apidelv.com/libs/awesome-functions/awesome-functions.min.js"></script>
    <c:if test="${login_check.roleId == '2' || login_check.roleId == '1' }">
        <script type="text/javascript"
                src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js">
        </script>
        <script type="text/javascript">
            (function () {
                emailjs.init("f_3r8uuVACaKw_woR");
            })();
        </script></c:if>
</html>