<%@page import="Model.Customer"%>
<%@page import="Dao.CustomerDAO"%>
<jsp:useBean id="reuses" class="Utils.Reuseable" scope="page"/>
<jsp:useBean id="cusDAO" class="Dao.CustomerDAO" scope="page"/>
<jsp:useBean id="serDAO" class="Dao.ServicesDAO" scope="page"/>
<jsp:useBean id="petDAO" class="Dao.PetsDAO" scope="page"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PetHub</title>
        <link rel="stylesheet" href="./css/booking_3.css">
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
                    <span class="step-number step-number-inactive">2</span>
                    <span class="step-text step-text-inactive">Select Date & Time</span>
                </a>
                <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/0dfc62669a6e3fd2ef83ca945a7bf8e70da1b4dde773f49c77d7351add13a61b?placeholderIfAbsent=true&apiKey=61b4df99ebeb4d7c83bd0ecec7b90c13" alt="" class="step-separator" />
                <a href="booking_3.jsp" class="step-item" role="button">
                    <span class="step-number step-number-active">3</span>
                    <span class="step-text step-text-active">Confirm Booking Information</span>
                </a>
            </nav>

            <div class="schedule-container">
                <h2 class="schedule-title">Confirm Booking Information</h2>
                <div class="content-wrapper">
                    <form class="confirm-set">
                        <div class="form-field">
                            <label class="payment-label">Payment method</label>
                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/dfc5e32f1af95709ba6194b582da6f745934d8eff3ec5130c386760116cb51ff?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8"
                                 alt="VN Pay" class="payment-icon">
                        </div>
                        <h2 class="section-title">Personal Information</h2>

                        <div class="form-container">
                            <div class="form-row">
                                <div class="form-field">
                                    <label for="firstName" class="form-label">First Name</label>
                                    <div class="form-input-wrapper">
                                        <input id="firstName" type="text" placeholder="First Name" class="form-input" value="${cus.getFirstName()}" />
                                    </div>
                                </div>
                                <div class="form-field">
                                    <label for="lastName" class="form-label">Last name</label>
                                    <div class="form-input-wrapper">
                                        <input id="lastName" type="text" placeholder="Last name" class="form-input" value="${cus.getLastName()}" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-field">
                                    <label for="phoneNumber" class="form-label">Phone Number</label>
                                    <div class="form-input-wrapper">
                                        <input id="phoneNumber" type="tel" placeholder="Phone Number" class="form-input" value="${cus.getPhoneNumber()}" />
                                    </div>
                                </div>
                                <div class="form-field">
                                    <label for="email" class="form-label">Email</label>
                                    <div class="form-input-wrapper">
                                        <input id="email" type="email" placeholder="Email" class="form-input" value="${cus.getEmail()}" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-field">
                                    <label for="address" class="form-label">Address</label>
                                    <div class="form-input-wrapper" style="width: 48%;">
                                        <input id="address" type="text" placeholder="Address" class="form-input" value="${cus.getAddress()}" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr class="section-divider" />

                        <h2 class="section-title">Pet Information</h2>

                        <div class="form-container">
                            <div class="form-field">
                                <label for="petName" class="form-label">Pet Name</label>
                                <div class="form-input-wrapper">
                                    <input id="petid" type="text" placeholder="Pet Name" class="form-input" value="${pet.getPetID()}" />

                                    <input id="petName" type="text" placeholder="Pet Name" class="form-input" value="${pet.getPetName()}" />
                                </div>
                            </div>

                            <div class="form-field">
                                <label for="petType" class="form-label">Pet Type</label>
                                <div class="form-input-wrapper">
                                    <!--                                    <select id="petType" name="petType" class="form-input" autocomplete="off">
                                                                            <option value="" ${pet.getPetType() == null ? "selected" : ""}>Choose Pet Type</option>
                                                                            <option value="Dog" ${pet.getPetType() == "Dog" ? "selected" : ""}>Dog</option>
                                                                            <option value="Cat" ${pet.getPetType() == "Cat" ? "selected" : ""}>Cat</option>
                                                                            <option value="Other" ${pet.getPetType() == "Other" ? "selected" : ""}>Other</option>
                                                                        </select>-->
                                    <input id="petType" type="text" placeholder="Pet Type" class="form-input" value="${pet.getPetType()}" />
                                </div>
                            </div>

                        </div>
                        <hr class="section-divider" />

                        <h2 class="section-title">Booking Information</h2>

                        <div class="form-container">
                            <div class="form-row">
                                <div class="form-field">
                                    <label for="serviceName" class="form-label" >Service Name</label>
                                    <div class="form-input-wrapper">
                                        <input id="serviceName" type="text" placeholder="Service Name" class="form-input" value="${ser.getServiceName()}" readonly/>
                                    </div>
                                </div>

                                <div class="form-field">
                                    <label for="startDate" class="form-label" >Service period</label>
                                    <div class="form-input-wrapper">
                                        <input id="startDate" type="text" placeholder="Service period" class="form-input" value="${date.toLocalTime()}  ${date.toLocalDate()}" readonly/>
                                    </div>
                                </div>
                                <div class="form-field">
                                    <label for="price" class="form-label" >Price</label>
                                    <div class="form-input-wrapper">
                                        <input id="price" type="text" placeholder="Price" class="form-input" value="${ser.getPrice()}" readonly/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="footer-button" >
                <button class="continue-button" onclick="windows.location.href = 'vnPay.jsp'">Confirm</button>
            </div>
        </section>

        <%@include file="includes/footer.jsp"%>

    </center>
    <script src="./js/sidebar.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>