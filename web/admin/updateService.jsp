
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Responsive Admine Dashboard</title>
        <link rel="stylesheet" href="../css/createPro.css">
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
                    <div class="user">
                        <img src="#" alt="">
                    </div>

                </div>


                <div class="details">
                    <div class="recentOrders">
                        <div class="cardHeader">
                            <h2 style="font-size: 30px;">Edit Service</h2>
                        </div>

                        <div class="search" style="justify-self: center;">
                            <label style="margin-bottom: 10px;">

                                <!-- Khung hiển thị ảnh và tên file -->
                                <div class="preview" id="preview" style="margin-bottom: 10px;"></div>

                                <label>Upload Service Image: </label>
                                <label class="custom-upload-button" onclick="document.getElementById('image').click()">Chọn
                                    ảnh</label>
                                <input type="file" name="image" id="image" accept="image/*"
                                       onchange="showFileNameAndPreview()">
                            </label>


                            <label class="property">
                                <p>Service name:</p>
                                <input id="serviceName" name="serviceName" type="text" placeholder="Service Name" value="">
                            </label>

                            <label class="property">
                                <p>Service price:</p>
                                <input id="price" name="price" type="text" placeholder="Service price" value="">
                            </label>

                            <label class="property">
                                <p>Service description:</p>
                                <input id="serviceDes" name="serviceDes" type="text" placeholder="Service description"
                                       value="">
                            </label>

                            <div style="justify-self: center;">
                                <input name="submit" class="btn-add" type="submit" value="Edit">

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
