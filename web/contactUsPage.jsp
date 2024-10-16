<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="scroll-behavior: smooth;">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PetHub</title>
        <link rel="stylesheet" href="bootstrap/bootstrap.css">
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/contactus.css">
    </head>
    <body>
        <%@include file="includes/header.jsp" %>
    <center>
        <div class="container">
            <div class="left-sidebar"></div>
            <div class="main-content">
                <div class="about-us" style="width: 100%;height: 100%;margin: 0;">
                    <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/050a2dc1bf85e20c3fff4cf8fd6e14913b35d85bedc906fd696a00a0665b934d?placeholderIfAbsent=true&apiKey=c13e4e7034f6406eafaf7c522b0db751" alt="" class="abousus-image"/>
                    <div class="aboutus-content">
                        <h1>About Us</h1>
                        <br>
                        <p>PetHub is committed to providing the best products and services for pets. 
                            With dedication and passion, our team constantly strives to deliver the best experience for our customers. 
                            Let us accompany you in keeping your pets healthy and happy.
                        </p>
                        <button class="response-button" onclick="window.location.href='#form-feedback'">Response</button>
                    </div>
                </div>
            </div>
            <div class="right-sidebar"></div><br>
        </div>
        <div class="left-sidebar"></div><br>
        <section class="contact-section" id="form-feedback">
            <form class="contact-form">
                <div class="form-inputs">
                    <div class="name-inputs">
                        <div class="input-group">
                            <label for="firstName" class="input-label">First Name</label>
                            <input type="text" id="firstName" class="input-field" placeholder="First name" required>
                        </div>
                        <div class="input-group">
                            <label for="lastName" class="input-label">Last Name</label>
                            <input type="text" id="lastName" class="input-field" placeholder="Last name" required>
                        </div>
                    </div>
                    <div class="input-group">
                        <label for="email" class="input-label">Email Address</label>
                        <input type="email" id="email" class="input-field" placeholder="E-mail address" required>
                    </div>
                    <div class="input-group">
                        <label for="message" class="input-label">Message</label>
                        <textarea id="message" class="input-field message-input" placeholder="Your message..." required></textarea>
                    </div>
                    <button type="submit" class="submit-button">Send Message</button>
                </div>
            </form>

            <div class="contactus-info">
                <h2 class="contact-heading">Feel free to contact us</h2>
                <div class="contact-details">
                    <div class="contact-item">
                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/4e3083e7ae2136bc456b74ce6389f9b9cf23e63c28a86d783ad38ce620a7d149?placeholderIfAbsent=true&apiKey=c13e4e7034f6406eafaf7c522b0db751" alt="" class="contact-icon">
                        <p class="contact-text">FPT Plaza, Ngu Hanh Son District, Da Nang</p>
                    </div>
                    <div class="contact-item">
                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/ef7cfae8878a13e20f67811dd272baeaf5009726f0f9f54ee9c073f0768c5664?placeholderIfAbsent=true&apiKey=c13e4e7034f6406eafaf7c522b0db751" alt="" class="contact-icon">
                        <p class="contact-text">Namlightning23150@gmail.com</p>
                    </div>
                    <div class="contact-item">
                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/235ec524e345a4cf9a33121ceade5b473e8f422acd6667af74dbfcfeccee7ac1?placeholderIfAbsent=true&apiKey=c13e4e7034f6406eafaf7c522b0db751" alt="" class="contact-icon">
                        <p class="contact-text">+84 357572079</p>
                    </div>
                    <div class="contact-item">
                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/082ca150ecbf4a884db70ba5f265b2c73fde56831bed0f32d0df4ada41604bd9?placeholderIfAbsent=true&apiKey=c13e4e7034f6406eafaf7c522b0db751" alt="" class="contact-icon">
                        <p class="contact-text">Mon - Sunday: 8AM - 9PM</p>
                    </div>
                </div>
            </div>
        </section>
        <div class="right-sidebar"></div><br>
        <div class="map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3835.5848800259173!2d108.258449!3d15.9830405!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31421162aa4e0c59%3A0x22c827eb74773719!2sFPT%20Plaza%202!5e0!3m2!1svi!2s!4v1727276665627!5m2!1svi!2s"height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
    </center>
    <script src="js/manipulation.js"></script>
    <%@include file="includes/footer.jsp" %>
</body>
</html>