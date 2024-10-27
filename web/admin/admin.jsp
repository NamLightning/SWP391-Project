<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Responsive Admin Dashboard</title>
        <link rel="stylesheet" href="<c:url value="/css/admin.css"/>">
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
                    <div class="user">
                        <img src="#" alt="">
                    </div>
                </div>

                <div class="details ">
                    <div class="recentOrders ">
                        <div class="cardHeader" style="margin-left: 20px;">
                            <h2>Item Analytic Report</h2>
                            <a href="#" class="btn">View Statistic</a>
                        </div>
                    </div>


                    <div class="recentCustomers">
                        <div class="cardHeader" style="justify-content: center;">
                            <h2>Quick Stats</h2>
                        </div>
                        <div class="cardBox">
                            <div class="card">
                                <div>
                                    <div class="numbers">1,504</div>
                                    <div class="cardName">Daily Views</div>
                                </div>

                                <div class="iconBx">
                                    <ion-icon name="eye-outline"></ion-icon>
                                </div>
                            </div>
                            <div class="card">
                                <div>
                                    <div class="numbers">1,504</div>
                                    <div class="cardName">Orders</div>
                                </div>

                                <div class="iconBx">
                                    <ion-icon name="cart-outline"></ion-icon>
                                </div>
                            </div>

                            <div class="card">
                                <div>
                                    <div class="numbers">1,504</div>
                                    <div class="cardName">Comment</div>
                                </div>

                                <div class="iconBx">
                                    <ion-icon name="chatbubble-outline"></ion-icon>
                                </div>
                            </div>

                            <div class="card">
                                <div>
                                    <div class="numbers">1,504</div>
                                    <div class="cardName">Earning</div>
                                </div>

                                <div class="iconBx">
                                    <ion-icon name="card-outline"></ion-icon>
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
