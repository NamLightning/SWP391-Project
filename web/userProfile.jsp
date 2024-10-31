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
                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/331e59ea9e3f661a0fe3c0c6c4be4c297bf91b03ff6ccb1bf6f84effc54f3854?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="User profile picture" class="profile-image" />
                            <form class="form-fields">
                                <div class="input-group">
                                    <div class="form-field">
                                        <label for="display-name" class="form-label">Display name</label>
                                        <input type="text" id="display-name" class="form-input" value="Kevin" />
                                    </div>
                                    <div class="form-field">
                                        <label for="username" class="form-label">Username</label>
                                        <input type="text" id="username" class="form-input" value="Display name" />
                                    </div>
                                </div>
                                <div class="input-group">
                                    <div class="form-field">
                                        <label for="full-name" class="form-label">Full Name</label>
                                        <input type="text" id="full-name" class="form-input" value="Kevin Gilbert" />
                                    </div>
                                    <div class="form-field">
                                        <label for="email" class="form-label">Email</label>
                                        <input type="email" id="email" class="form-input" value="Kevin.gilbert@gmail.com" />
                                    </div>
                                </div>
                                <div class="input-group">
                                    <div class="form-field">
                                        <label for="secondary-email" class="form-label">Secondary Email</label>
                                        <input type="email" id="secondary-email" class="form-input" value="kevin12345@gmail.com" />
                                    </div>
                                    <div class="form-field">
                                        <label for="phone" class="form-label">Phone Number</label>
                                        <input type="tel" id="phone" class="form-input" value="+1-202-555-0118" />
                                    </div>
                                </div>
                                <button type="submit" class="save-button">Save Changes</button>
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
                                    <input type="text" id="firstName" class="form-input" value="Kevin" aria-label="First Name">
                                </div>
                                <div class="form-group">
                                    <label for="lastName" class="form-label">Last Name</label>
                                    <input type="text" id="lastName" class="form-input" value="Gilbert" aria-label="Last Name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="address" class="form-label">Address</label>
                                <input type="text" id="address" class="form-input" value="Road No. 13/x, House no. 1320/C, Flat No. 5D" aria-label="Address">
                            </div>
                            <div class="form-row">
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
                            </div>
                            <div class="form-group">
                                <label for="phoneNumber" class="form-label">Phone Number</label>
                                <input type="tel" id="phoneNumber" class="form-input" value="+1-202-555-0118" aria-label="Phone Number">
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
                            <input type="password" id="current-password" value="" class="form-input" required>
                        </div>
                        <div class="form-group">
                            <label for="new-password" class="form-label">New Password</label>
                            <input type="password" id="new-password" class="form-input"  value="" required>
                        </div>
                        <div class="form-group">
                            <label for="confirm-password" class="form-label">Confirm Password</label>
                            <input type="password" id="confirm-password" class="form-input" required>
                        </div>
                        <button type="submit" class="save-button">Change Password</button>
                    </form>
                </section>
            </div>
        </div>
        <%@include file="includes/footer.jsp"%>
    </center>
</body>
</html>