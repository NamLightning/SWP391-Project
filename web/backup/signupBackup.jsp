<%-- 
    Document   : signup
    Created on : Jun 18, 2024, 1:46:09 AM
    Author     : Hoang Nam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/login.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
        <title>login</title>
    </head>

    <body>
        <div id="wrapper">
            <form action="SignUpControl" id="form-login" method="post">
                <h1 class="form-heading">Sign up</h1>
                <%
                    if (request.getAttribute("mess") != null) {
                %>
                <p class="alert alert-danger" role="alert"><%= request.getAttribute("mess")%></p>
                <%
                    }
                %>
                <div class="form-group">
                    <i class="far fa-user"></i>
                    <input type="text" class="form-input" placeholder="First Name" name="fname">
                </div>
                <div class="form-group">
                    <i class="far fa-user"></i>
                    <input type="text" class="form-input" placeholder="LastName" name="lname">
                </div>
                <div class="form-group">
                    <i class="far fa-user"></i>
                    <input type="text" class="form-input" placeholder="Phone" name="phone_numb">
                </div>
                <div class="form-group">
                    <i class="far fa-user"></i>
                    <input type="text" class="form-input" placeholder="Email" name="email">
                </div>
                <div class="form-group">
                    <i class="far fa-user"></i>
                    <input type="text" class="form-input" placeholder="Username" name="username">
                </div>
                <div class="form-group">
                    <i class="fas fa-key"></i>
                    <input type="password" class="form-input" placeholder="Password" name="password">
                    <div id="eye">
                        <i class="far fa-eye"></i>
                    </div>
                </div>
                <div class="form-group">
                    <i class="fas fa-key"></i>
                    <input type="password" class="form-input" placeholder="Re-password" name="repassword">
                    <div id="eye">
                        <i class="far fa-eye"></i>
                    </div>
                </div>
                <input type="submit" value="Sign up" class="form-submit">
            </form>
        </div>
    </body>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="js/app.js"></script>
</html>