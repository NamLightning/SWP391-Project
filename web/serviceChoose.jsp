<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PetHub</title>
        <link rel="stylesheet" href="css/serviceindex.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/footer.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@include file="includes/header.jsp"%>
        <div class="service-choose-container">
            <div class="left-sidebar" style="background-color: #ffffff; width:312px; height: 1150px;"></div>
            <div class="service-choose-content" style="flex: 1;width: 1296px; height: 1150px">
                <div class="services-section">
                    <h1>Our Services</h1>
                    <div class="service-menu">
                        <div class="service-grid">
                            <a href="serviceDetails.jsp" style="text-decoration: none; color: #000;display: block;">
                                <article class="service-card">
                                    <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/acbaf54429bf93bf32eaad37ef4a8a26caf934e738e748dfc0c3bc4b8e8520d6?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Dog Full Grooming Service" class="service-image" />
                                    <div class="service-content">
                                        <h3>Dog Full Grooming</h3>
                                        <p>Removing loose hair and preventing tangles and mats in your pet's coat</p>
                                    </div>
                                </article>
                            </a>
                            <a href="serviceDetails.jsp" style="text-decoration: none; color: #000;display: block;">
                                <article class="service-card">
                                    <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/beaa573c087cfd7170fa22988d4feb75055cfbaa34629e091193888370abc28f?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Dog Haircut and Trimming Service" class="service-image" />
                                    <div class="service-content">
                                        <h3>Dog Haircut/Trimming</h3>
                                        <p>Stylish haircuts or trims to maintain a neat and manageable fur length</p>
                                    </div>
                                </article>
                            </a>
                            <a href="serviceDetails.jsp" style="text-decoration: none; color: #000;display: block;">
                                <article class="service-card">
                                    <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/13a45de2e41f36780096288e65f410f782fa92121ddce7063090447cada2cc21?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Dog Wash and Blow Dry Service" class="service-image" />
                                    <div class="service-content">
                                        <h3>Dog Wash & Blow Dry</h3>
                                        <p>Cleaning and shampooing your pet to keep their coat fresh.</p>
                                    </div>
                                </article>
                            </a>
                            <a href="serviceDetails.jsp" style="text-decoration: none; color: #000;display: block;">
                                <article class="service-card">
                                    <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/a4427ad02515b4315303b3888c3a6b975d5b36556c9f3cb65b0bf2e7c769a6d5?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Cat Nail Trimming Service" class="service-image" />
                                    <div class="service-content">
                                        <h3>Cat Nail Trimming</h3>
                                        <p>Keeping your pet's nails at an appropriate length to prevent discomfort and overgrowth</p>
                                    </div>
                                </article>
                            </a>
                            <a href="serviceDetails.jsp" style="text-decoration: none; color: #000;display: block;">
                                <article class="service-card">
                                    <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/acbaf54429bf93bf32eaad37ef4a8a26caf934e738e748dfc0c3bc4b8e8520d6?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Cat Full Grooming Service" class="service-image" />
                                    <div class="service-content">
                                        <h3>Cat Full Grooming</h3>
                                        <p>Removing loose hair and preventing tangles and mats in your pet's coat</p>
                                    </div>
                                </article>
                            </a>
                            <a href="serviceDetails.jsp" style="text-decoration: none; color: #000;display: block;">
                                <article class="service-card">
                                    <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/beaa573c087cfd7170fa22988d4feb75055cfbaa34629e091193888370abc28f?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Cat Haircut and Trimming Service" class="service-image" />
                                    <div class="service-content">
                                        <h3>Cat Haircut/Trimming</h3>
                                        <p>Stylish haircuts or trims to maintain a neat and manageable fur length</p>
                                    </div>
                                </article>
                            </a>
                            <a href="serviceDetails.jsp" style="text-decoration: none; color: #000;display: block;">
                                <article class="service-card">
                                    <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/13a45de2e41f36780096288e65f410f782fa92121ddce7063090447cada2cc21?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Cat Wash and Blow Dry Service" class="service-image" />
                                    <div class="service-content">
                                        <h3>Cat Wash & Blow Dry</h3>
                                        <p>Cleaning and shampooing your pet to keep their coat fresh and free of dirt and odor.</p>
                                    </div>
                                </article>
                            </a>
                            <a href="serviceDetails.jsp" style="text-decoration: none; color: #000;display: block;">
                                <article class="service-card">
                                    <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/a4427ad02515b4315303b3888c3a6b975d5b36556c9f3cb65b0bf2e7c769a6d5?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Nail Trimming Service" class="service-image" />
                                    <div class="service-content">
                                        <h3>Nail Trimming</h3>
                                        <p>Keeping your pet's nails at an appropriate length to prevent discomfort and overgrowth</p>
                                    </div>
                                </article>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="right-sidebar" style="background-color: #ffffff; width:312px; height: 1150px"></div>
        </div>
        <%@include file="includes/footer.jsp"%>
    </body>
</html>