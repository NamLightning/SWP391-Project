<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Management Customers</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/managecus.css">
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


                <div class="main-content">
                    <div class="customer-table">
                        <div class="header">
                            <h2 style="font-size: 20px;">All Customers</h2>
<!--                            <button class="vip-customer-btn" 
                                    onclick="window.location.href = '<c:url value="/admin/manageVIPCustomer.jsp"/>'">View VIP Customer</button>-->
                        </div>
                        <div class="search-sort-bar">
                            <input type="text" placeholder="Search customer..." class="search-input">
                            <select class="sort-select">
                                <option>Sort by Newest</option>
                                <option>Sort by Oldest</option>
                            </select>
                        </div>
                        <div class="customer-table-2" style="font-size: 13px;">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Customer Name</th>
                                        <th>Phone Number</th>
                                        <th>Email</th>
                                        <th>Address</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="p" items="${customer}">
                                        <c:url var="editLink" value="CustomerControl">
                                            <c:param name="pageSize" value="${pageSize}"></c:param>
                                            <c:param name="page" value="${currentPage}"></c:param>
                                            <c:param name="action" value="edit"></c:param>
                                            <c:param name="id" value="${p.getCustomerID()}"></c:param>
                                        </c:url>
                                        <c:url var="deleteLink" value="CustomerControl">
                                            <c:param name="pageSize" value="${pageSize}"></c:param>
                                            <c:param name="page" value="${currentPage}"></c:param>
                                            <c:param name="action" value="delete"></c:param>
                                            <c:param name="id" value="${p.getCustomerID()}"></c:param>
                                        </c:url>
                                        <tr>
                                            <td>${p.getFirstName()} ${p.getLastName()}</td>
                                            <td>${p.getPhoneNumber()}</td>
                                            <td>${p.getEmail()}</td>
                                            <td>${p.getAddress()}</td>
                                            <td><button class="view-btn" 
                                                        onclick="window.location.href = '<c:url value="/admin/userDetail.jsp"/>'">View</button>
                                            </td>
                                        </tr> 
                                    </c:forEach>

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


        <script src="${pageContext.request.contextPath}/js/sidebar.js"></script>


        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    </body>

</html>