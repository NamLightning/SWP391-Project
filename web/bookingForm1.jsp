<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PetHub</title>
        <link rel="stylesheet" href="css/service.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/footer.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    </head>
    <body>
        <%@include file="includes/header.jsp" %>
        <div class="container">
            <section class="personal-info-container">
                <h2 class="section-title">Personal Information</h2>
                <form>
                    <div class="form-row">
                        <div class="form-field">
                            <label for="firstName" class="field-label">First Name</label>
                            <input type="text" id="firstName" class="field-input" value="Budi" aria-label="First Name">
                        </div>
                        <div class="form-field">
                            <label for="lastName" class="field-label">Last name</label>
                            <input type="text" id="lastName" class="field-input" value="Similikiwaw" aria-label="Last name">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-field">
                            <label for="phoneNumber" class="field-label">Phone Number</label>
                            <input type="tel" id="phoneNumber" class="field-input" value="1234-5678-9112" aria-label="Phone Number">
                        </div>
                        <div class="form-field">
                            <label for="email" class="field-label">Email</label>
                            <input type="email" id="email" class="field-input" value="similikiwaw@mail.com" aria-label="Email">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-field address-field">
                            <label for="address" class="field-label">Address</label>
                            <input type="text" id="address" class="field-input" value="Nanas Rd Bikini Bottom" aria-label="Address">
                        </div>
                    </div>
                </form>
            </section>
        </div>
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
