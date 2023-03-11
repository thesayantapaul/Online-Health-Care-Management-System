<%-- 
    Document   : sidemenu
    Created on : Feb 24, 2023, 1:55:15 PM
    Author     : anich
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OHMS Doctor's HomePage</title>
        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">
        <!--<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">-->

        <!-- Google Fonts -->
        <link href="https://fonts.gstatic.com" rel="preconnect">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-icons.css" rel="stylesheet">
        <link href="css/boxicons.min.css" rel="stylesheet">
        <link href="css/quill.snow.css" rel="stylesheet">
        <link href="css/quill.bubble.css" rel="stylesheet">
        <link href="css/remixicon.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <!-- Template Main CSS File -->
        <link href="css/style1.css" rel="stylesheet">
        <link href="css/sideMenu.css" rel="stylesheet">

    </head>
    <body id="body-pd">
        <header class="header" id="header">
            <div class="header_toggle"> <i class='bx bx-menu' id="header-toggle"></i> </div>
            <!--<div class="header_img"> <img src="https://i.imgur.com/hczKIze.jpg" alt=""> </div>-->
        </header>
        <div class="l-navbar" id="nav-bar">
            <nav class="nav">
                <div> 
                    <a href="#" class="nav_logo"> <i class='bx bx-layer nav_logo-icon'></i> <span class="nav_logo-name">OHMS</span> </a>
                    <div class="nav_list"> 
                        <a href="home" class="nav_link active"> <i class='bx bx-grid-alt nav_icon'></i> <span class="nav_name">Doctor's Dashboard</span> </a>
                        <a onclick="fetchContent('doctorviewbooking.jsp', 'target')" class="nav_link"> <i class='bx bx-book'></i> <span class="nav_name">View Bookings</span></a> 
                        <!--<a onclick="fetchContent('prescribe.jsp', 'target')" class="nav_link"> <i class='bx bx-detail'></i> <span class="nav_name">Generate Prescription</span> </a>--> 
                        <a onclick="fetchContent('doctortodayAppointment.jsp', 'target')" class="nav_link"><i class="fab fa-yelp"></i> <span class="nav_name">Generate Prescription</span> </a> 
                        <a onclick="fetchContent('doctorPrescribed.jsp', 'target')" class="nav_link"> <i class="fab fa-searchengin"></i><span class="nav_name">Patient History</span> </a> 

                        <a onclick="fetchContent('pastDoctorAppointment.jsp', 'target')" class="nav_link"><i class="bi bi-calendar3"></i><span class="nav_name">Past Appointment</span> </a> 

                    </div> 
                    <a href="Logout" class="nav_link"> <i class='bx bx-log-out nav_icon'></i> <span class="nav_name">Sign Out</span> </a>
            </nav>
        </div>
        <!--        Container Main start
                <div class="height-100 bg-light">
                    <h4>Main Components</h4>
                </div>-->
        <script src="js/SideMenu.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.3.js" 
                            integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" 
                    crossorigin="anonymous"></script>
</html>
