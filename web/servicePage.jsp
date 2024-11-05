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
    <center>
        <%@include file="includes/header.jsp"%>
        <header class="pet-care-header">
            <h1>Ensuring your pets live their best lives</h1>
        </header>
        <section class="how-it-works">
            <div class="info-text">
                <h2 class="section-title">Quick and Easy Booking in <span style="color: rgba(20, 20, 20, 1)">3 Simple</span> Steps!</h2>
                <div class="steps-container">
                    <article class="step-card">
                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/485ea603669ce8df12ac4ac19ab487e3379a241278eebdc97dba7c2e2026c24c?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Select Service icon" class="step-image" />
                        <div class="step-content">
                            <h3 class="step-title">Select Service</h3>
                            <p class="step-description">Read verified reviews by pet owners like you and choose a sitter who's a great fit.</p>
                        </div>
                    </article>
                    <article class="step-card">
                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/42bd30e148f7ca90ae3be4b6b9a44a3ce77c32714537b0767583648a9cc9a47e?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Book Your Day icon" class="step-image" />
                        <div class="step-content">
                            <h3 class="step-title">Book Your Day</h3>
                            <p class="step-description">Read verified reviews by pet owners like you and choose a sitter who's a great fit.</p>
                        </div>
                    </article>
                    <article class="step-card">
                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/057dc8d37c7eec709d1dffe9fdd72373cb7534446b43eee8d1de013d7cd84fe9?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Have Relax icon" class="step-image" />
                        <div class="step-content">
                            <h3 class="step-title">Have Relax</h3>
                            <p class="step-description">Read verified reviews by pet owners like you and choose a sitter who's a great fit.</p>
                        </div>
                    </article>
                </div>
            </div>
        </section>
        <section class="visit-clinic-container">
            <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/b81ef3e3d1fdcfd6a5d76334a5ec9b4a9c21b3e723546a2a0471ba7805f90d8d?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="clinic-image" alt="Pet clinic interior or exterior view" />
            <div class="content-wrapper">
                <h2 class="section-title">Visit Our Shop</h2>
                <p class="service-description">
                    Book our pet care services for comprehensive support right from home. Our expert team offers a wide range of care, from grooming to specialized services, ensuring your pet's well-being. Easily schedule appointments, and let us take care of the rest, providing personalized attention and services that keep your pet happy and healthy.
                </p>
                <a href="serviceChoose.jsp" class="cta-button" role="button">
                    <span class="button-text">View All Services</span>
                    <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/2d9b7dddf1a8cf468241e0652ffea92738ed41870cc1d49d91b374d4cd492b56?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="button-icon" alt="" />
                </a>
            </div>
        </section>
        <%@include file="includes/footer.jsp"%>
    </center>
</body>
</html>

