<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PetHub</title>
        <link rel="stylesheet" href="../css/header.css">
        <link rel="stylesheet" href="../css/newsblog.css">
        <link rel="stylesheet" href="../css/footer.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    </head>
    <body>
    <center>
        <%@include file="../includes/header.jsp"%>
        <article class="newsblog-container">
            <img src="../images/news1.jpg" alt="" class="hero-image" />
            <div class="content-wrapper">
                <main class="main-news-content">
                    <h1 class="article-title">Can cat eat pumpkin?</h1>
                    <p class="article-intro">
                        Pumpkin, as long as it's plain, is safe for cats and has several health benefits. 
                        Just pay mind to proportion sizes and the type of pumpkin you're feeding your cat.
                    </p>
                    <!--                    <section class="highlight-box">
                                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/e7df3e14cccc5ef7f965b3be1497edfff50d8e898bde41169dc27fb2d6cf199d?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Rainy weather icon" class="highlight-icon" />
                                            <p class="highlight-text"></p>
                                        </section>-->
                    <h1 class="article-title">Health Benefits of Pumpkin for Cats</h1>
                    <ol class="tips-list">
                        <li>Gastrointestinal upset: Plain pumpkin can be a good source of moisture and fiber for cats experiencing gastrointestinal difficulty.</li>
                        <li>Constipation: Canned pumpkin, which has a higher moisture content, is a good option for cats with mild constipation.</li>
                        <li>Diarrhea: On the other hand, the fiber content of canned pumpkin also helps to bulk stools during episodes of diarrhea.</li>
                        <li>Hairballs: Pumpkin may also be beneficial for cats who are prone to hairballs. Pumpkin can help move the hair through the gastrointestinal tract.</li>
                        <li>Weight loss: Because pumpkin is low in calories, it may also be a good treat option for cats who are obese or need to lose weight.</li>
                    </ol>
                    <figure class="image-gallery">
                        <img src="https://www.thesprucepets.com/thmb/RN8QDxt_fWEiX6AkpYcfpBAW4ug=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/spruce-pets-can-cats-eat-pumpkin-e6c8c011e2784e43ae04054180571049.jpg" alt="" class="gallery-image" />
                    </figure>
                    <h1 class="article-title">How to Feed Pumpkin to Cats</h1>
                    <ul class="additional-tips">
                        <li>You can feed your cat cooked pumpkin, or you can use plain canned or pureed pumpkin from the store. You should introduce pumpkin slowly to your cat, starting with a bite or two. Adult cats can start with 1 teaspoon twice daily. 
                            If your cat takes a liking to the orange stuff, you can slowly increase the amount up to 1 tablespoon twice daily.</li>
                        <li>Stick to feeding your cat the flesh or fruit of the pumpkin. The stem, leaves, skin, and whole seeds could become choking hazards or cause blockages in the stomach or intestines.</li>
                        <li>If you plan to cook your own pumpkin, you can steam or roast the pumpkin flesh. Do not add spices, salt, or oils to the pumpkin. 
                            Alternatively, you can feed your cat canned pumpkin puree by mixing it into the cat’s food.</li>
                    </ul>
                </main>
                <aside class="sidebar">
                    <section class="blog-section">
                        <h2 class="blog-title">Latest Blog</h2>
                        <a href="newsblogDetails_2.jsp" style="text-decoration: none; color: #000; display: block;">
                            <article class="blog-post">
                                <img src="../images/blog1.png" alt="Cat get cold" class="blog-image" />
                                <div class="blog-content">
                                    <h3 class="blog-post-title">Do Cats Get Cold?</h3>
                                    <time class="blog-post-date" datetime="2023-11-12">12 December,2023</time>
                                </div>
                            </article>
                        </a>
                        <a href="newsblogDetails_3.jsp" style="text-decoration: none; color: #000; display: block;">
                            <article class="blog-post">
                                <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/f809568f65ac5782f5ed6f16928d3d01ae9777b5d7dc41e54b06a5d6d9a6d398?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Dog training" class="blog-image" />
                                <div class="blog-content">
                                    <h3 class="blog-post-title">How Much Does Dog Training Cost?</h3>
                                    <time class="blog-post-date" datetime="2024-08-21">21 Aug, 2024</time>
                                </div>
                            </article>
                        </a>
                        <a href="newsblogDetails_4.jsp" style="text-decoration: none; color: #000; display: block;">
                            <article class="blog-post">
                                <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/5e38ca233d506b7b56f7a026a074d2481e81d76407a9e7a5c52523c42875b234?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Puppy crate training" class="blog-image" />
                                <div class="blog-content">
                                    <h3 class="blog-post-title">The Do's and Don'ts of Crate Training a Puppy</h3>
                                    <time class="blog-post-date" datetime="2024-10-03">3 Oct, 2024</time>
                                </div>
                            </article>
                        </a>
                    </section>
                </aside>
            </div>
        </article>
        <%@include file="../includes/footer.jsp"%>
    </center>
</body>
</html>