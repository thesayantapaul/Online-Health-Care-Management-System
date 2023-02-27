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
        <title>JSP Page</title>
        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

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

        <!-- Template Main CSS File -->
        <link href="css/style1.css" rel="stylesheet">

    </head>
    <body>
        <aside id="sidebar" class="sidebar">

            <ul class="sidebar-nav" id="sidebar-nav">

                <li class="nav-item">
                    <a class="nav-link" onclick="fetchContent('doctorhome.jsp', 'main')">
                        <i class="bi bi-grid"></i>
                        <span>Dashboard</span>                    
                    </a>
                </li><!-- End Dashboard Nav -->

               <li class="nav-item">
                    <a class="nav-link" onclick="fetchContent('doctorviewbooking.jsp', 'main')">
                        <i class="bi bi-grid"></i>
                        <span>View Booking</span>                    
                    </a>
                </li><!-- End Components Nav -->
                <li class="nav-item">
                    <a class="nav-link" onclick="fetchContent('prescription.jsp', 'main')">
                        <i class="bi bi-grid"></i>
                        <span>Generate Prescription</span>                    
                    </a>
                </li><!-- End Forms Nav -->
        </aside> 
        