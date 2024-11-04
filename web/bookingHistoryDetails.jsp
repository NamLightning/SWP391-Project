<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PetHub</title>  
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/bookingHistoryDetails.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    </head>
    <body>
    <center>
        <%@include file="includes/header.jsp"%>
        <div class="main-container">
            <%@include file="includes/userMenu.jsp"%>
            <div class="booking-container">
                <main class="booking-content">
                    <header class="booking-header">
                        <div class="booking-title">
                            <a href="bookingHistory.jsp">
                                <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/d3a8368e32ab6849e0b920e718917e653e8ff0fca7c206e033fe2a8e99ee65ea?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="booking-icon" /></a>
                            <span>Booking Details</span>
                        </div>
                        <button class="rating-button" onclick="window.location.href='includes/rating.jsp'">
                            <span>Leave a Rating</span>
                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/46b9b658abdaaf976f22810fbc9aa6b68f13b2356188c3320e4f62964fcfb5e3?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="rating-icon" />
                        </button>
                    </header>
                    <h1 class="booking-number">My Booking : #96459761</h1>
                    <div class="booking-details-header">
                        <span class="booking-details-item">Service name</span>
                        <span class="booking-details-item" style="margin-left: 25%;">Date booking</span>
                        <span class="booking-details-item" style="margin-left: 7%;">DATE CHECK-IN</span>
                        <span class="booking-details-item" style="margin-left: 10%;">Total</span>
                    </div>
                    <div class="booking-service">
                        <div class="service-info">
                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/19b2c29c69dd7ba38b91c3c7127860cf968276ca0f67e9114fd7487c56f11a68?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Dog grooming service" class="service-image" />
                            <div class="service-details">
                                <span class="service-name">DOG FULL GROOMING</span>
                                <!--<span class="service-description">Date Booking: Oct 16, 2024 12:30</span>-->
                            </div>
                        </div>
                        <div class="booking-row">
                            <span class="booking-date">16/10/2024 12:30</span>
                            <span class="check-in-date">30/10/2024 07:52</span>
                            <span class="total-price">345.000₫</span>
                        </div>
                    </div>
                </main>
                <footer class="customer-info">
                    <div class="info-section">
                        <h2 class="info-title">Booking Information</h2>
                        <div class="info-content">
                            <p class="info-name">Kevin Gilbert</p>
                            <p><span class="info-name">Address:</span> <span class="info-detail">FPT Plaza 1, Da Nang</span></p>
                            <p><span class="info-name">Phone Number:</span> <span class="info-detail">+1-202-555-0118</span></p>
                            <p><span class="info-name">Email:</span> <span class="info-detail">kevin.gilbert@gmail.com</span></p>
                        </div>
                    </div>
                    <div class="vertical-divider" role="separator" aria-orientation="vertical"></div>
                    <div class="info-section" style="margin-left: 2%; ">
                        <h2 class="info-title">Registered Pet</h2>
                        <div class="info-content">
                            <p class="info-name">Max</p>
                            <p><span class="info-name">Pet Type:</span> <span class="info-detail">Dog</span></p>
                            <p><span class="info-name">Age:</span> <span class="info-detail">3 years</span></p>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <%@include file="includes/footer.jsp"%>
    </center>
</body>
</html>
