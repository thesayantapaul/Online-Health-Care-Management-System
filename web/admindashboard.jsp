<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${Loggedin==null}">
    <c:redirect url="login.jsp"/>
</c:if>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Dashboard - Admin</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.gstatic.com" rel="preconnect">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
        <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">


        <!-- =======================================================
        * Template Name: NiceAdmin - v2.5.0
        * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
        * Author: BootstrapMade.com
        * License: https://bootstrapmade.com/license/
        ======================================================== -->

    </head>
    <script>
        function adminAddDoctorJSP()
        {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function ()
            {
                document.getElementById("main").innerHTML = xmlhttp.responseText;
            };
            xmlhttp.open("GET", "ViewDoctorRegisteration", true);
            xmlhttp.send();
        }
        function fetchAppointmentsThisMonth() {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function ()
            {
                document.getElementById("appointmentCard").innerHTML = xmlhttp.responseText;
            };
            xmlhttp.open("GET", "AppointmentThisMonth", true);
            xmlhttp.send();

        }
        function fetchAppointmentsThisYear() {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function ()
            {
                document.getElementById("appointmentCard").innerHTML = xmlhttp.responseText;
            };
            xmlhttp.open("GET", "AppointmentThisYear", true);
            xmlhttp.send();

        }
        function fetchRevenueThisMonth() {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function ()
            {
                document.getElementById("revenueCard").innerHTML = xmlhttp.responseText;
            };
            xmlhttp.open("GET", "RevenueThisMonth", true);
            xmlhttp.send();

        }
        function fetchRevenueThisYear() {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function ()
            {
                document.getElementById("revenueCard").innerHTML = xmlhttp.responseText;
            };
            xmlhttp.open("GET", "RevenueThisYear", true);
            xmlhttp.send();

        }
        function fetchUserThisMonth() {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function ()
            {
                document.getElementById("userCard").innerHTML = xmlhttp.responseText;
            };
            xmlhttp.open("GET", "UserThisMonth", true);
            xmlhttp.send();

        }
        function fetchUserThisYear() {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function ()
            {
                document.getElementById("userCard").innerHTML = xmlhttp.responseText;
            };
            xmlhttp.open("GET", "UserThisYear", true);
            xmlhttp.send();

        }
        function fetchDepartmentsThisMonth() {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function ()
            {
                document.getElementById("topDepartmentstableDiv").innerHTML = xmlhttp.responseText;
                initialiseDataTables();
            };
            xmlhttp.open("GET", "TopDepartmentsThisMonth", true);
            xmlhttp.send();

        }
        function fetchDepartmentsThisYear() {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function ()
            {
                document.getElementById("topDepartmentstableDiv").innerHTML = xmlhttp.responseText;
                initialiseDataTables();
            };
            xmlhttp.open("GET", "TopDepartmentsThisYear", true);
            xmlhttp.send();

        }
    </script>

    <body>

        <jsp:include page="menu.jsp"></jsp:include>
            <main id="main" class="main">

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

                                            <li><a class="dropdown-item" href="admindashboard.jsp">Today</a></li>
                                            <li><a class="dropdown-item" href="#" onclick="fetchAppointmentsThisMonth()">This Month</a></li>
                                            <li><a class="dropdown-item" href="#" onclick="fetchAppointmentsThisYear()">This Year</a></li>
                                        </ul>
                                    </div>

                                    <div class="card-body" id="appointmentCard">
                                        <h5 class="card-title">Appointments <span>| Today</span></h5>

                                        <div class="d-flex align-items-center">
                                            <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                                <i class="bi bi-person-check-fill"></i>
                                            </div>
                                            <div class="ps-3">
                                                <h6>${TodayBooking}</h6>
                                            <span class="text-success small pt-1 fw-bold"><c:if test="${IncreaseBooking!=null}"><i class="bi bi-arrow-up-circle"></i></c:if><c:if test="${DecreaseBooking!=null}"><i class="bi bi-arrow-down-circle"></i></c:if></span><span class="text-muted small pt-2 ps-1">${HigherOrLowerText}</span>

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

                                            <li><a class="dropdown-item" href="admindashboard.jsp">Today</a></li>
                                            <li><a class="dropdown-item" href="#" onclick="fetchRevenueThisMonth()">This Month</a></li>
                                            <li><a class="dropdown-item" href="#" onclick="fetchRevenueThisYear()">This Year</a></li>
                                        </ul>
                                    </div>

                                    <div class="card-body" id="revenueCard">
                                        <h5 class="card-title">Total Revenue <span>| Today</span></h5>

                                        <div class="d-flex align-items-center">
                                            <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                                <i class="bi bi-currency-rupee"></i>
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

                                            <li><a class="dropdown-item" href="admindashboard.jsp">Today</a></li>
                                            <li><a class="dropdown-item" href="#" onclick="fetchUserThisMonth()">This Month</a></li>
                                            <li><a class="dropdown-item" href="#" onclick="fetchUserThisYear()">This Year</a></li>
                                        </ul>
                                    </div>

                                    <div class="card-body" id="userCard">
                                        <h5 class="card-title"> Users Registered<span> | Today </span></h5>

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

                                        <li><a class="dropdown-item" href="admindashboard.jsp">Today</a></li>
                                        <li><a class="dropdown-item" href="#" onclick="fetchDepartmentsThisMonth()">This Month</a></li>
                                        <li><a class="dropdown-item" href="#" onclick="fetchDepartmentsThisYear()">This Year</a></li>
                                    </ul>
                                </div>

                                <div class="card-body pb-0" id="topDepartmentstableDiv">
                                    <h5 class="card-title">Top Department in terms of booking <span>| Today</span></h5>

                                    <table class="table table-borderless datatable">
                                        <thead>
                                            <tr>
                                                <th scope="col">Department Id</th>

                                                <th scope="col">Department Name</th>

                                                <th scope="col">Occupancy(no of patients)</th>


                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${OccupancyInDepartments}" var="department">
                                                <tr>
                                                    <th scope="row"><a href="#">${department.departmentId}</a></th>
                                                    <td>${department.departmentName}</td>
                                                    <td>${department.numberOfPatients}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>

                                </div>


                            </div>
                        </div><!-- End Top Selling -->

                    </div>
                </div><!-- End Left side columns -->

            </section>

        </main><!-- End #main -->
        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>


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

    </body>
    <script>
                                            function initialiseDataTables() {
                                                const datatables = [...document.querySelectorAll('.datatable')];
                                                datatables.forEach(datatable => {
                                                    new simpleDatatables.DataTable(datatable);
                                                });
                                                           }
                                            initialiseDataTables();
    </script>

</html>