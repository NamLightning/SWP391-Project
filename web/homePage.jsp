<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/homeindex.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>   
    <body>
    <center>
        <%@include file="includes/header.jsp" %>
        <div class="container">
            <div class="left-sidebar"></div>
            <div class="main-content">
                <div class="welcome-page" style="width: 100%;height: 100%;margin: 0;">
                    <img src="${pageContext.request.contextPath}/images/welcome-img.png" alt="..." class="welcome-image"/>
                    <div class="welcome-content">
                        <h1>A pet store with everything you need</h1>
                        <br>
                        <p>PetHub is more than just an online pet shop – it’s a place 
                            for pet parents who want nothing but the best for their pets.
                        </p>
                        <button class="welcome-button" onclick="window.location.href = 'CategoriesControl'">Shop Now</button>
                    </div>
                </div>
            </div>
            <div class="right-sidebar"></div><br>
        </div>

        <div class="container-2">
            <div class="left-sidebar" style="background-color: #ffffff; width:312px"></div>
            <div class="main-content-2" style="flex: 1;width: 1920px; height: 508px">
                <div class="category" style="width: 1296px;height: 508px;">
                    <h1>Browse by category</h1>
                    <div class="category-menu">
                        <div class="category-container">
                            <div class="category-feature">
                                <a href="CategoriesControl?action=furniture" style="text-decoration: none; color: #000;display: block;">
                                    <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/e67933fc965fa8324a2ac6ff73eb74d3ecb67e185dd12cf2837558db462b4bcd?placeholderIfAbsent=true&apiKey=c13e4e7034f6406eafaf7c522b0db751" alt="Furniture">
                                    <div class="category-info">
                                        <h3>Furniture</h3>
                                        <p style="margin:0; padding:0;">20 products</p>
                                    </div>
                                </a>
                            </div>
                            <div class="category-feature">
                                <a href="CategoriesControl" style="text-decoration: none; color: #000;display: block;">
                                    <img src="images/cate-img2.png" alt="Food">
                                    <div class="category-info">
                                        <h3>Food</h3>
                                        <p style="margin:0; padding:0;">20 products</p>
                                    </div>
                                </a>
                            </div>

                            <div class="category-feature">
                                <a href="CategoriesControl?action=accessory" style="text-decoration: none; color: #000;display: block;">
                                    <img src="images/cate-img3.png" alt="Accessories">
                                    <div class="category-info">
                                        <h3>Accessories</h3>
                                        <p  style="margin:0; padding:0;">20 products</p>
                                    </div>
                                </a>
                            </div>
                            <div class="category-feature">
                                <a href="CategoriesControl?action=cloth" style="text-decoration: none; color: #000;display: block;">
                                    <img src="images/cate-img4.png" alt="Clothes">
                                    <div class="category-info">
                                        <h3>Clothes</h3>
                                        <p style="margin:0; padding:0;">20 products</p>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="right-sidebar" style="background-color: #ffffff;width:312px"></div>
        </div>

        <div class="container-3">
            <div class="left-sidebar" style="background-color: #ffffff;width:250px"></div>
            <div class="main-content-3" style="flex: 1;width: 1600px; height: 650px">
                <div class="feature">
                    <h1 style="margin:0;padding-bottom: 20px;">Feature products</h1>
                    <div class="feature-menu">
                        <div class="feature-container">
                            <div class="feature-item">
                                <a href="itemDetails.jsp" style="text-decoration: none; color: #000;display: block;">
                                    <img src="images/food1.jpg" alt="">
                                    <div class="feature-info">
                                        <h3>Premium Dog Food</h3>
                                        <p style="margin:0; padding-top:10px;">479.000₫</p>
                                    </div>
                                </a>
                            </div>
                            <div class="feature-item">
                                <a href="itemDetails.jsp" style="text-decoration: none; color: #000;display: block;">
                                    <img src="images/food2.jpg" alt="">
                                    <div class="feature-info">
                                        <h3>Premium Cat Food</h3>
                                        <p style="margin-top: 0; padding-top:10px;">439.000₫</p>
                                    </div>
                                </a>
                            </div>
                            <div class="feature-item">
                                <a href="itemDetails.jsp" style="text-decoration: none; color: #000;display: block;">
                                    <img src="images/food3.jpg" alt="" style="object-fit: contain;">
                                    <div class="feature-info">
                                        <h3>Premium Dog Food - Size XL</h3>
                                        <p style="margin:0; padding-top:10px;">699.000₫</p>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="right-sidebar" style="background-color: #ffffff;width:250px"></div>
        </div>

        <div class="container-4">
            <div class="left-sidebar" style="background-color: #f8f9fa; width:15%; height: 20%;"></div>
            <div class="main-content-4" style="flex: 1;width: 1480px; height: 20%px">
                <center>
                    <div class="learn-more">
                        <img src="images/learnmore-img.jpg" alt="" class="learn-more-image"/>
                        <div class="learn-more-content">
                            <h1>The smarter way to shop for your pet</h1>
                            <br>
                            <p>We are committed to having the best service
                                and ensuring the best quality for your pet.
                            </p>
                            <button class="learn-more-button" onclick="window.location.href = 'CategoriesControl'">Learn More</button>
                        </div>
                    </div>
                </center>
            </div>
            <div class="right-sidebar" style="background-color: #f8f9fa;width:15%;height: 20%;"></div>
        </div>

        <div class="container-5">
            <div class="left-sidebar" style="background-color: #ffffff; width:312px; height: 1224px;"></div>
            <div class="main-content-5" style="flex: 1;width: 1296px; height: 1024px">
                <div class="best-sell" id="best_seller">
                    <h1>Best Selling</h1>
                    <div class="best-sell-menu">
                        <div class="best-sell-container">
                            <div class="best-sell-item">
                                <a href="itemDetails.jsp" style="text-decoration: none; color: #000;display: block;">
                                    <img src="images/bowl1.jpg" alt="">
                                    <div class="best-sell-info">
                                        <h3>Cat Bowl</h3>
                                        <p style="margin:0; padding-top:10px;">479.000₫</p>
                                    </div>
                                </a>
                            </div>
                            <div class="best-sell-item">
                                <a href="itemDetails.jsp" style="text-decoration: none; color: #000;display: block;">
                                    <img src="images/bowl2.jpg" alt="">
                                    <div class="best-sell-info">
                                        <h3>Cat Bowl</h3>
                                        <p style="margin-top: 0; padding-top:10px;">439.000₫</p>
                                    </div>
                                </a>
                            </div>
                            <div class="best-sell-item">
                                <a href="itemDetails.jsp" style="text-decoration: none; color: #000;display: block;">
                                    <img src="images/leash1.jpg" alt="">
                                    <div class="best-sell-info">
                                        <h3>Dog Leash</h3>
                                        <p style="margin:0; padding-top:10px;">699.000₫</p>
                                    </div>
                                </a>
                            </div>     
                            <div class="best-sell-item">
                                <a href="itemDetails.jsp" style="text-decoration: none; color: #000;display: block;">
                                    <img src="images/catcloth1.jpg" alt="">
                                    <div class="best-sell-info">
                                        <h3>Cat Sweater</h3>
                                        <p style="margin:0; padding-top:10px;">699.000₫</p>
                                    </div>
                                </a>
                            </div>   
                            <div class="best-sell-item">
                                <a href="itemDetails.jsp" style="text-decoration: none; color: #000;display: block;">
                                    <img src="images/food1.jpg" alt="">
                                    <div class="best-sell-info">
                                        <h3>Premium Dog Food</h3>
                                        <p style="margin:0; padding-top:10px;">479.000₫</p>
                                    </div>
                                </a>
                            </div>
                            <div class="best-sell-item">
                                <a href="itemDetails.jsp" style="text-decoration: none; color: #000;display: block;">
                                    <img src="images/food4.jpg" alt="">
                                    <div class="best-sell-info">
                                        <h3>Dog Food - Size M</h3>
                                        <p style="margin-top: 0; padding-top:10px;">439.000₫</p>
                                    </div>
                                </a>
                            </div>
                            <div class="best-sell-item">
                                <a href="itemDetails.jsp" style="text-decoration: none; color: #000;display: block;">
                                    <img src="images/food2.jpg" alt="">
                                    <div class="best-sell-info">
                                        <h3>Premium Cat Food</h3>
                                        <p style="margin:0; padding-top:10px;">699.000₫</p>
                                    </div>
                                </a>
                            </div>     
                            <div class="best-sell-item">
                                <a href="itemDetails.jsp" style="text-decoration: none; color: #000;display: block;">
                                    <img src="images/dogcloth1.jpg" alt="">
                                    <div class="best-sell-info">
                                        <h3>Dog Hoodie</h3>
                                        <p style="margin:0; padding-top:10px;">699.000₫</p>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="right-sidebar" style="background-color: #ffffff;width:312px;height: 1224px;"></div>
        </div>

        <div class="container-6">
            <div class="left-sidebar" style="background-color: #ffffff; width:312px; height: 721px;"></div>
            <div class="main-content-6" style="flex: 1;width: 1296px; height: 721px">
                <div class="news-blog">
                    <h1>News & Blog</h1>
                    <div class="news-blog-menu">
                        <div class="news-blog-container">
                            <div class="news-blog-item">
                                <img src="images/blog1.png" alt="">
                                <p style="margin:0; padding-top:10px; padding-left: 10px;text-align: left;">12 December,2023</p>
                                <h3 style="padding-left: 10px;">Do Cats Get Cold?</h3>
                            </div>
                            <div class="news-blog-item">
                                <img src="images/blog2.png" alt="">
                                <p style="margin:0; padding-top:10px;padding-left: 10px;text-align: left;">21 August,2024</p>
                                <h3 style="padding-left: 10px;">How Much Does Dog Training Cost?</h3>
                            </div>
                            <div class="news-blog-item">
                                <img src="images/blog3.png" alt="">
                                <p style="margin:0; padding-top:10px;padding-left: 10px;text-align: left;">3 September,2024</p>
                                <h3 style="padding-left: 10px;">The Do's and Don'ts of Crate Training a Puppy</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="right-sidebar" style="background-color: #ffffff;width:312px;height: 721px;"></div>
        </div>
    </center>
    <%@include file="includes/chatbox.jsp"%>
</body>
<%@include file="includes/footer.jsp" %>
</html>
