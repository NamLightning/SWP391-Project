<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PetHub</title>
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/newsblog.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>
    <body>
    <center>
        <%@include file="includes/header.jsp" %>
        <div class="news-blog">
            <div class="news-title-image">
                <section class="article-container">
                    <article class="article-card">
                        <a href="blogDetail/newsblogDetails_1.jsp" style="text-decoration: none; color: #000;display: block;">
                            <div class="article-content">
                                <h3 class="article-category" style="padding-left: 5%;">WHAT CAN CATS EAT</h3>
                                <h2 class="article-title">Can Cat Eat Pumpkin?</h2>
                                <p class="article-description">Can't keep your cat's paws away from the pumpkin pie? From raw pumpkin to roasted pumpkin seeds, not all pumpkin is safe for your cat to eat. Learn how to feed your cat pumpkin and the nutritional benefits it provides</p>
                            </div>
                        </a>
                    </article>
                </section>
            </div>
            <div class="news-container">
                <div class="left-sidebar" style="background-color: #ffffff; width:312px; height:1100px;"></div>
                <div class="main-content-6" style="flex: 1;width: 1296px; height: 1100px">
                    <div class="news-blog">
                        <h1>News & Blog</h1>
                        <div class="news-blog-menu">
                            <div class="news-blog-container">
                                <div class="news-blog-item">
                                    <a href="blogDetail/newsblogDetails_2.jsp" style="text-decoration: none; color: #000;display: block;">
                                        <img src="images/blog1.png" alt="">
                                        <p style="margin:0; padding-top:10px; padding-left: 10px;text-align: left;">12 December,2023</p>
                                        <h3 style="padding-left: 10px;">Do Cats Get Cold?</h3>
                                    </a>
                                </div>
                                <div class="news-blog-item">
                                    <a href="blogDetail/newsblogDetails_3.jsp" style="text-decoration: none; color: #000;display: block;">
                                        <img src="images/blog2.png" alt="">
                                        <p style="margin:0; padding-top:10px;padding-left: 10px;text-align: left;">21 August,2024</p>
                                        <h3 style="padding-left: 10px;">How Much Does Dog Training Cost?</h3>
                                    </a>
                                </div>
                                <div class="news-blog-item">
                                    <a href="blogDetail/newsblogDetails_4.jsp" style="text-decoration: none; color: #000;display: block;">
                                        <img src="images/blog3.png" alt="">
                                        <p style="margin:0; padding-top:10px;padding-left: 10px;text-align: left;">3 September,2024</p>
                                        <h3 style="padding-left: 10px;">The Do's and Don'ts of Crate Training a Puppy</h3>
                                    </a>
                                </div>
                                <div class="news-blog-item">
                                    <a href="blogDetail/newsblogDetails_5.jsp" style="text-decoration: none; color: #000;display: block;">
                                        <img src="images/news2.jpg" alt="" class="news-image-overlay" loading="lazy" >
                                        <p style="margin:0; padding-top:10px;padding-left: 10px;text-align: left;">30 April, 2023</p>
                                        <h3 style="padding-left: 10px;">Study Finds Cats Connect to Their Owners as Much as Dogs Do</h3>
                                    </a>
                                </div>
                                <div class="news-blog-item">
                                    <a href="blogDetail/newsblogDetails_6.jsp" style="text-decoration: none; color: #000;display: block;">
                                        <img src="images/news3.jpg" alt="" class="news-image-overlay" loading="lazy" >
                                        <p style="margin:0; padding-top:10px;padding-left: 10px;text-align: left;">18 March, 2023</p>
                                        <h3 style="padding-left: 10px;">13 things to remember when walking your dog in rain and floods</h3>
                                    </a>
                                </div>
                                <div class="news-blog-item">
                                    <a href="blogDetail/newsblogDetails_7.jsp" style="text-decoration: none; color: #000;display: block;">
                                        <img src="images/news5.jpg" alt="" class="news-image-overlay" loading="lazy" >
                                        <p style="margin:0; padding-top:10px; padding-left: 10px;text-align: left;">1 October, 2023</p>
                                        <h3 style="padding-left: 10px;">Reason rescue dog is obsessed with white cars leaves internet in tears</h3>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="right-sidebar" style="background-color: #ffffff;width:312px;height: 1100px;"></div>
            </div>
        </div>
    </center>
    <%@include file="includes/footer.jsp" %>
</body>
</html>
