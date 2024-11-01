<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PetHub</title>
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/status.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    </head>
    <body>
    <center>
        <%@include file="includes/header.jsp"%>
        <div class="main-details-content">
            <section class="success-message">
                <div class="content-wrapper">
                    <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/0fd61b114242a7deccfeb98e298d720c506fdb1af3020ab5e6c49c423f07d5e9?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Success checkmark icon" class="success-icon" />
                    <div class="text-container">
                        <h2 class="success-title">Your order is successfully placed</h2>
                        <p class="success-description">After finishing placed order please access to order history to review or you can go back to homepage and continue using our services</p>
                    </div>
                </div>
                <div class="button-container">
                    <a href="#" class="back-home-button" role="button">
                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/9e166952a2f223fdc38840b408e486c8b90cbe833b1939775887c14f8e228872?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="button-icon" />
                        <span class="button-label">Back to Home</span>
                    </a>
                    <a href="#" class="view-order-button" role="button">
                        <span class="button-label">View History Order</span>
                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/0bfd7ef916026eff87b43b560d5575f85e58e7b5c3fa9b0f3710711f43901ee6?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="button-icon" />
                    </a>
                </div>
            </section>
        </div>
        <%@include file="includes/footer.jsp"%>
    </center>
</body>
</html>
