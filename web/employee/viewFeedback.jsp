<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Support</title>  
        <link rel="stylesheet" href="<c:url value="/css/header.css"/>">
        <link rel="stylesheet" href="<c:url value="/css/footer.css"/>">
        <link rel="stylesheet" href="<c:url value="/css/feedback.css"/>">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    </head>
    <body>
        <%@include file="../includes/header.jsp"%>
    <center>
        <div class="main-container">
            <div class="customer-support">
                <div class="support-list">
                    <p class="page-indicator">Page # of 50</p>
                    <header class="list-header">
                        <h2 class="header-title">Customer support</h2>
                        <p class="header-time">Time</p>
                    </header>
                    <div class="list-row">
                        <span class="row-number">1</span>
                        <span class="row-item">Name</span>
                        <span class="row-item">Email</span>
                        <span class="row-item">Problem</span>
                        <span class="row-day">Monday</span>
                    </div>
                    <div class="list-row">
                        <span class="row-number">2</span>
                        <span class="row-item">Name</span>
                        <span class="row-item">Email</span>
                        <span class="row-item">Problem</span>
                        <span class="row-day">Tuesday</span>
                    </div>
                    <div class="list-row">
                        <span class="row-number">3</span>
                        <span class="row-item">Name</span>
                        <span class="row-item">Email</span>
                        <span class="row-item">Problem</span>
                        <span class="row-day">Wednesday</span>
                    </div>
                    <div class="list-row">
                        <span class="row-number">4</span>
                        <span class="row-item">Name</span>
                        <span class="row-item">Email</span>
                        <span class="row-item">Problem</span>
                        <span class="row-day">Thursday</span>
                    </div>
                    <div class="list-row">
                        <span class="row-number">5</span>
                        <span class="row-item">Name</span>
                        <span class="row-item">Email</span>
                        <span class="row-item">Problem</span>
                        <span class="row-day">Friday</span>
                    </div>
                    <div class="list-row">
                        <span class="row-number">6</span>
                        <span class="row-item">Name</span>
                        <span class="row-item">Email</span>
                        <span class="row-item">Problem</span>
                        <span class="row-day">Saturday</span>
                    </div>
                </div>
            </div>
            <nav class="pagination" aria-label="Page navigation">
                <div class="page-buttons">
                    <button class="page-button" aria-label="Page 1">1</button>
                    <button class="page-button-outline" aria-label="Page 2">2</button>
                </div>
                <button class="next-button">
                    <span class="next-button-content">
                        <span class="next-text">Next</span>
                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/06dc0abcf044184e7c1b5e4e5e84820993aea1ea2c43102c2c81557da8ac1ab0?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="next-icon" alt="" aria-hidden="true" />
                    </span>
                </button>
            </nav>
            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/60f6b4c95efb5826ff579ca7eb1d9e44e49d80ce3e2c06274b3b60e452e506b1?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="logo" alt="Company logo" />
        </div>
    </center>
    <%@include file="../includes/footer.jsp"%>
</body>
</html>