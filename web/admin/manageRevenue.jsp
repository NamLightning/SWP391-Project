<%@page import="java.util.List"%>
<%@page import="Model.Revenue"%>
<%@page import="Model.RevenueReport"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<%@page import="Dao.RevenueReportDAO" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Responsive Admin Dashboard</title>
        <link rel="stylesheet" href="<c:url value="/css/managerevenue.css"/>">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>

    <body>
        <div class="container">
            <%@include file="../includes/sidebar.jsp"%>
            <div class="main">
                <div class="topbar">
                    <div class="toggle">
                        <ion-icon name="menu-outline"></ion-icon>
                    </div>
                    <div class="user hover-item" id="hoverItem">
                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/9d9994c0a1b936c2427317594bc441b8fcc98af8133e59027568749dfd2cb1ae?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" alt="User avatar" class="user-avatar" />
                    </div>
                    <%@include file="adminMenu.jsp"%>
                </div>
                <div>
                    <h1>Revenue Reports</h1>
                    <h4>Income Statistic</h4>
                </div>
                <div class="main-content">
                    <div class="revenue-table">
                        <div class="header">
                            <h2 style="font-size: 20px; margin-right: 30%;">Income Statement</h2>
                        </div>
                        <div class="bg-all-university" >
                            <div class="div">
                                <div class="div-2">
                                    <div class="revenue">Revenue</div>
                                    <div class="name">Name</div>
                                    <div class="sales-revenue">Sales Revenue</div>
                                    <div class="service-revenue">Service Revenue</div>
                                    <div class="interest-revenue">Interest Revenue</div>
                                    <div class="gain-of-sales-of-assets">Gain of Sales of Assets</div>
                                </div>
                                <div class="div-3">
                                    <div class="div-4">
                                        <div class="currency">Currency</div>
                                        <div class="vnd">VNĐ</div>
                                        <div class="vnd">VNĐ</div>
                                        <div class="vnd">VNĐ</div>
                                        <div class="vnd">VNĐ</div>
                                    </div>
                                    <div class="div-5">
                                        <div class="amount">Amount</div>
                                        <div class="price">1.250.000</div>
                                        <div class="price">256.000</div>
                                        <div class="price">354.000</div>
                                        <div class="price">456.000</div>
                                    </div>
                                </div>
                            </div>
                            <div class="div-6"></div>
                            <div class="div-7">
                                <div class="total-revenue">Total Revenue</div>
                                <div class="total">$2,316.00</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="../js/sidebar.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    </body>
</html>

