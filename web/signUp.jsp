<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <link rel='stylesheet' href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css'>
        <link rel="stylesheet" href="./login-signup.css">
    </head>
    <body>
        <div class="container">
            <header>Sign Up Form</header>
            <form action="#">
                <div class="field name-field">
                    <div class="input-field">
                        <input type="name" placeholder="Enter your Name" class="name" required />
                    </div>
                    <span class="error name-error">
                        <i class="bx bx-error-circle error-icon"></i>
                        <p class="error-text">Please enter a valid Name</p>
                    </span>
                </div>
                <div class="field username-field">
                    <div class="input-field">
                        <input type="name" placeholder="Enter your Username" class="username" required />
                    </div>
                    <span class="error name-error">
                        <i class="bx bx-error-circle error-icon"></i>
                        <p class="error-text">Please enter a valid Username</p>
                    </span>
                </div>
                <div class="field email-field">
                    <div class="input-field">
                        <input type="email" placeholder="Enter your email" class="email" required />
                    </div>
                    <span class="error email-error">
                        <i class="bx bx-error-circle error-icon"></i>
                        <p class="error-text">Please enter a valid email</p>
                    </span>
                </div>
                <div class="field create-password">
                    <div class="input-field">
                        <input type="password" placeholder="Password" class="password" required />
                        <i class="bx bx-hide show-hide"></i>
                    </div>
                    <span class="error password-error">
                        <i class="bx bx-error-circle error-icon"></i>
                        <p class="error-text">
                            Please enter atleast 8 charatcer with number, symbol, small and
                            capital letter.
                        </p>
                    </span>
                </div>
                <div class="field confirm-password">
                    <div class="input-field">
                        <input type="password" placeholder="Confirm Password" class="cPassword" required />
                        <i class="bx bx-hide show-hide"></i>
                    </div>
                    <span class="error cPassword-error">
                        <i class="bx bx-error-circle error-icon"></i>
                        <p class="error-text">Password didn't match</p>
                    </span>
                </div>
                <div class="links">
                    <a href="#">Forgot Password</a>
                    <a href="index.html">Login</a>
                </div>
                <div class="input-field button">
                    <input type="submit" value="Signup Now" />
                </div>
            </form>
        </div>
    </body>
</html>