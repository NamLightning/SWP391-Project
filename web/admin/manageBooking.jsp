<%@page import="java.util.List"%>
<%--<%@page import="Model.Bookings"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<%--<%@page import="Dao.BookingsDAO" %>--%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Responsive Admin Dashboard</title>
        <link rel="stylesheet" href="<c:url value="/css/managebooking.css"/>">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>

    <body>
        <div class="container">
            <%@include file="../includes/sidebar.jsp"%>
            <div class="main">
                <div class="topbar">
                    <div class="toggle">
                        <ion-icon name="menu-outline"></ion-icon>
                    </div>
                    <div class="user hover-item" id="hoverItem">
                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/9d9994c0a1b936c2427317594bc441b8fcc98af8133e59027568749dfd2cb1ae?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" alt="User avatar" class="user-avatar" />
                    </div>
                    <%@include file="adminMenu.jsp"%>
                </div>
                <div class="topbar">
                    <h1>Booking</h1>
                    <button class="view-service-btn" 
                            onclick="window.location.href = '<c:url value="/admin/manageService.jsp"/>'">View All Services</button>
                </div>
                <h4>Booking Display</h4>

                <div class="bookings-stat">
                    <div class="cardHeader">
                        <h2>Quick Stats</h2>
                    </div>

                    <div class="cardBox">
                        <div class="card">
                            <div>
                                <div class="cardName">Total Bookings</div>
                                <div class="numbers">152</div>
                            </div>
                            <div class="iconBx">
                                <ion-icon name="calendar-outline"></ion-icon>
                            </div>
                        </div>

                        <div class="card">
                            <div>
                                <div class="cardName">New Clients This Month</div>
                                <div class="numbers">5</div>
                            </div>
                            <div class="iconBx">
                                <ion-icon name="person-add-outline"></ion-icon>
                            </div>
                        </div>

                        <div class="card">
                            <div>
                                <div class="cardName">Returning Clients</div>
                                <div class="numbers">46%</div>
                            </div>
                            <div class="iconBx">
                                <ion-icon name="return-down-back-outline"></ion-icon>
                            </div>
                        </div>

                    </div>
                </div>
                <div>
                    <div class="tabs">
                        <div class="quick-stats">Bookings</div>
                        <img
                            loading="lazy"
                            src="https://cdn.builder.io/api/v1/image/assets/TEMP/34eef7bdc625fbd97e755536256173648f47ddfdfb369b5e3948ac453d3a109d?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b"
                            class="tab-img"
                            />
                    </div>
                    <div class="booking-container">
                        <div class="booking-list">
                            <div class="booking-item">
                                <div class="booking-card">
                                    <div class="booking-content">
                                        <div class="booking-details">
                                            <div class="doctor-name">Amanda Chavez</div>
                                            <div class="service-label">Service</div>
                                            <div class="service-type">Trim & Bathe Dog's Fur</div>
                                            <div class="date-label">Date</div>
                                            <div class="booking-date">25 Jul 2020</div>
                                        </div>
                                        <div class="booking-time">
                                            <div class="time-label">Time</div>
                                            <div class="time-slot">11:00 - 12:00</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="booking-item">
                                <div class="booking-card">
                                    <div class="booking-content">
                                        <div class="booking-details">
                                            <div class="doctor-name">Fionna Wade</div>
                                            <div class="service-label">Service</div>
                                            <div class="service-type">Comprehensive Dog Care</div>
                                            <div class="date-label">Date</div>
                                            <div class="booking-date">25 Jul 2020</div>
                                        </div>
                                        <div class="booking-time">
                                            <div class="time-label">Time</div>
                                            <div class="time-slot">11:00 - 12:00</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="booking-item">
                                <div class="booking-card">
                                    <div class="booking-content">
                                        <div class="booking-details">
                                            <div class="doctor-name">Beatrice Carrol</div>
                                            <div class="service-label">Service</div>
                                            <div class="service-type">Trim & Bathe Cat's Fur</div>
                                            <div class="date-label">Date</div>
                                            <div class="booking-date">25 Jul 2020</div>
                                        </div>
                                        <div class="booking-time">
                                            <div class="time-label">Time</div>
                                            <div class="time-slot">11:00 - 12:00</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="booking-item">
                                <div class="booking-card">
                                    <div class="booking-content">
                                        <div class="booking-details">
                                            <div class="doctor-name">Beatrice Carrol</div>
                                            <div class="service-label">Service</div>
                                            <div class="service-type">Comprehensive Cat Care</div>
                                            <div class="date-label">Date</div>
                                            <div class="booking-date">25 Jul 2020</div>
                                        </div>
                                        <div class="booking-time">
                                            <div class="time-label">Time</div>
                                            <div class="time-slot">11:00 - 12:00</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="../js/sidebar.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    </body>
</html>

