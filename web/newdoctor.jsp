<%-- 
    Document   : newdoctor
    Created on : Mar 1, 2023, 9:48:28 PM
    Author     : anich
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
        <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/libs/css/style.css">
        <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
        <link rel="stylesheet" href="assets/vendor/charts/chartist-bundle/chartist.css">
        <link rel="stylesheet" href="assets/vendor/charts/morris-bundle/morris.css">
        <link rel="stylesheet" href="assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="assets/vendor/charts/c3charts/c3.css">
        <link rel="stylesheet" href="assets/vendor/fonts/flag-icon-css/flag-icon.min.css">
        <title>Concept - Bootstrap 4 Admin Dashboard Template</title>
        <meta name="robots" content="nindex, nofollow">
        <script nonce="e696e523-68b0-480b-95ed-c92029b52c15">(function(w, d){!function(f, g, h, i){f[h] = f[h] || {}; f[h].executed = []; f.zaraz = {deferred:[], listeners:[]}; f.zaraz.q = []; f.zaraz._f = function(j){return function(){var k = Array.prototype.slice.call(arguments); f.zaraz.q.push({m:j, a:k})}}; for (const l of["track", "set", "debug"])f.zaraz[l] = f.zaraz._f(l); f.zaraz.init = () => {var m = g.getElementsByTagName(i)[0], n = g.createElement(i), o = g.getElementsByTagName("title")[0]; o && (f[h].t = g.getElementsByTagName("title")[0].text); f[h].x = Math.random(); f[h].w = f.screen.width; f[h].h = f.screen.height; f[h].j = f.innerHeight; f[h].e = f.innerWidth; f[h].l = f.location.href; f[h].r = g.referrer; f[h].k = f.screen.colorDepth; f[h].n = g.characterSet; f[h].o = (new Date).getTimezoneOffset(); if (f.dataLayer)for (const s of Object.entries(Object.entries(dataLayer).reduce(((t, u) => ({...t[1], ...u[1]})))))zaraz.set(s[0], s[1], {scope:"page"}); f[h].q = []; for (; f.zaraz.q.length; ){const v = f.zaraz.q.shift(); f[h].q.push(v)}n.defer = !0; for (const w of[localStorage, sessionStorage])Object.keys(w || {}).filter((y => y.startsWith("_zaraz_"))).forEach((x => {try{f[h]["z_" + x.slice(7)] = JSON.parse(w.getItem(x))} catch {f[h]["z_" + x.slice(7)] = w.getItem(x)}})); n.referrerPolicy = "origin"; n.src = "/cdn-cgi/zaraz/s.js?z=" + btoa(encodeURIComponent(JSON.stringify(f[h]))); m.parentNode.insertBefore(n, m)}; ["complete", "interactive"].includes(g.readyState)?zaraz.init():f.addEventListener("DOMContentLoaded", zaraz.init)}(w, d, "zarazData", "script"); })(window, document);</script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <body>
        <jsp:include page="sidemenu.jsp" ></jsp:include>
            <div class="dashboard-main-wrapper">

                <div class="dashboard-wrapper">
                    <div class="dashboard-ecommerce">
                        <div class="container-fluid dashboard-content ">



                            <div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="page-header">
                                        <h2 class="pageheader-title">E-commerce Dashboard Template </h2>
                                        <p class="pageheader-text">Nulla euismod urna eros, sit amet scelerisque torton lectus vel mauris facilisis faucibus at enim quis massa lobortis rutrum.</p>
                                        <div class="page-breadcrumb">
                                            <nav aria-label="breadcrumb">
                                                <ol class="breadcrumb">
                                                    <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Home</a></li>
                                                    <li class="breadcrumb-item active" aria-current="page">Dashboard </li>
                                                </ol>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
                            </div>



                            <div class="ecommerce-widget">
                                <div class="row">
                                    <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <h5 class="text-muted">Total Revenue</h5>
                                                <div class="metric-value d-inline-block">
                                                    <h1 class="mb-1">&#8377; ${TodayRevenue}</h1>
                                            </div>
                                            <div class="metric-label d-inline-block float-right text-success font-weight-bold">
                                                <!--                                                    <span><i class="fa fa-fw fa-arrow-up"></i></span><span>5.86%</span>-->
                                            </div>
                                        </div>
                                        <div id="sparkline-revenue"></div>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="text-muted">Refunds</h5>
                                            <div class="metric-value d-inline-block">
                                                <h1 class="mb-1">0.00</h1>
                                            </div>
                                            <div class="metric-label d-inline-block float-right text-primary font-weight-bold">
                                                <span>N/A</span>
                                            </div>
                                        </div>
                                        <div id="sparkline-revenue3"></div>
                                    </div>
                                </div>
                                <!--                                    <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12">
                                                                        <div class="card">
                                                                            <div class="card-body">
                                                                                <h5 class="text-muted">Avg. Revenue Per Week</h5>
                                                                                <div class="metric-value d-inline-block">
                                                                                    <h1 class="mb-1">$28000</h1>
                                                                                </div>
                                                                                <div class="metric-label d-inline-block float-right text-secondary font-weight-bold">
                                                                                    <span>-2.00%</span>
                                                                                </div>
                                                                            </div>
                                                                            <div id="sparkline-revenue4"></div>
                                                                        </div>
                                                                    </div>-->
                            </div>

                            <!-- Reports -->
                            <div class="col-12">
                                <div class="card">

                                    <div class="filter">
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

                                    <!--                                    <div class="filter">
                                                                            <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                                                            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                                                                <li class="dropdown-header text-start">
                                                                                    <h6>Filter</h6>
                                                                                </li>
                                    
                                                                                <li><a class="dropdown-item" href="#">Today</a></li>
                                                                                <li><a class="dropdown-item" href="#">This Month</a></li>
                                                                                <li><a class="dropdown-item" href="#">This Year</a></li>
                                                                            </ul>
                                                                        </div>-->
                                    <div class="row">
                                        <h5 class="card-title" style="margin-left: 30px">  Recent Bookings <span>| Today</span></h5>


                                        <div class="col-xl-9 col-lg-12 col-md-6 col-sm-12 col-12">
                                            <div class="card">
                                                <h5 class="card-header">Recent Orders</h5>
                                                <div class="card-body p-0">
                                                    <div class="table-responsive">
                                                        <table class="table">
                                                            <thead class="bg-light">
                                                            <tbody>
                                                                <c:forEach items="${DoctorAppointmentListDashBoard}" var="appointment">
                                                                    <tr>
                                                                        <th scope="row"><a href="#">${appointment.appointmentId}</a></th>
                                                                        <td>${appointment.patientFirstName} ${appointment.patientLastName}</td>
                                                                        <td><a href="#" class="text-primary">${appointment.departmentName}</a></td>
                                                                        <td>${appointment.doctorFirstName} ${appointment.doctorLastName}</td>
                                                                        <td>
                                                                            <c:if test="${appointment.statusId.equals('1')}"><span class="badge bg-warning">${appointment.status}</span></c:if>
                                                                            <c:if test="${appointment.statusId.equals('2')}"><span class="badge bg-info">${appointment.status}</span></c:if>
                                                                            <c:if test="${appointment.statusId.equals('3')}"><span class="badge bg-success">${appointment.status}</span></c:if>
                                                                            <c:if test="${appointment.statusId.equals('4')}"><span class="badge bg-danger">${appointment.status}</span></c:if>
                                                                            </td>
                                                                        </tr>

                                                                </c:forEach>
                                                            </tbody>
                                                        </table>

                                                    </div>

                                                </div>
                                            </div><!-- End Recent Sales -->
                                        </div>
                                        <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                            <div class="card">
                                                <h5 class="card-header">Customer Acquisition</h5>
                                                <div class="card-body">
                                                    <div class="ct-chart ct-golden-section" style="height: 354px;"></div>
                                                    <div class="text-center">
                                                        <span class="legend-item mr-2">
                                                            <span class="fa-xs text-primary mr-1 legend-tile"><i class="fa fa-fw fa-square-full"></i></span>
                                                            <span class="legend-text">Returning</span>
                                                        </span>
                                                        <span class="legend-item mr-2">
                                                            <span class="fa-xs text-secondary mr-1 legend-tile"><i class="fa fa-fw fa-square-full"></i></span>
                                                            <span class="legend-text">First Time</span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

    <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>

    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>

    <script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>

    <script src="assets/libs/js/main-js.js"></script>

    <script src="assets/vendor/charts/chartist-bundle/chartist.min.js"></script>

    <script src="assets/vendor/charts/sparkline/jquery.sparkline.js"></script>

    <script src="assets/vendor/charts/morris-bundle/raphael.min.js"></script>
    <script src="assets/vendor/charts/morris-bundle/morris.js"></script>

    <script src="assets/vendor/charts/c3charts/c3.min.js"></script>
    <script src="assets/vendor/charts/c3charts/d3-5.4.0.min.js"></script>
    <script src="assets/vendor/charts/c3charts/C3chartjs.js"></script>
    <script src="assets/libs/js/dashboard-ecommerce.js"></script>

    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
    <script>
            window.dataLayer = window.dataLayer || [];
            function gtag(){dataLayer.push(arguments); }
            gtag('js', new Date());
            gtag('config', 'UA-23581568-13');
    </script>
    <script defer src="https://static.cloudflareinsights.com/beacon.min.js/vaafb692b2aea4879b33c060e79fe94621666317369993" integrity="sha512-0ahDYl866UMhKuYcW078ScMalXqtFJggm7TmlUtp0UlD4eQk0Ixfnm5ykXKvGJNFjLMoortdseTfsRT8oCfgGA==" data-cf-beacon='{"rayId":"7a12b6840feb8537","token":"cd0b4b3a733644fc843ef0b185f98241","version":"2023.2.0","si":100}' crossorigin="anonymous"></script>
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
</html>
