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
    </head>
    <body>
        <main class="m-3">
            <div class="row col-md-6">
                <c:forEach var="p" items="${products}">
                    <c:url var="editLink" value="ProductControl">
                        <c:param name="recordsPerPage" value="${recordsPerPage}"></c:param>
                        <c:param name="currentPage" value="${currentPage}"></c:param>
                        <c:param name="action" value="edit"></c:param>
                        <c:param name="id" value="${p.getProductID()}"></c:param>
                    </c:url>
                    <div>
                        <div>
                            <img src="${reuse.loadImage(p.getAvatar_img())}" alt="...">
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
                    <c:if test="${currentPage != 1}">
                        <li class="page-item"><a class="page-link" href="ProductControl?recordsPerPage=${recordsPerPage}&currentPage=${currentPage-1}">Previous</a>
                        </li>
                    </c:if>
                    <c:forEach begin="1" end="${noOfPages}" var="i">
                        <c:choose>
                            <c:when test="${currentPage eq i}">
                                <li class="page-item active"><a class="page-link">
                                        ${i} <span class="sr-only">(current)</span></a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="ProductControl?recordsPerPage=${recordsPerPage}&currentPage=${i}">${i}</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${currentPage lt noOfPages}">
                        <li class="page-item"><a class="page-link" href="ProductControl?recordsPerPage=${recordsPerPage}&currentPage=${currentPage+1}">Next</a>
                        </li>
                    </c:if>
                </ul>
            </nav>
            <%@include file="includes/customerChatBox.jsp" %>
        </main>
    </body>
</html>
