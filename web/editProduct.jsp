<%-- 
    Document   : editProduct
    Created on : Sep 12, 2024, 8:42:53 PM
    Author     : Administrator
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
        <title>Edit Product</title>
    </head>
    <body>
        <div>
            <form action="ProductControl" method="POST" enctype="multipart/form-data">
                <div>
                    <input id="productID" name="productID" type="hidden" value="${product.getProductID()}"><br>
                    <input id="recordsPerPage" name="recordsPerPage" type="hidden" value="${recordsPerPage}"><br>
                    <input id="currentPage" name="currentPage" type="hidden" value="${currentPage}"><br>
                    <div>
                        <img src="${reuse.loadImage(product.getAvatar_img())}" alt="..."><br>
                        <label>Upload Items Image:</label>
                        <input type="file" name="image" id="image" accept="image/*"><br>
                        <img id="preview" src="#" alt="Image Preview">
                    </div>
                    <div>
                        <p>Name: <input id="productName" name="productName" type="text" value="${product.getProductName()}"></p><br>
                        <p>Description: <input id="productDesc" name="productDesc" type="text" value="${product.getDescription()}"></p><br>
                        <p>Price: <input id="price" name="price" type="text" value="${product.getPrice()}"></p><br>
                        <p>Stock: <input id="stock" name="stock" type="text" value="${product.getStockQuantity()}"></p><br>
                        &nbsp;&nbsp;&nbsp;<select id="categories" name="categories">
                            <c:forEach var="category" items="${categoryList}">
                                <option value="${category.getCategoryID()}">${category.getCategoryName()}</option>
                            </c:forEach>
                        </select><br><br>
                    </div>
                    <input name="submit" type="submit" value="Edit" class="btn btn-primary float-end" style="margin:  10px;margin-top: 0px">
                </div>
            </form>
        </div>
        <script src="preview.js"></script>
    </body>
</html>
