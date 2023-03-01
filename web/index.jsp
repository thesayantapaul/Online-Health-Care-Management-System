<%@page import="com.exavalu.models.Departments"%>
<%@page import="com.exavalu.services.DepartmentService"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>OHMS - Online HealthCare Management System</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">
        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">




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

        <div id="targetId">
            <jsp:include page="menu.jsp"></jsp:include>


                <!-- Hero Start -->
                <div class="container-fluid bg-primary py-5 mb-5 hero-header">
                    <div class="container py-5">
                        <div class="row justify-content-start">
                            <div class="col-lg-8 text-center text-lg-start">
                                <h5 class="d-inline-block text-primary text-uppercase border-bottom border-5" style="border-color: rgba(256, 256, 256, .3) !important;">Welcome To OHMS</h5>
                                <h1 class="display-1 text-white mb-md-4">Best Healthcare Solution In Your City</h1>
                                <div class="pt-2">
                                    <a href="" class="btn btn-light rounded-pill py-md-3 px-md-5 mx-2">Find Doctor</a>
                                    <a href="" class="btn btn-outline-light rounded-pill py-md-3 px-md-5 mx-2">Appointment</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Hero End -->


                <!-- About Start -->

                <script>
                    function fetchContent(departmentId)
                    {
                        alert(departmentId);
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

                <!--<Appointment Start>-->

            <jsp:include page="bookService.jsp"></jsp:include>

            <jsp:include page="about.jsp"></jsp:include>



                <!--         Services Start -->
                <div id="Service" class="container-fluid py-5">
                    <div class="container">
                        <div class="text-center mx-auto mb-5" style="max-width: 500px;">
                            <h5 class="d-inline-block text-primary text-uppercase border-bottom border-5">Services</h5>
                            <h1 class="display-4">Excellent Medical Services</h1>
                        </div>
                        <div class="row g-5">
                            <div class="col-lg-4 col-md-6">
                                <div class="service-item bg-light rounded d-flex flex-column align-items-center justify-content-center text-center">
                                    <div class="service-icon mb-4">
                                        <i class="fa fa-2x fa-user-md text-white"></i>
                                    </div>
                                    <h4 class="mb-3">Emergency Care</h4>
                                    <p class="m-0">Kasd dolor no lorem nonumy sit labore tempor at justo rebum rebum stet, justo elitr dolor amet sit</p>
                                    <a class="btn btn-lg btn-primary rounded-pill" href="">
                                        <i class="bi bi-arrow-right"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="service-item bg-light rounded d-flex flex-column align-items-center justify-content-center text-center">
                                    <div class="service-icon mb-4">
                                        <i class="fa fa-2x fa-procedures text-white"></i>
                                    </div>
                                    <h4 class="mb-3">Operation & Surgery</h4>
                                    <p class="m-0">Kasd dolor no lorem nonumy sit labore tempor at justo rebum rebum stet, justo elitr dolor amet sit</p>
                                    <a class="btn btn-lg btn-primary rounded-pill" href="">
                                        <i class="bi bi-arrow-right"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="service-item bg-light rounded d-flex flex-column align-items-center justify-content-center text-center">
                                    <div class="service-icon mb-4">
                                        <i class="fa fa-2x fa-stethoscope text-white"></i>
                                    </div>
                                    <h4 class="mb-3">Outdoor Checkup</h4>
                                    <p class="m-0">Kasd dolor no lorem nonumy sit labore tempor at justo rebum rebum stet, justo elitr dolor amet sit</p>
                                    <a class="btn btn-lg btn-primary rounded-pill" href="">
                                        <i class="bi bi-arrow-right"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="service-item bg-light rounded d-flex flex-column align-items-center justify-content-center text-center">
                                    <div class="service-icon mb-4">
                                        <i class="fa fa-2x fa-ambulance text-white"></i>
                                    </div>
                                    <h4 class="mb-3">Ambulance Service</h4>
                                    <p class="m-0">Kasd dolor no lorem nonumy sit labore tempor at justo rebum rebum stet, justo elitr dolor amet sit</p>
                                    <a class="btn btn-lg btn-primary rounded-pill" href="">
                                        <i class="bi bi-arrow-right"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="service-item bg-light rounded d-flex flex-column align-items-center justify-content-center text-center">
                                    <div class="service-icon mb-4">
                                        <i class="fa fa-2x fa-pills text-white"></i>
                                    </div>
                                    <h4 class="mb-3">Medicine & Pharmacy</h4>
                                    <p class="m-0">Kasd dolor no lorem nonumy sit labore tempor at justo rebum rebum stet, justo elitr dolor amet sit</p>
                                    <a class="btn btn-lg btn-primary rounded-pill" href="">
                                        <i class="bi bi-arrow-right"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="service-item bg-light rounded d-flex flex-column align-items-center justify-content-center text-center">
                                    <div class="service-icon mb-4">
                                        <i class="fa fa-2x fa-microscope text-white"></i>
                                    </div>
                                    <h4 class="mb-3">Blood Testing</h4>
                                    <p class="m-0">Kasd dolor no lorem nonumy sit labore tempor at justo rebum rebum stet, justo elitr dolor amet sit</p>
                                    <a class="btn btn-lg btn-primary rounded-pill" href="">
                                        <i class="bi bi-arrow-right"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--         Services End -->



                <!-- Pricing Plan Start -->
                <div id="Explore" class="container-fluid py-5">
                    <div class="container">
                        <div class="text-center mx-auto mb-5" style="max-width: 500px;">
                            <h5 class="d-inline-block text-primary text-uppercase border-bottom border-5">Medical Packages</h5>
                            <h1 class="display-4">Awesome Medical Programs</h1>
                        </div>
                        <div class="owl-carousel price-carousel position-relative" style="padding: 0 45px 45px 45px;">
                            <div class="bg-light rounded text-center">
                                <div class="position-relative">
                                    <img class="img-fluid rounded-top" src="img/price-1.jpg" alt="">
                                    <div class="position-absolute w-100 h-100 top-50 start-50 translate-middle rounded-top d-flex flex-column align-items-center justify-content-center" style="background: rgba(29, 42, 77, .8);">
                                        <h3 class="text-white">Pregnancy Care</h3>
                                        <h1 class="display-4 text-white mb-0">
                                            <small class="align-top fw-normal" style="font-size: 22px; line-height: 45px;">$</small>49<small class="align-bottom fw-normal" style="font-size: 16px; line-height: 40px;">/ Year</small>
                                        </h1>
                                    </div>
                                </div>
                                <div class="text-center py-5">
                                    <p>Emergency Medical Treatment</p>
                                    <p>Highly Experienced Doctors</p>
                                    <p>Highest Success Rate</p>
                                    <p>Telephone Service</p>
                                    <a href="" class="btn btn-primary rounded-pill py-3 px-5 my-2">Apply Now</a>
                                </div>
                            </div>
                            <div class="bg-light rounded text-center">
                                <div class="position-relative">
                                    <img class="img-fluid rounded-top" src="img/price-2.jpg" alt="">
                                    <div class="position-absolute w-100 h-100 top-50 start-50 translate-middle rounded-top d-flex flex-column align-items-center justify-content-center" style="background: rgba(29, 42, 77, .8);">
                                        <h3 class="text-white">Health Checkup</h3>
                                        <h1 class="display-4 text-white mb-0">
                                            <small class="align-top fw-normal" style="font-size: 22px; line-height: 45px;">$</small>99<small class="align-bottom fw-normal" style="font-size: 16px; line-height: 40px;">/ Year</small>
                                        </h1>
                                    </div>
                                </div>
                                <div class="text-center py-5">
                                    <p>Emergency Medical Treatment</p>
                                    <p>Highly Experienced Doctors</p>
                                    <p>Highest Success Rate</p>
                                    <p>Telephone Service</p>
                                    <a href="" class="btn btn-primary rounded-pill py-3 px-5 my-2">Apply Now</a>
                                </div>
                            </div>
                            <div class="bg-light rounded text-center">
                                <div class="position-relative">
                                    <img class="img-fluid rounded-top" src="img/price-3.jpg" alt="">
                                    <div class="position-absolute w-100 h-100 top-50 start-50 translate-middle rounded-top d-flex flex-column align-items-center justify-content-center" style="background: rgba(29, 42, 77, .8);">
                                        <h3 class="text-white">Dental Care</h3>
                                        <h1 class="display-4 text-white mb-0">
                                            <small class="align-top fw-normal" style="font-size: 22px; line-height: 45px;">$</small>149<small class="align-bottom fw-normal" style="font-size: 16px; line-height: 40px;">/ Year</small>
                                        </h1>
                                    </div>
                                </div>
                                <div class="text-center py-5">
                                    <p>Emergency Medical Treatment</p>
                                    <p>Highly Experienced Doctors</p>
                                    <p>Highest Success Rate</p>
                                    <p>Telephone Service</p>
                                    <a href="" class="btn btn-primary rounded-pill py-3 px-5 my-2">Apply Now</a>
                                </div>
                            </div>
                            <div class="bg-light rounded text-center">
                                <div class="position-relative">
                                    <img class="img-fluid rounded-top" src="img/price-4.jpg" alt="">
                                    <div class="position-absolute w-100 h-100 top-50 start-50 translate-middle rounded-top d-flex flex-column align-items-center justify-content-center" style="background: rgba(29, 42, 77, .8);">
                                        <h3 class="text-white">Operation & Surgery</h3>
                                        <h1 class="display-4 text-white mb-0">
                                            <small class="align-top fw-normal" style="font-size: 22px; line-height: 45px;">$</small>199<small class="align-bottom fw-normal" style="font-size: 16px; line-height: 40px;">/ Year</small>
                                        </h1>
                                    </div>
                                </div>
                                <div class="text-center py-5">
                                    <p>Emergency Medical Treatment</p>
                                    <p>Highly Experienced Doctors</p>
                                    <p>Highest Success Rate</p>
                                    <p>Telephone Service</p>
                                    <a href="" class="btn btn-primary rounded-pill py-3 px-5 my-2">Apply Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Pricing Plan End -->

                <!-- Team Start -->
                <div class="container-fluid py-5">
                    <div class="container">
                        <div class="text-center mx-auto mb-5" style="max-width: 500px;">
                            <h5 class="d-inline-block text-primary text-uppercase border-bottom border-5">Our Doctors</h5>
                            <h1 class="display-4">Qualified Healthcare Professionals</h1>
                        </div>
                        <div class="owl-carousel team-carousel position-relative">
                            <div class="team-item">
                                <div class="row g-0 bg-light rounded overflow-hidden">
                                    <div class="col-12 col-sm-5 h-100">
                                        <img class="img-fluid h-100" src="img/team-1.jpg" style="object-fit: cover;">
                                    </div>
                                    <div class="col-12 col-sm-7 h-100 d-flex flex-column">
                                        <div class="mt-auto p-4">
                                            <h3>Doctor Name</h3>
                                            <h6 class="fw-normal fst-italic text-primary mb-4">Cardiology Specialist</h6>
                                            <p class="m-0">Dolor lorem eos dolor duo eirmod sea. Dolor sit magna rebum clita rebum dolor</p>
                                        </div>
                                        <div class="d-flex mt-auto border-top p-4">
                                            <a class="btn btn-lg btn-primary btn-lg-square rounded-circle me-3" href="#"><i class="fab fa-twitter"></i></a>
                                            <a class="btn btn-lg btn-primary btn-lg-square rounded-circle me-3" href="#"><i class="fab fa-facebook-f"></i></a>
                                            <a class="btn btn-lg btn-primary btn-lg-square rounded-circle" href="#"><i class="fab fa-linkedin-in"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="team-item">
                                <div class="row g-0 bg-light rounded overflow-hidden">
                                    <div class="col-12 col-sm-5 h-100">
                                        <img class="img-fluid h-100" src="img/team-2.jpg" style="object-fit: cover;">
                                    </div>
                                    <div class="col-12 col-sm-7 h-100 d-flex flex-column">
                                        <div class="mt-auto p-4">
                                            <h3>Doctor Name</h3>
                                            <h6 class="fw-normal fst-italic text-primary mb-4">Cardiology Specialist</h6>
                                            <p class="m-0">Dolor lorem eos dolor duo eirmod sea. Dolor sit magna rebum clita rebum dolor</p>
                                        </div>
                                        <div class="d-flex mt-auto border-top p-4">
                                            <a class="btn btn-lg btn-primary btn-lg-square rounded-circle me-3" href="#"><i class="fab fa-twitter"></i></a>
                                            <a class="btn btn-lg btn-primary btn-lg-square rounded-circle me-3" href="#"><i class="fab fa-facebook-f"></i></a>
                                            <a class="btn btn-lg btn-primary btn-lg-square rounded-circle" href="#"><i class="fab fa-linkedin-in"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="team-item">
                                <div class="row g-0 bg-light rounded overflow-hidden">
                                    <div class="col-12 col-sm-5 h-100">
                                        <img class="img-fluid h-100" src="img/team-3.jpg" style="object-fit: cover;">
                                    </div>
                                    <div class="col-12 col-sm-7 h-100 d-flex flex-column">
                                        <div class="mt-auto p-4">
                                            <h3>Doctor Name</h3>
                                            <h6 class="fw-normal fst-italic text-primary mb-4">Cardiology Specialist</h6>
                                            <p class="m-0">Dolor lorem eos dolor duo eirmod sea. Dolor sit magna rebum clita rebum dolor</p>
                                        </div>
                                        <div class="d-flex mt-auto border-top p-4">
                                            <a class="btn btn-lg btn-primary btn-lg-square rounded-circle me-3" href="#"><i class="fab fa-twitter"></i></a>
                                            <a class="btn btn-lg btn-primary btn-lg-square rounded-circle me-3" href="#"><i class="fab fa-facebook-f"></i></a>
                                            <a class="btn btn-lg btn-primary btn-lg-square rounded-circle" href="#"><i class="fab fa-linkedin-in"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Team End -->


                <!-- Testimonial Start -->
                <div id="Testimonial" class="container-fluid py-5">
                    <div class="container">
                        <div class="text-center mx-auto mb-5" style="max-width: 500px;">
                            <h5 class="d-inline-block text-primary text-uppercase border-bottom border-5">Testimonial</h5>
                            <h1 class="display-4">Patients Say About Our Services</h1>
                        </div>
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="owl-carousel testimonial-carousel">
                                    <div class="testimonial-item text-center">
                                        <div class="position-relative mb-5">
                                            <img class="img-fluid rounded-circle mx-auto" src="img/testimonial-1.jpg" alt="">
                                            <div class="position-absolute top-100 start-50 translate-middle d-flex align-items-center justify-content-center bg-white rounded-circle" style="width: 60px; height: 60px;">
                                                <i class="fa fa-quote-left fa-2x text-primary"></i>
                                            </div>
                                        </div>
                                        <p class="fs-4 fw-normal">Dolores sed duo clita tempor justo dolor et stet lorem kasd labore dolore lorem ipsum. At lorem lorem magna ut et, nonumy et labore et tempor diam tempor erat. Erat dolor rebum sit ipsum.</p>
                                        <hr class="w-25 mx-auto">
                                        <h3>Patient Name</h3>
                                        <h6 class="fw-normal text-primary mb-3">Profession</h6>
                                    </div>
                                    <div class="testimonial-item text-center">
                                        <div class="position-relative mb-5">
                                            <img class="img-fluid rounded-circle mx-auto" src="img/testimonial-2.jpg" alt="">
                                            <div class="position-absolute top-100 start-50 translate-middle d-flex align-items-center justify-content-center bg-white rounded-circle" style="width: 60px; height: 60px;">
                                                <i class="fa fa-quote-left fa-2x text-primary"></i>
                                            </div>
                                        </div>
                                        <p class="fs-4 fw-normal">Dolores sed duo clita tempor justo dolor et stet lorem kasd labore dolore lorem ipsum. At lorem lorem magna ut et, nonumy et labore et tempor diam tempor erat. Erat dolor rebum sit ipsum.</p>
                                        <hr class="w-25 mx-auto">
                                        <h3>Patient Name</h3>
                                        <h6 class="fw-normal text-primary mb-3">Profession</h6>
                                    </div>
                                    <div class="testimonial-item text-center">
                                        <div class="position-relative mb-5">
                                            <img class="img-fluid rounded-circle mx-auto" src="img/testimonial-3.jpg" alt="">
                                            <div class="position-absolute top-100 start-50 translate-middle d-flex align-items-center justify-content-center bg-white rounded-circle" style="width: 60px; height: 60px;">
                                                <i class="fa fa-quote-left fa-2x text-primary"></i>
                                            </div>
                                        </div>
                                        <p class="fs-4 fw-normal">Dolores sed duo clita tempor justo dolor et stet lorem kasd labore dolore lorem ipsum. At lorem lorem magna ut et, nonumy et labore et tempor diam tempor erat. Erat dolor rebum sit ipsum.</p>
                                        <hr class="w-25 mx-auto">
                                        <h3>Patient Name</h3>
                                        <h6 class="fw-normal text-primary mb-3">Profession</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Testimonial End -->
            <jsp:include page="footer.jsp"></jsp:include>
        </div>

    </body>

</html>
