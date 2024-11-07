<%-- 
    Document   : userProfile
    Created on : Sep 5, 2024, 10:18:19 PM
    Author     : Administrator
--%>

<%@page import="Model.Customer"%>
<%@page import="Dao.CustomerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PetHub</title>  
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/user.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>
    <style>
        #image {
            display: none;
        }
        .custom-upload-button {
            padding: 8px 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        /* Đổi màu nút khi hover */
        .custom-upload-button:hover {
            background-color: #45a049;
        }

        /* Khung hiển thị ảnh đã chọn */
        .preview {
            margin-top: 10px;
            text-align: center;
        }

        .preview img {
            max-width: 100%;
            height: 175px;
            border: 1px solid #ddd;
            border-radius: 100px;
            padding: 5px;
            max-height: 500px;
        }

        /* Hiển thị tên file đã chọn */
        .file-name {
            font-size: 14px;
            color: #333;
            margin-top: 10px;
            display: block;
        }
    </style>
    <%
        CustomerDAO customerDAO3 = new CustomerDAO();
        String username3 = (String) session.getAttribute("us");
        Customer customer3 = customerDAO3.findCustomerByUsername(username3);
        pageContext.setAttribute("account", customer3);
    %>
    <body>
    <center>
        <%@include file="includes/header.jsp"%>
        <div class="main-container">
            <%@include file="includes/userMenu.jsp"%>
            <div class="user-container">
                <section class="account-settings">
                    <header class="account-settings-header">Account Setting</header>
                    <div class="account-settings-content">
                        <div class="account-info">
                            <form action="ProfileControl" method="POST" class="form-fields" enctype="multipart/form-data">
                                <img src="${reuse.loadImage(account.getAvatar_img())}" alt=" " class="profile-image" />
                                <div class="preview" id="preview"><img src="${reuse.loadImage(account.getAvatar_img())}" alt=" " class="profile-image" /></div>
                                <label style="margin-bottom: 10px;">
                                    <input type="file" name="image" id="image" accept="image/*"
                                           onchange="showFileNameAndPreview()">
                                    <label>Upload Items Image: </label>
                                    <label class="custom-upload-button" onclick="document.getElementById('image').click()">Choose picture</label>
                                </label>
                                <div class="input-group">
                                    <input type="text" name="id" class="form-control" id="id" value="${account.getCustomerID()}" hidden readonly>
                                    <div class="form-field">
                                        <label for="username" class="form-label">Username</label>
                                        <input type="text" id="username" class="form-input" value="${account.getUsername()}" />
                                    </div>
                                    <div class="form-field">
                                        <label for="full-name" class="form-label">Full Name</label>
                                        <input type="text" id="full-name" class="form-input" value="${account.getLastName()} ${account.getFirstName()}" />
                                    </div>
                                </div>
                                <div class="input-group">
                                    <div class="form-field">
                                        <label for="phone" class="form-label">Phone Number</label>
                                        <input type="tel" id="phone" class="form-input" value="${account.getPhoneNumber()}" />
                                    </div>
                                    <div class="form-field">
                                        <label for="email" class="form-label">Email</label>
                                        <input type="email" id="email" class="form-input" value="${account.getEmail()}" />
                                    </div>
                                </div>
                                <button type="submit" class="save-button">Save Changes</button><br><br>
                                <!--<button onclick="window.location.href = 'homePage.jsp'" type="button">Return</button><br><br>-->
                            </form>
                        </div>
                    </div>
                </section>
                <section class="shipping-address">
                    <h2 class="shipping-address-heading">Shipping Address</h2>
                    <div class="shipping-address-content">
                        <form class="shipping-form">
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="firstName" class="form-label">First Name</label>
                                    <input type="text" id="firstName" class="form-input" value="${account.getFirstName()}" aria-label="First Name">
                                </div>
                                <div class="form-group">
                                    <label for="lastName" class="form-label">Last Name</label>
                                    <input type="text" id="lastName" class="form-input" value="${account.getLastName()}" aria-label="Last Name">
                                </div>
                            </div>
                            <!--                            <div class="form-group">
                                                            <label for="address" class="form-label">Address</label>
                                                            <input type="text" id="address" class="form-input" value="${account.getAddress()}" aria-label="Address">
                                                        </div>-->
                            <!--                            <div class="form-row">
                                                            <div class="form-group">
                                                                <label for="city" class="form-label">City</label>
                                                                <div class="form-input">
                                                                    <span>Da Nang</span>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="zipCode" class="form-label">Zip Code</label>
                                                                <input type="text" id="zipCode" class="form-input" value="500000" aria-label="Zip Code">
                                                            </div>
                                                        </div>-->
                            <div class="form-group">
                                <!--                                <label for="phoneNumber" class="form-label">Phone Number</label>
                                                                <input type="tel" id="phoneNumber" class="form-input" value="+1-202-555-0118" aria-label="Phone Number">-->
                                <div class="form-group">
                                    <label for="address" class="form-label">Address</label>
                                    <input type="text" id="address" class="form-input" value="${account.getAddress()}" aria-label="Address">
                                </div>
                            </div>
                            <button type="submit" class="save-button">Save Changes</button>
                        </form>
                    </div>
                </section>
                <section class="change-password-container">
                    <h2 class="change-password-heading">Change Password</h2>
                    <form class="change-password-form">
                        <div class="form-group">
                            <label for="current-password" class="form-label">Current Password</label>
                            <input type="password" id="current-password" value="${account.getPassword()}" class="form-input" required>
                        </div>
                        <div class="form-group">
                            <label for="new-password" class="form-label">New Password</label>
                            <input type="password" name="password" id="password" class="form-input"  value="" required>
                        </div>
                        <div class="form-group">
                            <label for="confirm-password" class="form-label">Confirm Password</label>
                            <input type="password" name="repassword" id="repassword" class="form-input" required>
                        </div>
                        <button type="submit" class="save-button">Change Password</button>
                    </form>
                </section>
            </div>
        </div>
        <%@include file="includes/footer.jsp"%>
        <script src="${pageContext.request.contextPath}/js/sidebar.js"></script>
    </center>
</body>
</html>
