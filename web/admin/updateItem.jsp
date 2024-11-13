<%-- 
    Document   : updateItem
    Created on : Oct 27, 2024, 10:46:23 PM
    Author     : ASUS ZenBook
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="Dao.ItemDAO, Model.Item, Utils.Reuseable, Dao.CategoriesDAO, java.util.ArrayList"%>
<jsp:useBean id="categories" class="Dao.CategoriesDAO" scope="page"/>
<jsp:useBean id="reuse" class="Utils.Reuseable" scope="page"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/addItem.css">
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

                <div class="details">
                    <div class="recentOrders">
                        <div class="cardHeader">
                            <h2 style="font-size: 30px;">Update Item</h2>
                        </div>

                        <div class="search" style="justify-self: center;">

                            <form action="ProductControl" method="POST" enctype="multipart/form-data">
                                <div>
                                    <input id="productID" name="productID" type="hidden" value="${product.getProductID()}"><br>
                                    <input id="pageSize" name="pageSize" type="hidden" value="${pageSize}"><br>
                                    <input id="page" name="page" type="hidden" value="${currentPage}"><br>
                                    <c:if test="${not empty product.getAvatar_img()}">
                                        <div class="preview" id="preview" style="margin-bottom: 10px;">
                                            <img src="${reuse.loadImage(product.getAvatar_img())}" alt="..."><br>
                                        </div>
                                    </c:if>
                                    <label style="margin-bottom: 10px;">
                                        <label>Upload Items Image: </label>
                                        <label class="custom-upload-button" onclick="document.getElementById('image').click()">Choose picture</label>
                                        <input type="file" name="image" id="image" accept="image/*"
                                               onchange="showFileNameAndPreview()">
                                    </label>

                                    <!--<div class="preview" id="preview"></div>-->

                                    <label class="property">
                                        <p>Item name:</p>
                                        <input id="productName" name="productName" type="text" placeholder="Item Name" value="${product.getProductName()}">
                                    </label>

                                    <label class="property">
                                        <p>Item description:</p>
                                        <input id="productDesc" name="productDesc" type="text" placeholder="Item description" value="${product.getDescription()}">
                                    </label>

                                    <label class="property">
                                        <p>Item price:</p>
                                        <input id="price" name="price" type="text" placeholder="Item price" value="${product.getPrice()}">
                                    </label>

                                    <label class="property">
                                        <p>Item stock:</p>
                                        <input id="stock" name="stock" type="text" placeholder="Item stock" value="${product.getStockQuantity()}">
                                    </label>

                                    <label class="property">
                                        <p>Item category:</p>

                                        <select id="categories" name="categories">
                                            <c:forEach var="category" items="${categoryList}">
                                                <option value="${category.getCategoryID()}" <c:if test="${product.getCategoryID() == category.getCategoryID()}">selected</c:if>>${category.getCategoryName()}</option>
                                            </c:forEach>                                            
                                        </select>
                                    </label>
                                    <div style="justify-self: center;">
                                        <input name="submit" class="btn-add" type="submit" value="Edit">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/js/sidebar.js"></script>
    </body>
</html>
