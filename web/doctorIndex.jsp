<%-- 
    Document   : doctorindex
    Created on : Feb 27, 2023, 1:32:46 PM
    Author     : anich
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Vendor CSS Files -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-icons.css" rel="stylesheet">
        <link href="css/boxicons.min.css" rel="stylesheet">
        <link href="css/quill.snow.css" rel="stylesheet">
        <link href="css/quill.bubble.css" rel="stylesheet">
        <link href="css/remixicon.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="css/style1.css" rel="stylesheet">
    </head>

    <script src="https://code.jquery.com/jquery-3.6.3.js" 
                        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" 
                crossorigin="anonymous"></script>
    <script>

        function fetchContent(selectedId, targetId) {
            alert(selectedId);
            $.ajax({
                url: selectedId,

                success: function (responseText) {
                    $("#" + targetId).html(responseText);
                }
            });
        }



    </script>
    <jsp:include page="sidemenu.jsp" ></jsp:include>

        <body >
            <div id="main">
                <div id="target">
                    <main  class="main">

                        <div class="pagetitle">
                            <h1>Dashboard</h1>
                            <nav>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                                    <li class="breadcrumb-item active">Dashboard</li>
                                </ol>
                            </nav>
                        </div><!-- End Page Title -->

                        <section class="section dashboard">


                            <!-- Left side columns -->
                            <div class="col-lg-10">
                                <div class="row">

                                    <!-- Sales Card -->
                                    <div class="col-xxl-4 col-md-6">
                                        <div class="card info-card sales-card">

                                            <div class="filter">
                                                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                                    <li class="dropdown-header text-start">
                                                        <h6>Filter</h6>
                                                    </li>

                                                    <li><a class="dropdown-item" href="#">Today</a></li>
                                                    <li><a class="dropdown-item" href="#">This Month</a></li>
                                                    <li><a class="dropdown-item" href="#">This Year</a></li>
                                                </ul>
                                            </div>

                                            <div class="card-body">
                                                <h5 class="card-title">Appointments <span>| Today</span></h5>

                                                <div class="d-flex align-items-center">
                                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                                        <i class="bi bi-person-check-fill"></i>
                                                    </div>
                                                    <div class="ps-3">
                                                        <h6>${TodayBooking}</h6>
                                                    <span class="text-success small pt-1 fw-bold"><c:if test="${IncreaseRevenue!=null}"><i class="bi bi-arrow-up-circle"></i></c:if><c:if test="${DecreaseRevenue!=null}"><i class="bi bi-arrow-down-circle"></i></c:if><span class="text-muted small pt-2 ps-1">${HigherOrLowerText}</span>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div><!-- End Sales Card -->

                                <!-- Revenue Card -->
                                <div class="col-xxl-4 col-md-6">
                                    <div class="card info-card revenue-card">

                                        <div class="filter">
                                            <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                                <li class="dropdown-header text-start">
                                                    <h6>Filter</h6>
                                                </li>

                                                <li><a class="dropdown-item" href="#">Today</a></li>
                                                <li><a class="dropdown-item" href="#">This Month</a></li>
                                                <li><a class="dropdown-item" href="#">This Year</a></li>
                                            </ul>
                                        </div>

                                        <div class="card-body">
                                            <h5 class="card-title">Total Revenue <span>| Today</span></h5>

                                            <div class="d-flex align-items-center">
                                                <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                                    <i class="bi bi-currency-dollar"></i>
                                                </div>
                                                <div class="ps-3">
                                                    <h6>INR ${TodayRevenue}</h6>
                                                    <span class="text-success small pt-1 fw-bold"><c:if test="${IncreaseRevenue!=null}"><i class="bi bi-arrow-up-circle"></i></c:if><c:if test="${DecreaseRevenue!=null}"><i class="bi bi-arrow-down-circle"></i></c:if></span> <span class="text-muted small pt-2 ps-1">${HigherOrLowerTextRevenue}</span>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div><!-- End Revenue Card -->

                                <!-- Customers Card -->
                                <div class="col-xxl-4 col-xl-12">

                                    <div class="card info-card customers-card">

                                        <div class="filter">
                                            <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                                <li class="dropdown-header text-start">
                                                    <h6>Filter</h6>
                                                </li>

                                                <li><a class="dropdown-item" href="#">Today</a></li>
                                                <li><a class="dropdown-item" href="#">This Month</a></li>
                                                <li><a class="dropdown-item" href="#">This Year</a></li>
                                            </ul>
                                        </div>

                                        <div class="card-body">
                                            <h5 class="card-title"> Users Registered<span>| Today </span></h5>

                                            <div class="d-flex align-items-center">
                                                <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                                    <i class="bi bi-people"></i>
                                                </div>
                                                <div class="ps-3">
                                                    <h6>${TodayUsers}</h6>
                                                    <span class="text-success small pt-1 fw-bold"><i class="bi bi-arrow-up-circle"></i></span><span class="text-muted small pt-2 ps-1">User registered today</span>

                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                </div><!-- End Customers Card -->

                                <!-- Reports -->
                                <div class="col-12">
                                    <div class="card">

                                        <div class="filter">
                                            <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                                <li class="dropdown-header text-start">
                                                    <h6>Filter</h6>
                                                </li>

                                                <li><a class="dropdown-item" href="#">Today</a></li>
                                                <li><a class="dropdown-item" href="#">This Month</a></li>
                                                <li><a class="dropdown-item" href="#">This Year</a></li>
                                            </ul>
                                        </div>

                                        <div class="card-body">
                                            <h5 class="card-title">Reports <span>/Appointments-Revenue-Users</span></h5>

                                            <!-- Line Chart -->
                                            <div id="reportsChart"></div>

                                            <script>
                                                document.addEventListener("DOMContentLoaded", () => {
                                                    new ApexCharts(document.querySelector("#reportsChart"), {
                                                        series: [{
                                                                name: 'Appointments',
                                                                data: [${Day6Booking}, ${Day5Booking}, ${Day4Booking}, ${Day3Booking}, ${Day2Booking}, ${Day1Booking},${TodayBooking}]
                                                            }, {
                                                                name: 'Revenue',
                                                                data: [${Day6Revenue}, ${Day5Revenue}, ${Day4Revenue}, ${Day3Revenue}, ${Day2Revenue}, ${Day1Revenue},${TodayRevenue}]
                                                            }, {
                                                                name: 'Users',
                                                                data: [${Day6User},${Day5User},${Day4User},${Day3User},${Day2User},${Day1User},${TodayUsers}]
                                                            }],
                                                        chart: {
                                                            height: 350,
                                                            type: 'area',
                                                            toolbar: {
                                                                show: false
                                                            }
                                                        },
                                                        markers: {
                                                            size: 4
                                                        },
                                                        colors: ['#4154f1', '#2eca6a', '#ff771d'],
                                                        fill: {
                                                            type: "gradient",
                                                            gradient: {
                                                                shadeIntensity: 1,
                                                                opacityFrom: 0.3,
                                                                opacityTo: 0.4,
                                                                stops: [0, 90, 100]
                                                            }
                                                        },
                                                        dataLabels: {
                                                            enabled: false
                                                        },
                                                        stroke: {
                                                            curve: 'smooth',
                                                            width: 2
                                                        },
                                                        xaxis: {

                                                            categories: ["${Day6}", "${Day5}", "${Day4}", "${Day3}", "${Day2}", "${Day1}", "${CurrentDay}"]
                                                        },
                                                        tooltip: {
                                                            x: {
                                                                format: 'dd/MM/yy HH:mm'
                                                            }
                                                        }
                                                    }).render();
                                                });
                                            </script>
                                            <!-- End Line Chart -->

                                        </div>

                                    </div>
                                </div><!-- End Reports -->

                                <!-- Recent Sales -->
                                <div class="col-12">
                                    <div class="card recent-sales overflow-auto">

                                        <div class="filter">
                                            <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                                <li class="dropdown-header text-start">
                                                    <h6>Filter</h6>
                                                </li>

                                                <li><a class="dropdown-item" href="#">Today</a></li>
                                                <li><a class="dropdown-item" href="#">This Month</a></li>
                                                <li><a class="dropdown-item" href="#">This Year</a></li>
                                            </ul>
                                        </div>

                                        <div class="card-body">
                                            <h5 class="card-title">Recent Bookings <span>| Today</span></h5>

                                            <table class="table table-borderless datatable">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">Appointment Id</th>
                                                        <th scope="col">patient</th>
                                                        <th scope="col">Department</th>
                                                        <th scope="col">Doctor</th>
                                                        <th scope="col">Status</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${AppointmentListDashBoard}" var="appointment">
                                                    <tr>
                                                        <th scope="row"><a href="#">${appointment.appointmentId}</a></th>
                                                        <td>${appointment.patientFirstName} ${appointment.patientLastName}</td>
                                                        <td><a href="#" class="text-primary">${appointment.departmentName}</a></td>
                                                        <td>${appointment.doctorFirstName} ${appointment.doctorLastName}</td>
                                                        <td>
                                                    <c:if test="${appointment.statusId.equals('1')}"><span class="badge bg-warning">${appointment.statusOfAppointments}</span></c:if>
                                                    <c:if test="${appointment.statusId.equals('2')}"><span class="badge bg-info">${appointment.statusOfAppointments}</span></c:if>
                                                    <c:if test="${appointment.statusId.equals('3')}"><span class="badge bg-success">${appointment.statusOfAppointments}</span></c:if>
                                                    <c:if test="${appointment.statusId.equals('4')}"><span class="badge bg-danger">${appointment.statusOfAppointments}</span></c:if>
                                                    </td>
                                                    </tr>

                                                </c:forEach>
                                                </tbody>
                                            </table>

                                        </div>

                                    </div>
                                </div><!-- End Recent Sales -->

                                <!-- Top Selling -->
                                <div class="col-12">
                                    <div class="card top-selling overflow-auto">

                                        <div class="filter">
                                            <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                                <li class="dropdown-header text-start">
                                                    <h6>Filter</h6>
                                                </li>

                                                <li><a class="dropdown-item" href="#">Today</a></li>
                                                <li><a class="dropdown-item" href="#">This Month</a></li>
                                                <li><a class="dropdown-item" href="#">This Year</a></li>
                                            </ul>
                                        </div>

                                        <div class="card-body pb-0">
                                            <h5 class="card-title">Top Department in terms of booking <span>| Today</span></h5>

                                            <table class="table table-borderless datatable">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">Department Id</th>

                                                        <th scope="col">Department Name</th>
                                                        <th scope="col">Doctor Name</th>


                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${AppointmentListDashBoard}" var="appointment">
                                                    <tr>
                                                        <th scope="row"><a href="#">${appointment.departmentId}</a></th>
                                                        <td>${appointment.departmentName}</td>

                                                        <td>${appointment.doctorFirstName} ${appointment.doctorLastName}</td>

                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>

                                        </div>

                                    </div>
                                </div><!-- End Top Selling -->

                            </div>
                        </div>
                        </div><!-- End Left side columns -->

                    </section>

                </main><!-- End #main -->
            </div>
    </body>

    <!-- Vendor JS Files -->
    <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/chart.js/chart.umd.js"></script>
    <script src="assets/vendor/echarts/echarts.min.js"></script>
    <script src="assets/vendor/quill/quill.min.js"></script>
    <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
    <script src="assets/vendor/tinymce/tinymce.min.js"></script>
    <script src="assets/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>

</html>
