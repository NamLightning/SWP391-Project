
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PetHub</title>
        <link rel="stylesheet" href="./css/booking_2.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/footer.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    </head>
    <body>
    <center>
        <%@include file="includes/header.jsp"%>

       <section class="booking-frame">
            <nav class="thread" aria-label="Booking steps">
                <a href="booking_1.jsp" class="step-item" role="button">
                    <span class="step-number step-number-inactive" aria-current="step">1</span>
                    <span class="step-text step-text-inactive">Booking Details</span>
                </a>
                <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/0dfc62669a6e3fd2ef83ca945a7bf8e70da1b4dde773f49c77d7351add13a61b?placeholderIfAbsent=true&apiKey=61b4df99ebeb4d7c83bd0ecec7b90c13" alt="" class="step-separator" />
                <a href="booking_2.jsp" class="step-item" role="button">
                    <span class="step-number step-number-active">2</span>
                    <span class="step-text step-text-active">Select Date & Time</span>
                </a>
                <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/0dfc62669a6e3fd2ef83ca945a7bf8e70da1b4dde773f49c77d7351add13a61b?placeholderIfAbsent=true&apiKey=61b4df99ebeb4d7c83bd0ecec7b90c13" alt="" class="step-separator" />
                <a href="booking_3.jsp" class="step-item" role="button">
                    <span class="step-number step-number-inactive">3</span>
                    <span class="step-text step-text-inactive">Select Payment</span>
                </a>
            </nav>

            <div class="schedule-container">
                <h2 class="schedule-title">Schedule Date & Time</h2>
                <div class="content-wrapper">
                    

                    <form class="time-set">
                        <div class="form-field">
                            <label for="time-input" class="form-label">Time</label>
                            <input type="datetime-local" id="time-input" class="form-input" value="" required>
                        </div>

                        <div class="form-field">
                            <label for="clinic" class="form-label">Clinic</label>
                            <div class="form-select">
                                <select id="clinic" name="clinic" class="form-input">
                                    <option value="1">Option 1</option>
                                    <option value="2">Option 2</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-field">
                            <label for="clinic" class="form-label">Consultation with</label>
                            <div class="form-select">
                                <select id="Consultation" name="Consultation" class="form-input">
                                    <option value="1">Option 1</option>
                                    <option value="2">Option 2</option>
                                </select>
                            </div>
                        </div>


                    </form>
                    
                    
                    
                    <div class="calendar-info-container">
                        <aside class="pet-info">
                            <img src="#" class="pet-image">
                            <div class="pet-details">
                                <h3 class="pet-name">Lucy</h3>
                                <div class="pet-attributes">
                                    <p>Golden Retriever</p>
                                    <p>Female, 2 y.o</p>
                                </div>
                                <p class="pet-condition">Swollen leg for about 3 days</p>
                            </div>
                        </aside>
                    </div>
                </div>
            </div>

            <div class="footer-button" >
                <input name="submit" type="submit" class="continue-button" value="Continue">
            </div>
        </section>

        <%@include file="includes/footer.jsp"%>

    </center>
    <script src="./js/sidebar.js"></script>

</body>
</html>
