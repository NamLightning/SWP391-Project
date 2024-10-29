<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Management Customers</title>
        <link rel="stylesheet" href="../css/managecus.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>

    <body>
        <!--navbar-->
        <div class="container">
            <%@include file="../includes/sidebar.jsp"%>
            <!--home-->
            <div class="main">
                <div class="topbar">
                    <div class="toggle">
                        <ion-icon name="menu-outline"></ion-icon>
                    </div>
                    <div class="user">
                        <img src="#" alt="">
                    </div>

                </div>


                <div class="details">
                    <div class="recentOrders">
                        <div class="cardHeader">
                            <h2 style="margin-left: 10px; font-size: 30px;">Customer</h2>
                            <a onclick="window.location.href='manageVIPCustomer.jsp'" class="btn" style="margin-right: 10px">View VIP Customers</a>
                        </div>

                        <div class="search" style="justify-self: center;">
                            <label>
                                <input type="text" placeholder="search here">
                                <ion-icon name="search-outline"></ion-icon>
                            </label>

                            <label for="options"></label>
                            <select id="options" class="select-box">
                                <option value="1">Tùy chọn 1</option>
                                <option value="2">Tùy chọn 2</option>
                                <option value="3">Tùy chọn 3</option>
                            </select>
                        </div>

                        <table>
                            <thead>
                                <tr>
                                    <td>Customer Name</td>
                                    <td>Gender</td>
                                    <td>Phone number</td>
                                    <td>Email</td>
                                    <td>Address</td>
                                    <td>Status</td>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td>Star Refrigerator</td>
                                    <td>male</td>
                                    <td>089898989</td>
                                    <td>star@gmail.com</td>
                                    <td>ngu hanh son, da nang</td>
                                    <td><span class="status delivered">Active</span></td>
                                </tr>
                                <tr>
                                    <td>Star Refrigerator</td>
                                    <td>male</td>
                                    <td>089898989</td>
                                    <td>star@gmail.com</td>
                                    <td>ngu hanh son, da nang</td>
                                    <td><span class="status delivered">Active</span></td>
                                </tr>
                                <tr>
                                    <td>Star Refrigerator</td>
                                    <td>male</td>
                                    <td>089898989</td>
                                    <td>star@gmail.com</td>
                                    <td>ngu hanh son, da nang</td>
                                    <td><span class="status delivered">Active</span></td>
                                </tr>



                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>


        <script src="../js/sidebar.js"></script>


        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    </body>

</html>
