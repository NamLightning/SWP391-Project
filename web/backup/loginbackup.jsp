<%-- 
    Document   : login
    Created on : Jun 17, 2024, 3:28:03 PM
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
            <form action="LoginControl" id="form-login" method="post">
                <h1 class="form-heading">Log in</h1>
                <%
                    if (request.getAttribute("mess") != null) {
                %>
                <p class="alert alert-danger" role="alert"><%= request.getAttribute("mess")%></p>
                <%
                    }
                %>
                <div class="form-group">
                    <i class="far fa-user"></i>
                    <input type="text" class="form-input" placeholder="Username" name="username" value="${username}" >
                </div>
                <div class="form-group">
                    <i class="fas fa-key"></i>
                    <input type="password" class="form-input" placeholder="Password" name="password" value="${password}" >
                    <div id="eye">
                        <i class="far fa-eye"></i>
                    </div>
                </div>
                <div class="form-group form-check">
                    <input name="remember" value="1" type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1"> Remember me</label>
                </div>

                <div><input type="submit" value="Sign in" class="form-submit"></div>                  
            </form>
            <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:8080/finalWebProject/LoginServlet&response_type=code&client_id=697015326499-mehleirgoloeb1m97o29jueu5rduj277.apps.googleusercontent.com&approval_prompt=force">
                <div class="d-grid mb-2">                   
                    <button class="btn btn-lg btn-primary google-login" >
                        <img src="https://developers.google.com/identity/images/g-logo.png" alt="Google Logo"
                             class="google-logo">
                        Login with Google
                    </button>                                    
                </div>  
            </a>      
        </div>
    </body>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="js/app.js"></script>
</html>
