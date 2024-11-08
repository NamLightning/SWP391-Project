<%@page import="java.util.List"%>
<%@page import="Model.Pets"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<%@page import="Dao.PetsDAO" %>
<%@page import="Dao.CustomerDAO" %>
<%@page import="Dao.ServicesDAO" %>

<jsp:useBean id="serDAO" class="Dao.ServicesDAO" scope="page"/>
<jsp:useBean id="cusDAO" class="Dao.CustomerDAO" scope="page"/>
<jsp:useBean id="sbDAO" class="Dao.ServiceBookingDAO" scope="page"/>


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
                    <div class="user">
                        <img src="#" alt="User profile picture">
                    </div>
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
                                        <th>Pet Type</th>
                                        <th>Pet Owner</th>
                                        <th>Registered Service</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="p" items="${pets}">
                                        <c:url var="deleteLink" value="PetControl">
                                            <c:param name="pageSize" value="${pageSize}"></c:param>
                                            <c:param name="page" value="${currentPage}"></c:param>
                                            <c:param name="action" value="delete"></c:param>
                                            <c:param name="id" value="${p.getPetID()}"></c:param>   
                                        </c:url>
                                        <tr>
                                            <td>${p.getPetID()}</td>
                                            <td>${p.getPetName()}</td>
                                            <td>${p.getPetType()}</td>
                                            <td>${cusDAO.checkExist(p.getCustomerID()).getFirstName()} ${cusDAO.checkExist(p.getCustomerID()).getLastName()}</td>
                                            <td>${serDAO.checkExist(cusDAO.checkExist(p.getCustomerID()).getServiceID()).getServiceName()}</td>

                                            <td><button class="delete" onclick="location.href = '${deleteLink}'">Delete</button></td>

                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>
                        <div class="pagination">
                            <c:if test="${currentPage > 1}">
                                <!--<a href="ProductControl?page=1&size=${pageSize}" class="page-number prev-button">First</a>-->
                            </c:if>

                            <!-- Previous page link -->
                            <c:if test="${currentPage > 1}">
                                <a href="PetControl?page=${currentPage - 1}&size=${pageSize}" class="pagination-item"><</a>
                            </c:if>

                            <c:if test="${currentPage > totalPages - currentPage}">
                                <!--<span class="ellipsis">...</span>-->
                            </c:if>
                            <c:if test="${currentPage > 3}">
                                <span class="ellipsis">...</span>
                            </c:if>

                            <!-- Display 5 page links with ellipsis for overflow pages -->
                            <c:forEach begin="${startPage}" end="${endPage}" var="page">
                                <c:choose>
                                    <c:when test="${page == currentPage}">
                                        <strong class="pagination-item active-page">${page}</strong>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="PetControl?page=${page}&size=${pageSize}" class="pagination-item">${page}</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>

                            <!-- Ellipsis for overflow pages before and after the 5 displayed pages -->

                            <c:if test="${currentPage < totalPages - 2}">
                                <span class="ellipsis">...</span>
                            </c:if>

                            <!-- Next page link -->
                            <c:if test="${currentPage < totalPages}">
                                <a href="PetControl?page=${currentPage + 1}&size=${pageSize}" class="pagination-item">></a>
                            </c:if>

                            <!-- Last page link -->
                            <c:if test="${currentPage < totalPages}">
        <!--                        <a href="PetControl?page=${totalPages}&size=${pageSize}" class="page-number next-button">Last</a>-->
                            </c:if>
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

