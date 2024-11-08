<%@page import="java.util.List"%>
<%@page import="Model.Pets"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<%@page import="Dao.PetsDAO" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Responsive Admin Dashboard</title>
        <link rel="stylesheet" href="<c:url value="/css/managepet.css"/>">
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
                <div class="main-content">
                    <div class="pet-table">
                        <div class="header">
                            <h2 style="font-size: 20px; margin-right: 30%;">Registered Pets</h2>
                        </div>
                        <div class="pet-table" style="font-size: 13px;">
                            <table>
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Pet Name</th>
                                        <th>Pet Owner</th>
                                        <th>Pet Type</th>
                                        <th>Registered Service</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>#12345128</td>
                                        <td>Bill</td>
                                        <td>Nguyen Thanh Phat</td>
                                        <td>Dog</td>
                                        <td>Trim & Bathe Dog’s Fur</td>
                                        <td><button class="update" 
                                                    onclick="window.location.href = '<c:url value="/admin/updateItem.jsp"/>'">Update</button>
                                        <button class="delete">Delete</button></td>
                                    </tr>
                                    <tr>
                                        <td>#12345128</td>
                                        <td>Max</td>
                                        <td>Trinh Nguyen Hung</td>
                                        <td>Cat</td>
                                        <td>Trim & Bathe Cat’s Fur</td>
                                        <td><button class="update" 
                                                    onclick="window.location.href = '<c:url value="/admin/updateItem.jsp"/>'">Update</button>
                                        <button class="delete">Delete</button></td>
                                    </tr> 
                                    <tr>
                                        <td>#12345128</td>
                                        <td>Charles</td>
                                        <td>Nguyen Anton Tuan Kiet</td>
                                        <td>Dog</td>
                                        <td>Comprehensive Care For Dog</td>
                                        <td><button class="update" 
                                                    onclick="window.location.href = '<c:url value="/admin/updateItem.jsp"/>'">Update</button>
                                        <button class="delete">Delete</button></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="pagination">
                            <a href="#" class="pagination-item">&lt;</a>
                            <a href="#" class="pagination-item active">1</a>
                            <a href="#" class="pagination-item">2</a>
                            <a href="#" class="pagination-item">3</a>
                            <a href="#" class="pagination-item">4</a>
                            <span class="pagination-item">...</span>
                            <a href="#" class="pagination-item">&gt;</a>
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


