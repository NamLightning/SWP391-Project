<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="Dao.ItemDAO, Model.Item, Utils.Reuseable, Dao.CategoriesDAO, java.util.ArrayList"%>
<jsp:useBean id="categories" class="Dao.CategoriesDAO" scope="page"/>
<jsp:useBean id="reuse" class="Utils.Reuseable" scope="page"/>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Product</title>
        <link rel="stylesheet" href="../css/addProduct.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>
    <body>
        <div>
            <div class="container">
                <%@include file="../includes/sidebar.jsp"%>

                <div class="main">
                    <div class="topbar">
                        <div class="toggle">
                            <ion-icon name="menu-outline"></ion-icon>
                        </div>
                        <div class="user">
                            <img src="#" alt="">
                        </div>

                    </div>

                    <div class="details">
                        <div class="recentOrders">
                            <div class="cardHeader">
                                <h2 style="font-size: 30px;">Edit Item</h2>
                            </div>

                            <div class="search" style="justify-self: center;">


                                <form action="ProductControl" method="POST" enctype="multipart/form-data">
                                    <div>
                                        <input id="productID" name="productID" type="hidden" value="${product.getProductID()}"><br>
                                        <input id="recordsPerPage" name="recordsPerPage" type="hidden" value="${recordsPerPage}"><br>
                                        <input id="currentPage" name="currentPage" type="hidden" value="${currentPage}"><br>


                                        <label style="margin-bottom: 10px;">
                                            <!-- Khung hiển thị ảnh và tên file -->
                                            <div class="preview" id="preview" style="margin-bottom: 10px;">
                                                <img src="${reuse.loadImage(product.getAvatar_img())}" alt="..."><br>
                                            </div>
                                            
                                            <label>Upload Items Image: </label>
                                            <label class="custom-upload-button" onclick="document.getElementById('image').click()">Chọn ảnh</label>
                                            <input type="file" name="image" id="image" accept="image/*"
                                                   onchange="showFileNameAndPreview()">
                                        </label>


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

                                            &nbsp;&nbsp;&nbsp;<select id="categories" name="categories">
                                                <c:forEach var="category" items="${categoryList}">
                                                    <option value="${category.getCategoryID()}">${category.getCategoryName()}</option>
                                                </c:forEach>                                            </select>
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


            <script src="../js/preview.js"></script>
            <script src="../js/sidebar.js"></script>


            <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
            <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    </body>
</html>