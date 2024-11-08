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
                    <div class="user hover-item" id="hoverItem">
                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/9d9994c0a1b936c2427317594bc441b8fcc98af8133e59027568749dfd2cb1ae?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" alt="User avatar" class="user-avatar" />
                    </div>
                    <%@include file="adminMenu.jsp"%>
                </div>


                <div class="main-content">
                    <div class="customer-table">
                        <div class="header">
                            <h2 style="font-size: 20px;">All Customers</h2>
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
                            <c:if test="${currentPage > 1}">
                                <!--<a href="CustomerControl?page=1&size=${pageSize}" class="page-number prev-button">First</a>-->
                            </c:if>

                            <!-- Previous page link -->
                            <c:if test="${currentPage > 1}">
                                <a href="CustomerControl?page=${currentPage - 1}&size=${pageSize}" class="pagination-item"><</a>
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
                                        <a href="CustomerControl?page=${page}&size=${pageSize}" class="pagination-item">${page}</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>

                            <!-- Ellipsis for overflow pages before and after the 5 displayed pages -->

                            <c:if test="${currentPage < totalPages - 2}">
                                <span class="ellipsis">...</span>
                            </c:if>

                            <!-- Next page link -->
                            <c:if test="${currentPage < totalPages}">
                                <a href="CustomerControl?page=${currentPage + 1}&size=${pageSize}" class="pagination-item">></a>
                            </c:if>

                            <!-- Last page link -->
                            <c:if test="${currentPage < totalPages}">
        <!--                        <a href="CustomerControl?page=${totalPages}&size=${pageSize}" class="page-number next-button">Last</a>-->
                            </c:if>
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