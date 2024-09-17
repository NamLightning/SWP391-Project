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
                    <form class="form-wrapper">
                        <header class="form-header">
                            <h1 class="form-title">Sign Up</h1>
                            <button class="google-signup">
                                <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/3cf47c35d74c53c72dd3d1ba19ef7edf3496c88f1a4ff111a7c6596b0373776b?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" class="google-icon" alt="Google logo" />
                                <span class="google-text">Sign Up with Google</span>
                            </button>
                        </header>
                        <p class="divider">
                            <span>-------------</span> or Sign Up with Email <span>-------------</span>
                        </p>
                        <div class="form-fields">
                            <div class="name-fields">
                                <div class="name-field">
                                    <label for="first-name">First name</label>
                                    <input type="text" id="first-name" class="input-field" required />
                                </div>
                                <div class="name-field">
                                    <label for="second-name">Second name</label>
                                    <input type="text" id="second-name" class="input-field" required />
                                </div>
                            </div>
                            <div class="username-field">
                                <label for="username">User name</label>
                                <input type="username" id="username" class="username-input"required />
                            </div>
                            <div class="password-field">
                                <div class="password-wrapper">
                                    <label for="password">Password</label>
                                    <input type="password" id="password" class="password-input" placeholder="*****************" required />
                                </div>
                            </div>
                            <div class="re-password-field">
                                <div class="re-password-wrapper">
                                    <label for="re-password">Re-Password</label>
                                    <input type="re-password" id="re-password" class="re-password-input" placeholder="*****************" required />
                                </div>
                            </div>
                            <div class="phone-field">
                                <label for="phone-number">Phone number</label>
                                <input type="tel" id="phone-number" class="input-field" required />
                            </div>
                            <div class="email-field">
                                <label for="email">Email</label>
                                <input type="email" id="email" class="email-input" placeholder="mail@abc.com" required />
                            </div>
                            <div class="address-field">
                                <label for="address">Address</label>
                                <input type="address" id="address" class="address-input" required />
                            </div>
                            <button type="submit" class="submit-button">Sign Up</button>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </center>
</body>
</html>