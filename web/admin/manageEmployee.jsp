<%@page import="java.util.List"%>
<%@page import="Model.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<%@page import="Dao.EmployeeDAO" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Responsive Admin Dashboard</title>
        <link rel="stylesheet" href="<c:url value="/css/manageemp.css"/>">
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
                        <img src="#" alt="User profile picture">
                    </div>
                </div>
                <div class="main-content">
                    <div class="employee-table">
                        <div class="header">
                            <h2 style="font-size: 20px;">All Employees</h2>
                            <button class="new-employee-btn" 
                                    onclick="window.location.href = '<c:url value="/admin/createEmployee.jsp"/>'">Create New Employee</button>
                        </div>
                        <div class="search-sort-bar">
                            <input type="text" placeholder="Search employee..." class="search-input">
                            <select class="sort-select">
                                <option>Sort by Newest</option>
                                <option>Sort by Oldest</option>
                            </select>
                        </div>
                        <div class="employee-table" style="font-size: 13px;">
                            <table>
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Gender</th>
                                        <th>Email</th>
                                        <th>Phone Number</th>
                                        <th>Position</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>#12345128</td>
                                        <td>Phan Anh Quan</td>
                                        <td>Male</td>
                                        <td>example@mail.com</td>
                                        <td>0934 567 890</td>
                                        <td>Cashier</td>
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
    </body>
    <script src="<c:url value="/js/sidebar.js"/>"></script>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</html>
