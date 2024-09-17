<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Change Password</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/forgot_pass_style.css">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    </head>
    
    <body class="body_forgot">
        <section class="confiq">
            <section id="content">
                <nav id="navbar-example2" class="navbar navbar-expand-lg ">

                    <div class="navigation container-fluid d-flex flex-wrap align-items-center my-2 pe-4 ps-5 ">

                        <div class="col-md-3 brand-logo">
                            <a href="homePage.jsp" class="d-inline-flex link-body-emphasis text-decoration-none">
                                <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/a87160060e19b1c47f61e1ffb7c7ed526945768f3798789b1198dd6c8c84d8b2?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" class="product-image" alt="Product image" />
                            </a>
                        </div>
                        <button class="navbar-toggler" type="button"  aria-controls="offcanvasNavbar2" aria-label="Toggle navigation"><ion-icon name="menu-outline"></ion-icon></button>
                    </div>
                </nav>
                <main class="forgot-pass-main d-flex justify-content-center">
                    <section class=" forgot_pass_form col-md-5">
                        <div class="card mt-5 border-0 shadow rounded-3">
                            <div class="container">
                                <div class="card-body my-2 col-md-10">
                                    <h3 class="card-title ">Forgot Password</h3>
                                    <p>Please enter your new password to reset.</p>
                                    <form action="Authentication_ChangePasswornd_ChangePassword_Servlet" method="post">
                                        <div class="form-group">
                                            <label for="new-password">New Password</label>
                                            <div class="input-container">
                                                <input id="new-password" name="newPassword" class="text" type="password" placeholder="Enter new password" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="confirm-password">Confirm Password</label>
                                            <div class="input-container">
                                                <input id="confirm-password" name="confirmPassword" class="text" type="password" placeholder="Confirm new password" required>
                                            </div>
                                        </div>
                                        <p class="text-danger">${message}</p>  
                                        <div>
                                            <button class="btn btn-primary fw-bold" type="submit">Confirm</button>
                                        </div>

                                    </form>
                                </div>
                            </div>

                        </div>
                    </section>

                </main>
            </section>
        </section>

        <script src="js/forgot_password.js"></script>
    </body>
</html>
