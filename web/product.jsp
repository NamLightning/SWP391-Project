<%-- 
    Document   : petHygieneProduct
    Created on : Sep 5, 2024, 6:04:13 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="Dao.ProductsDAO, Model.Products, Utils.Reuseable, Dao.CategoriesDAO, java.util.ArrayList"%>
<jsp:useBean id="products" class="Dao.ProductsDAO" scope="page"/>
<jsp:useBean id="categories" class="Dao.CategoriesDAO" scope="page"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pet Product</title>
    </head>
    <body>
        <c:forEach var="p" items="${products.getAllProducts()}">
            <div>
            <img src="${Reuseable.loadImage(p.getAvatar_img())}" alt="...">
            </div>
            <div>
                <p>Name: ${p.getProductName()}</p>
                <p>Description ${p.getDescription()}</p>
                <p>Price: ${p.getPrice()}</p>
                <p>Stock: ${p.getStockQuantity()}</p>
                <p>Category: ${categories.checkExist(p.getCategoryID()).getCategoryName()}</p>
            </div>
        </c:forEach>
    </body>
</html>
