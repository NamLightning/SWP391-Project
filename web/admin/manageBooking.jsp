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
                    <div class="user">
                        <img src="#" alt="User profile picture">
                    </div>
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
                            <!--                            <div class="iconBx">
                                                            <ion-icon name="eye-outline"></ion-icon>
                                                        </div>-->
                        </div>

                        <div class="card">
                            <div>
                                <div class="cardName">Pending Approval</div>
                                <div class="numbers">23</div>
                            </div>
                            <!--                            <div class="iconBx">
                                                            <ion-icon name="cart-outline"></ion-icon>
                                                        </div>-->
                        </div>

                        <div class="card">
                            <div>
                                <div class="cardName">New Clients This Month</div>
                                <div class="numbers">5</div>
                            </div>
                            <!--                            <div class="iconBx">
                                                            <ion-icon name="chatbubble-outline"></ion-icon>
                                                        </div>-->
                        </div>

                        <div class="card">
                            <div>
                                <div class="cardName">Returning Clients</div>
                                <div class="numbers">46%</div>
                            </div>
                            <!--                            <div class="iconBx">
                                                            <ion-icon name="card-outline"></ion-icon>
                                                        </div>-->
                        </div>

                    </div>
                </div>
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
                                <img
                                    loading="lazy"
                                    src="https://cdn.builder.io/api/v1/image/assets/TEMP/2bae3accd02918a7e110fbaf0d19dddd4453d5c0c2022240ad570c5433a28285?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b"
                                    class="doctor-image"
                                    />
                                <div class="booking-content">
                                    <div class="booking-details">
                                        <div class="doctor-name">Amanda Chavez</div>
                                        <div class="service-label">Service</div>
                                        <div class="service-type">Physiotherapy</div>
                                        <div class="date-label">Date</div>
                                        <div class="booking-date">25 Jul 2020</div>
                                    </div>
                                    <div class="booking-time">
                                        <div class="time-label">Time</div>
                                        <div class="time-slot">11:00 - 12:00</div>
                                    </div>
                                </div>
                                <img
                                    loading="lazy"
                                    src="https://cdn.builder.io/api/v1/image/assets/TEMP/4338b248a1653277534479fd28dea4033ea0493d2aef29ea60a97825ab4fe0f9?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b"
                                    class="divider-image"
                                    />
                                <div class="booking-actions">
                                    <div class="accept-booking">Accept Booking</div>
                                    <div class="decline-booking">Decline</div>
                                </div>
                            </div>
                        </div>
                        <div class="booking-item">
                            <div class="booking-card">
                                <img
                                    loading="lazy"
                                    src="https://cdn.builder.io/api/v1/image/assets/TEMP/c5ee84574a5962f27c29204d2db02dd44c21e354fc2345a9454728a965b45ce9?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b"
                                    class="doctor-image"
                                    />
                                <div class="booking-content">
                                    <div class="booking-details">
                                        <div class="doctor-name">Fionna Wade</div>
                                        <div class="service-label">Service</div>
                                        <div class="service-type">Physiotherapy</div>
                                        <div class="date-label">Date</div>
                                        <div class="booking-date">25 Jul 2020</div>
                                    </div>
                                    <div class="booking-time">
                                        <div class="time-label">Time</div>
                                        <div class="time-slot">11:00 - 12:00</div>
                                    </div>
                                    <img
                                        loading="lazy"
                                        src="https://cdn.builder.io/api/v1/image/assets/TEMP/1669045011136480b194870c731410d5c995aac39851f6d8daff781a75f8900d?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b"
                                        class="divider-image"
                                        />
                                    <div class="booking-actions">
                                        <div class="accept-booking">Accept Booking</div>
                                        <div class="decline-booking">Decline</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="booking-item">
                            <div class="booking-card">
                                <img
                                    loading="lazy"
                                    src="https://cdn.builder.io/api/v1/image/assets/TEMP/f1a75ece14c200c2f5a26a56bbe30e29b8ebac7f8a577e1f5c344f1a476c1edd?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b"
                                    class="doctor-image"
                                    />
                                <div class="booking-details">
                                    <div class="doctor-name">Beatrice Carrol</div>
                                    <div class="service-label">Service</div>
                                    <div class="service-type">Physiotherapy</div>
                                    <div class="date-label">Date</div>
                                    <div class="booking-date">25 Jul 2020</div>
                                </div>
                                <div class="booking-time">
                                    <div class="time-label">Time</div>
                                    <div class="time-slot">11:00 - 12:00</div>
                                </div>
                                <img
                                    loading="lazy"
                                    src="https://cdn.builder.io/api/v1/image/assets/TEMP/27c6768161256fc285f30332507adc03b05d4a71ab4eac9748701b11afe17f30?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b"
                                    class="divider-image"
                                    />
                                <div class="booking-actions">
                                    <div class="accept-booking">Accept Booking</div>
                                    <div class="decline-booking">Decline</div>
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
