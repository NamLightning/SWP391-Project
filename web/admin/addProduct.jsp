<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                            <h2 style="font-size: 30px;">Add Item</h2>
                        </div>
                        
                        

                        <div class="search" style="justify-self: center;">
                            <label style="margin-bottom: 10px;">
                                <label>Upload Items Image: </label>
                                <label class="custom-upload-button" onclick="document.getElementById('image').click()">Chọn ảnh</label>
                                <input type="file" name="image" id="image" accept="image/*"
                                       onchange="showFileNameAndPreview()">
                            </label>

                            <!-- Khung hiển thị ảnh và tên file -->
                            <div class="preview" id="preview"></div>

                            <label class="property">
                                <p>Item name:</p>
                                <input id="productName" name="productName" type="text" placeholder="Item Name" value="">
                            </label>

                            <label class="property">
                                <p>Item description:</p>
                                <input id="productDesc" name="productDesc" type="text" placeholder="Item description"
                                       value="">
                            </label>

                            <label class="property">
                                <p>Item price:</p>
                                <input id="price" name="price" type="text" placeholder="Item price" value="">
                            </label>

                            <label class="property">
                                <p>Item stock:</p>
                                <input id="stock" name="stock" type="text" placeholder="Item stock" value="">
                            </label>

                            <label class="property">
                                <p>Item category:</p>

                                <select id="categories" name="categories">
                                    <option>1</option>
                                </select>
                            </label>
                            <div style="justify-self: center;">
                                <button class="btn-add">Add</button>
                            </div>
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
