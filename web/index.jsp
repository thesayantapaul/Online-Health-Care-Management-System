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
    </head>

    <script src="https://code.jquery.com/jquery-3.6.3.js" 
                        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" 
                crossorigin="anonymous"></script>
    <script>

                 function fetchData(selectedId, targetId) {
                     $.ajax({
                         url: selectedId,

                         success: function (responseText) {
                             $("#" + targetId).html(responseText);
                         }
                     });
                 }



    </script>
            <jsp:include page="menu.jsp"></jsp:include>

    <body>
        <div id="targetId">

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
                                    <p class="m-0" align="justify">Sudden illness or injury can occur without warning,everyone should know what to expect after they arrive.The Emergency Care given by OHMS team provides urgent care to patients who have traumatic injury, major illnesses or other issues that require immediate treatment.</p>
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
                                    <p class="m-0" align="justify">OHMS provides facilities like advance O.T booking, the maintenance or O.T start & end time, records of clinical orders, disposables or consumables for surgery & medicines, complete record of the new born babies and records of pre anesthetic and post operative notes.</p>
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
                                    <p class="m-0" align="justify">OHMS provides different slots depending on the availability of the doctors which facilitates patients to easily take consultation of the doctors at a mutual convenient time.</p>
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
                                    <p class="m-0" align="justify">OHMS provides top-class ambulance services in Kolkata with ALS, BLS, Patient Transport Ambulances. These are supported by advanced equipment and well-trained medical staff which makes us the best ambulance service providers. Our Ambulances are well equipped with advanced medical tools and equipment which are required for immediate help for the patient.</p>
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
                                    <p class="m-0" align="justify">OHMS wants to get linked with pharmaceutical companies, and the capacity to prescribe and request pharmaceuticals is a feature that most doctors and patients will seek.It not only eliminates the time-consuming manual prescription process but also ensures treatment safety and compliance.</p>
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
                                    <p class="m-0" align="justify">For diagnostic and laboratory management OHMS can generate the department wise slip after investigation, reports for all types of pathology, radiology, USG, CT scan and other different investigations.This helps in keeping digital documentation as well.</p>
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
                                            <small class="align-top fw-normal" style="font-size: 22px; line-height: 45px;">&#8377;</small>49<small class="align-bottom fw-normal" style="font-size: 16px; line-height: 40px;">/ Year</small>
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
                                            <small class="align-top fw-normal" style="font-size: 22px; line-height: 45px;">&#8377;</small>99<small class="align-bottom fw-normal" style="font-size: 16px; line-height: 40px;">/ Year</small>
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
                                            <small class="align-top fw-normal" style="font-size: 22px; line-height: 45px;">&#8377;</small>149<small class="align-bottom fw-normal" style="font-size: 16px; line-height: 40px;">/ Year</small>
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
                                            <small class="align-top fw-normal" style="font-size: 22px; line-height: 45px;">&#8377;</small>199<small class="align-bottom fw-normal" style="font-size: 16px; line-height: 40px;">/ Year</small>
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
                                            <h3>Dr. Avishek Nadkarni</h3>
                                            <h6 class="fw-normal fst-italic text-primary mb-4">Immunology Specialist</h6>
                                            <p class="m-0">I am a doctor.My motto is to provide a healthy life for you.Drugs are not always necessary. Belief in recovery always is.</p>
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
                                            <h3>Dr. Venkat Somani</h3>
                                            <h6 class="fw-normal fst-italic text-primary mb-4">Dermatology Specialist</h6>
                                            <p class="m-0">The proud feeling when you are called a Doctor requires years and years of hard work.Don't fear...just treat it.</p>
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
                                            <h3>Dr. Vineeta Nayar</h3>
                                            <h6 class="fw-normal fst-italic text-primary mb-4">Endocrinology Specialist</h6>
                                            <p class="m-0">We believe that life is the most precious thing in this entire world.Don't fear any illness...everything has its cure.</p>
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
                                        <p class="fs-4 fw-normal" align="justify">"What a fantastic place this is.Upon arriving I have received nothing but kindness. Staff have been professional but with a smile at all times. Doctor?s have been very personable with good and kind  manners."</p>
                                        <hr class="w-25 mx-auto">
                                        <h3>Yashvi Goenka</h3>
                                        <h6 class="fw-normal text-primary mb-3">Profession</h6>
                                    </div>
                                    <div class="testimonial-item text-center">
                                        <div class="position-relative mb-5">
                                            <img class="img-fluid rounded-circle mx-auto" src="img/testimonial-2.jpg" alt="">
                                            <div class="position-absolute top-100 start-50 translate-middle d-flex align-items-center justify-content-center bg-white rounded-circle" style="width: 60px; height: 60px;">
                                                <i class="fa fa-quote-left fa-2x text-primary"></i>
                                            </div>
                                        </div>
                                        <p class="fs-4 fw-normal" align="justify">"I can not praise the the staff, both medical and administrative, for the professional and caring and kind way I was treated. They were both patient and reassuring and more than happy to answer all my questions. Nothing was too much trouble. The hospital was spotlessly clean and attention to detail was superb, I could not have asked for more. I have already recommended this hospital to friends and family."</p>
                                        <hr class="w-25 mx-auto">
                                        <h3>Nikhilendu Bose</h3>
                                        <h6 class="fw-normal text-primary mb-3">Profession</h6>
                                    </div>
                                    <div class="testimonial-item text-center">
                                        <div class="position-relative mb-5">
                                            <img class="img-fluid rounded-circle mx-auto" src="img/testimonial-3.jpg" alt="">
                                            <div class="position-absolute top-100 start-50 translate-middle d-flex align-items-center justify-content-center bg-white rounded-circle" style="width: 60px; height: 60px;">
                                                <i class="fa fa-quote-left fa-2x text-primary"></i>
                                            </div>
                                        </div>
                                        <p class="fs-4 fw-normal" align="justify">"Professional staff from admission to discharge. Ready to go the extra mile. Well cared for. 'Even the tea was drinkable'. Many thanks.Completely satisfied with level of service and friendliness of staff. No issues encountered with procedure and post procedure care of high standard."</p>
                                        <hr class="w-25 mx-auto">
                                        <h3>Aritrika Ganguly</h3>
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
