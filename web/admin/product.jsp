<%-- 
    Document   : petHygieneProduct
    Created on : Sep 5, 2024, 6:04:13 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="Utils.Reuseable, Dao.CategoriesDAO, java.util.ArrayList, Model.Item"%>
<jsp:useBean id="categories" class="Dao.CategoriesDAO" scope="page"/>
<jsp:useBean id="reuse" class="Utils.Reuseable" scope="page"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Pet Product</title>
        <script src="js/chat.js"></script>
        <style>
            .pagination {
                display: flex;
                align-items: center;
                list-style-type: none;
                padding: 0;
                gap: 5px;
            }

            .pagination .page-number, .pagination a, .pagination strong {
                display: inline-block;
                padding: 8px 12px;
                text-decoration: none;
                color: #333;
                border-radius: 5px;
                background-color: #f2f2f2;
            }

            .pagination .page-number:hover,
            .pagination a:hover {
                background-color: #ddd;
            }

            .pagination .active-page, .pagination strong {
                font-weight: bold;
                color: #fff;
                background-color: #007bff;
            }

            .pagination .next-button, .pagination .prev-button {
                display: flex;
                align-items: center;
                padding: 8px 12px;
                color: #007bff;
                text-decoration: none;
            }

            .pagination .next-button:hover, .pagination .prev-button:hover {
                text-decoration: underline;
            }

            .pagination .ellipsis {
                padding: 8px 12px;
                color: #666;
            }
        </style>
    </head>
    <body>
        <main class="m-3">
            <div class="row col-md-6">
                <c:forEach var="p" items="${products}">
                    <c:url var="editLink" value="ProductControl">
                        <c:param name="pageSize" value="${pageSize}"></c:param>
                        <c:param name="page" value="${currentPage}"></c:param>
                        <c:param name="action" value="edit"></c:param>
                        <c:param name="id" value="${p.getProductID()}"></c:param>
                    </c:url>
                    <div>
                        <div>
                            <img src="${reuse.loadImage(p.getAvatar_img())}" alt="..." style="width:100px; height: 100px;">
                        </div>
                        <div>
                            <p>Name: ${p.getProductName()}</p>
                            <p>Description: ${p.getDescription()}</p>
                            <p>Price: ${p.getPrice()}</p>
                            <p>Stock: ${p.getStockQuantity()}</p>
                            <p>Category: ${categories.checkExist(p.getCategoryID()).getCategoryName()}</p>
                        </div>
    <!--                    <a href="${editLink}">Edit</a>-->
                        <button onclick="location.href = '${editLink}'">Edit</button>
                    </div>
                </c:forEach>
            </div>
            <nav aria-label="Navigation for products">
                <ul class="pagination">
                    <!-- First page link -->
                    <c:if test="${currentPage > 1}">
                        <!--<a href="ProductControl?page=1&size=${pageSize}" class="page-number prev-button">First</a>-->
                    </c:if>

                    <!-- Previous page link -->
                    <c:if test="${currentPage > 1}">
                        <a href="ProductControl?page=${currentPage - 1}&size=${pageSize}" class="page-number prev-button"><</a>
                    </c:if>
                    <c:if test="${currentPage > totalPages - currentPage}">
                        <span class="ellipsis">...</span>
                    </c:if>

                    <!-- Display 5 page links with ellipsis for overflow pages -->
                    <c:forEach begin="${startPage}" end="${endPage}" var="page">
                        <c:choose>
                            <c:when test="${page == currentPage}">
                                <strong class="page-number active-page">${page}</strong>
                            </c:when>
                            <c:otherwise>
                                <a href="ProductControl?page=${page}&size=${pageSize}" class="page-number">${page}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <!-- Ellipsis for overflow pages before and after the 5 displayed pages -->
                    <c:if test="${currentPage > 3}">
                        <!--<span class="ellipsis">...</span>-->
                    </c:if>
                    <c:if test="${currentPage < totalPages - 2}">
                        <span class="ellipsis">...</span>
                    </c:if>

                    <!-- Next page link -->
                    <c:if test="${currentPage < totalPages}">
                        <a href="ProductControl?page=${currentPage + 1}&size=${pageSize}" class="page-number next-button">></a>
                    </c:if>

                    <!-- Last page link -->
                    <c:if test="${currentPage < totalPages}">
<!--                        <a href="ProductControl?page=${totalPages}&size=${pageSize}" class="page-number next-button">Last</a>-->
                    </c:if>
                </ul>
            </nav>
        </main>
    </body>
</html>
