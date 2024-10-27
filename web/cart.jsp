<%-- 
    Document   : cartItem
    Created on : Sep 5, 2024, 10:01:15 PM
    Author     : Administrator
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap/bootstrap.css">
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/items.css">
        <title>Cart Page</title>
    </head>
    <body>
        <%@include file="includes/header.jsp" %>
        <c:if test="${empty us}">
            Please Login 
            <button type="button" onclick="window.location.href = 'login.jsp'">Login</button>
        </c:if>
        <c:if test="${not empty us}">
            <c:set var="totalPrice" value="0" scope="page"/>
            <%            CartItemsDAO cartItemsDAO = new CartItemsDAO();
                CustomerDAO customerDAO = new CustomerDAO();
                String username = (String) session.getAttribute("us");
                Customer c = customerDAO.findCustomerByUsername(username);
                ArrayList<CartItems> cartList = cartItemsDAO.getAllCartItems(c.getCustomerID());
                pageContext.setAttribute("carts", cartList);
            %>
            <h3>Shopping Cart (${carts.size()})</h3>
            <c:forEach var="c" items="${carts}">
                <c:url var="deleteLink" value="CartControl">
                    <c:param name="action" value="deleteCart"></c:param>
                    <c:param name="cid" value="${c.getCartItemID()}"></c:param>
                </c:url>
                <c:url var="cartLink" value="CartControl">
                    <c:param name="action" value="addCart"></c:param>
                    <c:param name="id" value="${c.getProductID()}"></c:param>
                </c:url>
                <c:url var="removeLink" value="CartControl">
                    <c:param name="action" value="remove"></c:param>
                    <c:param name="cid" value="${c.getCartItemID()}"></c:param>
                </c:url>
                <img src="${reuse.loadImage(pDAO.checkExist(c.getProductID()).getAvatar_img())}" alt="..." class="product-image">
                <div class="item">
                    <button class="quantity-button" onclick="window.location.href = '${removeLink}'"><i class="fas fa-minus"></i></button>
                        ${c.getQuantity()}
                    <button class="quantity-button" onclick="window.location.href = '${cartLink}'"><i class="fas fa-plus"></i></button>
                    <p>${pDAO.checkExist(c.getProductID()).getProductName()}</p>
                    <p>${c.getQuantity()} x ${pDAO.checkExist(c.getProductID()).getPrice()}₫</p>
                    <button class="remove-button" type="button" onclick="window.location.href = '${deleteLink}'"><i class="fas fa-times"></i></button>
                </div>
                <c:set var="itemTotal" value="${pDAO.checkExist(c.getProductID()).getPrice() * c.getQuantity()}" />
                <c:set var="totalPrice" value="${totalPrice + itemTotal}" />
            </c:forEach>
            <div class="subtotal">
                <p>Sub-Total: ${totalPrice}₫</p>
            </div>
        </c:if>
    </body>
</html>
