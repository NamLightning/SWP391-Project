<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Login</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link rel="stylesheet" href="bootstrap/bootstrap.css">
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="css/login.css">
        <link rel="stylesheet" href="css/signup.css"/>
    </head>
    <body>
    <center style="margin-right: 8%;">
        <section class="sign-in-form" style="width:50%;">
            <div class="login-form-container">
                <div class="form-content" style="height: 50%;">
                    <section class="image-container">
                        <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/a87160060e19b1c47f61e1ffb7c7ed526945768f3798789b1198dd6c8c84d8b2?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" class="product-image" alt="Product image" />
                    </section>
                    <header class="form-header">
                        <h1 class="form-title">Login</h1>
                    </header>
                    <button class="google-login" onclick="location.href = 'https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:8084/PetStore/LoginControl&response_type=code&client_id=697015326499-mehleirgoloeb1m97o29jueu5rduj277.apps.googleusercontent.com&approval_prompt=force'">
                        <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/3cf47c35d74c53c72dd3d1ba19ef7edf3496c88f1a4ff111a7c6596b0373776b?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" class="google-icon" alt="Google logo" />
                        <span class="google-text">Continue with Google</span>
                    </button>
                    <p class="divider">
                        <span>-------------</span> or Login with Username<span>-------------</span>
                    </p>
                    <c:if test="${not empty mess}">
                        <p class="alert alert-danger" role="alert">${mess}</p>
                    </c:if>
                    <form class="form-wrapper" action="LoginControl" method="POST">
                        <div class="login-form-fields">
                            <div class="username-field">
                                <label>Username</label>
                                <input type="text" name="username" id="username" class="username-input" required />
                            </div>
                            <div class="password-field">
                                <div class="password-wrapper">
                                    <label>Password</label>
                                    <input type="password" name="password" id="password" class="password-input" placeholder="*****************" required />
                                </div>
                            </div>

                            <div class="option-pass">
                                <div class="remember-me">
                                    <div class="checkbox-wrapper">
                                        <input type="checkbox" id="remember-me" value="1"/>
                                        <label class="checkbox-label">
                                            Remember Me
                                        </label>
                                    </div>
                                </div>
                                <div class="forgot-pass" style="margin-top: 1.8%">
                                    <a href="forgotPassword_EnterEmail.jsp" class="other-link">Forgot Password!</a>
                                </div>
                            </div> 
                            <button type="submit" class="submit-button" style="margin-bottom: 10px;">Login</button>
                            <center>
                                <div class="signup-prompt" style="margin-bottom: 30px;">
                                    <span class="signup-text">Not Registered Yet?</span>
                                    <a href="signUp.jsp" class="other-link">Create an account</a>
                                </div>
                            </center>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </center>
</body>
</html>