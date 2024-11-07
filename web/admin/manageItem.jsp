<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="Utils.Reuseable, Dao.CategoriesDAO, java.util.ArrayList, Model.Item, Model.Categories"%>
<jsp:useBean id="categories" class="Dao.CategoriesDAO" scope="page"/>
<jsp:useBean id="reuse" class="Utils.Reuseable" scope="page"/>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Responsive Admin Dashboard</title>
        <link rel="stylesheet" href="<c:url value="/css/manageitem.css"/>">
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
                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/9d9994c0a1b936c2427317594bc441b8fcc98af8133e59027568749dfd2cb1ae?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" alt="User avatar" class="user-avatar" />
                    </div>
                </div>
                <div class="main-content">
                    <div class="item-table">
                        <div class="header">
                            <h2 style="font-size: 20px; margin-right: 30%;">All Products</h2>
                            <div class="button" style="gap:20px;">
                                <button class="view-ie-product-btn" 
                                        onclick="window.location.href = '<c:url value="/admin/manageIEItem.jsp"/>'">View Import/Export Products</button>
                                <button class="new-product-btn" 
                                        onclick="window.location.href = '<c:url value="/admin/addItem.jsp"/>'">Create New Product</button>
                            </div>
                        </div>
<!--                        <div class="search-sort-bar">
                            <input type="text" placeholder="Search product..." class="search-input">
                            <select class="sort-select">
                                <option>Sort by Newest</option>
                                <option>Sort by Oldest</option>
                            </select>
                        </div>-->
                        <div class="item-table" style="font-size: 13px;">
                            <table>
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Product Name</th>
                                        <th>Category</th>
                                        <th>Price</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="p" items="${products}">
                                        <c:url var="editLink" value="ItemControl">
                                            <c:param name="pageSize" value="${pageSize}"></c:param>
                                            <c:param name="page" value="${currentPage}"></c:param>
                                            <c:param name="action" value="edit"></c:param>
                                            <c:param name="id" value="${p.getProductID()}"></c:param>
                                        </c:url>
                                        <c:url var="deleteLink" value="ItemControl">
                                            <c:param name="pageSize" value="${pageSize}"></c:param>
                                            <c:param name="page" value="${currentPage}"></c:param>
                                            <c:param name="action" value="delete"></c:param>
                                            <c:param name="id" value="${p.getProductID()}"></c:param>
                                        </c:url>
                                        <tr>
                                            <td>${p.getProductID()}</td>
                                            <td>${p.getProductName()}</td>
                                            <c:forEach items="${categoryList}" var="c">
                                                <c:if test="${c.getCategoryID() == p.getCategoryID()}">
                                                    <td>${c.getCategoryName()}</td>
                                                </c:if>
                                            </c:forEach>
                                            <td>${p.getPrice()}₫</td>
                                            <c:if test="${p.getStockQuantity() > 0}">
                                                <td><span class="status-instock active">Available</span></td>
                                            </c:if>
                                            <c:if test="${p.getStockQuantity() == 0}">
                                                <td><span class="status-instock active">Unavailable</span></td>
                                            </c:if>
                                            <!--<a href="${editLink}">Edit</a>-->
                                            <td><button class="update" onclick="location.href = '${editLink}'">Update</button></td>
                                            <td><button class="delete" onclick="location.href = '${deleteLink}'">Delete</button></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="pagination">
                            <c:if test="${currentPage > 1}">
                                <!--<a href="ItemControl?page=1&size=${pageSize}" class="page-number prev-button">First</a>-->
                            </c:if>

                            <!-- Previous page link -->
                            <c:if test="${currentPage > 1}">
                                <a href="ItemControl?page=${currentPage - 1}&size=${pageSize}" class="pagination-item"><</a>
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
                                        <a href="ItemControl?page=${page}&size=${pageSize}" class="pagination-item">${page}</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>

                            <!-- Ellipsis for overflow pages before and after the 5 displayed pages -->

                            <c:if test="${currentPage < totalPages - 2}">
                                <span class="ellipsis">...</span>
                            </c:if>

                            <!-- Next page link -->
                            <c:if test="${currentPage < totalPages}">
                                <a href="ItemControl?page=${currentPage + 1}&size=${pageSize}" class="pagination-item">></a>
                            </c:if>

                            <!-- Last page link -->
                            <c:if test="${currentPage < totalPages}">
        <!--                        <a href="ItemControl?page=${totalPages}&size=${pageSize}" class="page-number next-button">Last</a>-->
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

