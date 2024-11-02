<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PetHub</title>  
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/orderHistory.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    </head>
    <body>
    <center>
        <%@include file="includes/header.jsp"%>
        <div class="main-container">
            <%@include file="includes/userMenu.jsp"%>
            <div class="order-container">
                <header class="content-header">
                    <h1 class="header-title">History Order</h1>
                    <div class="header-subtitles">
                        <span class="subtitle-item">Order ID</span>
                        <span class="subtitle-item">Status</span>
                        <span class="subtitle-item">Date</span>
                        <span class="subtitle-item">Total</span>
                        <span class="subtitle-item" style="text-align: left;">Action</span>
                    </div>
                </header>

                <ul class="order-list">
                    <li class="order-item">
                        <span class="order-id">#96459761</span>
                        <span class="order-status status-in-progress">IN PROGRESS</span>
                        <span class="order-date">Dec 30, 2024 07:52</span>
                        <span class="order-total"><strong>199.000₫</strong></span>
                        <a href="orderHistoryDetails.jsp" style="text-decoration: none;">
                            <span class="action-text">View Details</span>
                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/0ad50be073905c57d0749631b873d3429c12bff671d3fc1d5f75ef02020a6671?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="action-icon" />
                        </a>
                    </li>
                    <li class="order-item">
                        <span class="order-id">#71667167</span>
                        <span class="order-status status-completed">COMPLETED</span>
                        <span class="order-date">Dec 7, 2024 23:26</span>
                        <span class="order-total"><strong>199.000₫</strong></span>
                        <a href="orderHistoryDetails.jsp" style="text-decoration: none;">
                            <span class="action-text">View Details</span>
                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/0ad50be073905c57d0749631b873d3429c12bff671d3fc1d5f75ef02020a6671?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="action-icon" />
                        </a>
                    </li>
                    <li class="order-item">
                        <span class="order-id">#95214362</span>
                        <span class="order-status status-canceled">CANCELED</span>
                        <span class="order-date">Dec 7, 2024 23:26</span>
                        <span class="order-total"><strong>199.000₫</strong></span>
                        <a href="orderHistoryDetails.jsp" style="text-decoration: none;">
                            <span class="action-text">View Details</span>
                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/0ad50be073905c57d0749631b873d3429c12bff671d3fc1d5f75ef02020a6671?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="action-icon" />
                        </a>
                    </li>
                    <li class="order-item">
                        <span class="order-id">#71667167</span>
                        <span class="order-status status-completed">COMPLETED</span>
                        <span class="order-date">Feb 2, 2024 19:28</span>
                        <span class="order-total"><strong>199.000₫</strong></span>
                        <a href="orderHistoryDetails.jsp" style="text-decoration: none;">
                            <span class="action-text">View Details</span>
                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/0ad50be073905c57d0749631b873d3429c12bff671d3fc1d5f75ef02020a6671?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="action-icon" />
                        </a>
                    </li>
                    <li class="order-item">
                        <span class="order-id">#51746385</span>
                        <span class="order-status status-completed">COMPLETED</span>
                        <span class="order-date">Dec 30, 2024 07:52</span>
                        <span class="order-total"><strong>199.000₫</strong></span>
                        <a href="orderHistoryDetails.jsp" style="text-decoration: none;">
                            <span class="action-text">View Details</span>
                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/0ad50be073905c57d0749631b873d3429c12bff671d3fc1d5f75ef02020a6671?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="action-icon" />
                        </a>
                    </li>
                    <li class="order-item">
                        <span class="order-id">#51746385</span>
                        <span class="order-status status-canceled">CANCELED</span>
                        <span class="order-date">Dec 4, 2024 21:42</span>
                        <span class="order-total"><strong>199.000₫</strong></span>
                        <a href="orderHistoryDetails.jsp" style="text-decoration: none;">
                            <span class="action-text">View Details</span>
                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/0ad50be073905c57d0749631b873d3429c12bff671d3fc1d5f75ef02020a6671?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="action-icon" />
                        </a>
                    </li>
                    <li class="order-item">
                        <span class="order-id">#673971743</span>
                        <span class="order-status status-completed">COMPLETED</span>
                        <span class="order-date">Feb 2, 2024 19:28</span>
                        <span class="order-total"><strong>199.000₫</strong></span>
                        <a href="orderHistoryDetails.jsp" style="text-decoration: none;">
                            <span class="action-text">View Details</span>
                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/0ad50be073905c57d0749631b873d3429c12bff671d3fc1d5f75ef02020a6671?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="action-icon" />
                        </a>
                    </li>
                    <li class="order-item">
                        <span class="order-id">#673971743</span>
                        <span class="order-status status-completed">COMPLETED</span>
                        <span class="order-date">Mar 20, 2024 23:14</span>
                        <span class="order-total"><strong>199.000₫</strong></span>
                        <a href="orderHistoryDetails.jsp" style="text-decoration: none;">
                            <span class="action-text">View Details</span>
                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/0ad50be073905c57d0749631b873d3429c12bff671d3fc1d5f75ef02020a6671?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="action-icon" />
                        </a>
                    </li>
                    <li class="order-item">
                        <span class="order-id">#673971743</span>
                        <span class="order-status status-completed">COMPLETED</span>
                        <span class="order-date">Dec 4, 2024 21:42</span>
                        <span class="order-total"><strong>199.000₫</strong></span>
                        <a href="orderHistoryDetails.jsp" style="text-decoration: none;">
                            <span class="action-text">View Details</span>
                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/0ad50be073905c57d0749631b873d3429c12bff671d3fc1d5f75ef02020a6671?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="action-icon" />
                        </a>
                    </li>
                    <li class="order-item">
                        <span class="order-id">#673971743</span>
                        <span class="order-status status-completed">COMPLETED</span>
                        <span class="order-date">Dec 30, 2024 07:52</span>
                        <span class="order-total"><strong>199.000₫</strong></span>
                        <a href="orderHistoryDetails.jsp" style="text-decoration: none;">
                            <span class="action-text">View Details</span>
                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/0ad50be073905c57d0749631b873d3429c12bff671d3fc1d5f75ef02020a6671?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="action-icon" />
                        </a>
                    </li>
                </ul>
                <nav class="pagination" aria-label="Order history pagination">
                    <button class="pagination-button" aria-label="Previous page">
                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/5e2a24ae19e8492152b40c2e3dec5f3cabf8b4c55afabeb98ae121858c01c92f?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="pagination-icon" />
                    </button>
                    <div class="pagination-pages">
                        <button class="page-number" aria-current="page">01</button>
                        <button class="page-number-inactive">02</button>
                        <button class="page-number-inactive">03</button>
                        <button class="page-number-inactive">04</button>
                        <button class="page-number-inactive">05</button>
                        <button class="page-number-inactive">06</button>
                    </div>
                    <button class="pagination-button" aria-label="Next page">
                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/7c66705ee32d0128e3dc42ac2a5d79fa7d6ef7bc8ae30b5f5751e1a0a76e959a?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="pagination-icon" />
                    </button>
                </nav>
            </div>
        </div>
    </center>
</body>
</html>
