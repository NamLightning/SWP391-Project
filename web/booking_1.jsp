<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PetHub</title>
        <link rel="stylesheet" href="./css/booking_1.css">
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
                    <span class="step-number step-number-active" aria-current="step">1</span>
                    <span class="step-text step-text-active">Booking Details</span>
                </a>
                <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/0dfc62669a6e3fd2ef83ca945a7bf8e70da1b4dde773f49c77d7351add13a61b?placeholderIfAbsent=true&apiKey=61b4df99ebeb4d7c83bd0ecec7b90c13" alt="" class="step-separator" />
                <a href="booking_2.jsp" class="step-item" role="button">
                    <span class="step-number step-number-inactive">2</span>
                    <span class="step-text step-text-inactive">Select Date & Time</span>
                </a>
                <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/0dfc62669a6e3fd2ef83ca945a7bf8e70da1b4dde773f49c77d7351add13a61b?placeholderIfAbsent=true&apiKey=61b4df99ebeb4d7c83bd0ecec7b90c13" alt="" class="step-separator" />
                <a href="booking_3.jsp" class="step-item" role="button">
                    <span class="step-number step-number-inactive">3</span>
                    <span class="step-text step-text-inactive">Select Payment</span>
                </a>
            </nav>

            <h2 class="section-title">Personal Information</h2>
            <form class="form-container">
                <div class="form-row">
                    <div class="form-field">
                        <label for="firstName" class="form-label">First Name</label>
                        <div class="form-input-wrapper">
                            <input id="firstName" type="text" placeholder="First Name" class="form-input" value="" />
                        </div>
                    </div>
                    <div class="form-field">
                        <label for="lastName" class="form-label">Last name</label>
                        <div class="form-input-wrapper">
                            <input id="lastName" type="text" placeholder="Last name" class="form-input" value="" />
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-field">
                        <label for="phoneNumber" class="form-label">Phone Number</label>
                        <div class="form-input-wrapper">
                            <input id="phoneNumber" type="tel" placeholder="Phone Number" class="form-input" value="" />
                        </div>
                    </div>
                    <div class="form-field">
                        <label for="email" class="form-label">Email</label>
                        <div class="form-input-wrapper">
                            <input id="email" type="email" placeholder="Email" class="form-input" value="" />
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-field">
                        <label for="address" class="form-label">Address</label>
                        <div class="form-input-wrapper" style="width: 48%;">
                            <input id="address" type="text" placeholder="Address" class="form-input" value="" />
                        </div>
                    </div>
                </div>
            </form>

            <hr class="section-divider" />

            <h2 class="section-title">Pet Information</h2>
            <form class="form-container">
                <div class="form-row">
                    <div class="form-field">
                        <label for="petName" class="form-label">Pet Name</label>
                        <div class="form-input-wrapper">
                            <input id="petName" type="text" placeholder="Pet Name" class="form-input" value="" />
                        </div>
                    </div>
                    <div class="form-field">
                        <label for="petType" class="form-label">Gender</label>
                        <div class="form-input-wrapper">
                            <select id="petType" name="petType" class="form-input" autocomplete="off">
                                <option value="1">Male</option>
                                <option value="2">Female</option>
                            </select>
                        </div>
                    </div>

                </div>
                <div class="form-row">
                    <div class="form-field">
                        <label for="petBreed" class="form-label">Breed</label>
                        <div class="form-input-wrapper">
                            <input id="petBreed" type="text" placeholder="Breed" class="form-input" value="" />
                        </div>
                    </div>
                    <div class="form-field">
                        <label for="petAge" class="form-label">Age</label>
                        <div class="form-input-wrapper">
                            <input id="petAge" type="text" placeholder="Age" class="form-input" value="" />
                        </div>
                    </div>
                </div>
            </form>

            <div class="footer-button" >
                <input name="submit" type="submit" class="continue-button" value="Continue">
            </div>
        </section>

        <%@include file="includes/footer.jsp"%>

    </center>
    <script src="./js/sidebar.js"></script>

</body>
</html>