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
            <img src="https://a.storyblok.com/f/152976/1254x837/b9d1a97ac8/istock-1290792821.jpg/m/fit-in/1152x0/filters:format(webp):quality(100)" alt="" class="hero-image" />
            <div class="content-wrapper">
                <main class="main-news-content">
                    <h1 class="article-title">The Do And Don't Of Crate Training A Puppy</h1>
                    <p class="article-intro">
                        You’ve got a new puppy, which means hours of playing, exploring… and getting them used to their new home. 
                        Crates are a popular and effective training tool for dogs of all ages. 
                        However, since puppies are easier to train than older dogs, it’s better to introduce them to crates while they’re still young.
                    </p>
                    <!--                    <section class="highlight-box">
                                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/e7df3e14cccc5ef7f965b3be1497edfff50d8e898bde41169dc27fb2d6cf199d?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Rainy weather icon" class="highlight-icon" />
                                            <p class="highlight-text">Rain or shine, walk with confidence and care – because every step with your furry friend matters!</p>
                                        </section>-->
                    <h1 class="article-title">How to crate train a puppy?</h1>
                    <ol class="tips-list">
                        <li>Crate or kennel training a puppy means introducing them to an indoor dog crate or kennel. You can use a crate as a safe and secure den for your new puppy to help them rest and relax for short periods of time.</li>
                        <li>Crates are suitable for dogs of all ages but are particularly popular with owners of puppies that are house training.</li>
                        <li>Puppies can be quite destructive when they arrive in their new homes. Some common issues include puppies going to the toilet in the wrong places, and causing damage to furniture by chewing. You can use a crate for training to help reduce these incidents.</li>
                        <li>Crates can also stop your puppy accidentally injuring themselves by eating and chewing things they shouldn't.</li>
                        <li>It's a good idea to take out puppy insurance as soon as you bring your new friend home so you're covered for any mishaps as soon as possible.</li>
                    </ol>
                    <figure class="image-gallery">
                        <img src="../images/blog3.png" alt="" class="gallery-image" />
                    </figure>
                    <ul class="additional-tips">
                        <li>When your dog or puppy can remain calm and relaxed inside their crate for more than 30 minutes, that’s usually a good sign that they’re now comfortable with their crate.</li>
                        <li>Once you’ve managed to house train your dog you may find that you don’t need to use the crate as often. You might even decide you don’t need to use a crate after house training has finished, but lots of owners continue using it as a safe den-like area for their dogs.</li>
                        <li>The choice will depend on each individual dog and the personal circumstances of their owners.</li>
                        <li>Crate training has become a popular discussion topic among dog owners. The benefits are that it teaches your dog how to behave in your home, as well as giving them a comfortable, safe place if they feel stressed or overwhelmed.</li>
                        <li>Don’t leave your dog inside a crate for hours on end, and always make sure you use your crate for the right reasons. Crate training is just a small part of caring for your puppy and if you’re worried about protecting them, it’s always a good idea to consider insurance coverage for any accidents or illnesses they might suffer as they’re growing up. To find out more, get a ManyPets puppy insurance quote in seconds. </li>
                    </ul>
                </main>
                <aside class="sidebar">
                    <section class="blog-section">
                        <h2 class="blog-title">Latest Blog</h2>
                        <a href="newsblogDetails_1.jsp" style="text-decoration: none; color: #000; display: block;">
                            <article class="blog-post">
                                <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/645ed63efa619f99dd9553063ff261b3775ddedb728f93bec296f632f2ceaa57?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Cat eating pumpkin" class="blog-image" />
                                <div class="blog-content">
                                    <h3 class="blog-post-title">Can Cat Eat Pumpkin?</h3>
                                    <time class="blog-post-date" datetime="2024-10-28">28 Oct, 2024</time>
                                </div>
                            </article>
                        </a>
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