<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <section class="sign-up-form">
            <div class="form-container">
                <div class="form-content">
                    <section class="image-container">
                        <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/a87160060e19b1c47f61e1ffb7c7ed526945768f3798789b1198dd6c8c84d8b2?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" class="product-image" alt="Product image" />
                    </section>
                    <header class="form-header">
                        <h1 class="form-title">Sign Up</h1>
                    </header>
                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:8084/PetStore/LoginControl&response_type=code&client_id=697015326499-mehleirgoloeb1m97o29jueu5rduj277.apps.googleusercontent.com&approval_prompt=force">

                        <button class="google-signup">
                            <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/3cf47c35d74c53c72dd3d1ba19ef7edf3496c88f1a4ff111a7c6596b0373776b?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" class="google-icon" alt="Google logo"/>
                            <span class="google-text">Sign Up with Google</span>
                        </button>

                    </a>
                    <p class="divider" style="text-align:center;">
                        <span>-------------</span> or Sign Up with Username <span>-------------</span>
                    <form class="form-wrapper" action="SignUpControl" method="POST">
                        <div class="form-fields">
                            <div class="name-fields">
                                <div class="name-field">
                                    <label>First name</label>
                                    <input type="text" id="first-name" name="first-name" class="input-field" required />
                                </div>
                                <div class="name-field">
                                    <label>Second name</label>
                                    <input type="text" id="second-name" name="second-name" class="input-field" required />
                                </div>
                            </div>
                            <div class="username-field">
                                <label>User name</label>
                                <input type="text" id="username" name="username" class="username-input" required />
                            </div>
                            <div class="password-field">
                                <div class="password-wrapper">
                                    <label>Password</label>
                                    <input type="password" id="password" name="password" class="password-input" placeholder="*****************" required />
                                </div>
                            </div>
                            <div class="re-password-field">
                                <div class="re-password-wrapper">
                                    <label>Re-Password</label>
                                    <input type="password" id="re-password" name="re-password" class="re-password-input" placeholder="*****************" required />
                                </div>
                            </div>
                            <div class="phone-field">
                                <label>Phone number</label>
                                <input type="tel" id="phone-number" name="phone-number" class="input-field" required />
                            </div>
                            <div class="email-field">
                                <label>Email</label>
                                <input type="email" id="email" name="email" class="email-input" placeholder="mail@abc.com" required />
                            </div>
                            <div class="address-field">
                                <label>Address</label>
                                <input type="text" id="address" name="address" class="address-input" required />
                            </div>
                            <button type="submit" class="submit-button">Sign Up</button>
                            <center>
                                <div class="login-prompt" style="margin-bottom: 30px;">
                                    <span class="login-text">Already have account?</span>
                                    <a href="login.jsp" class="other-link">Login</a>
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