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
            <img src="https://cdn.mos.cms.futurecdn.net/P6QyJx6sGPFur4pnu7EuDW-650-80.png.webp" alt="" class="hero-image" />
            <div class="content-wrapper">
                <main class="main-news-content">
                    <h1 class="article-title">Do cats get cold? How cold is too cold for cats in winter</h1>
                    <p class="article-intro">
                        If you’ve got a feline friend, then you’ve probably questioned, ‘Do cats get cold?’ at some point in time. 
                        It’s no secret that cats love being warm and sunbathing in the summer, so how do they feel about the winter when the temperature drops?
                    </p>
                    <!--                    <section class="highlight-box">
                                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/e7df3e14cccc5ef7f965b3be1497edfff50d8e898bde41169dc27fb2d6cf199d?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Rainy weather icon" class="highlight-icon" />
                                            <p class="highlight-text">Rain or shine, walk with confidence and care – because every step with your furry friend matters!</p>
                                        </section>-->
                    <ol class="tips-list">
                        <li>The good news is that unless you have a hairless cat or a very short-haired breed, your fur baby’s warm coat will do a great job of insulating them against the cold if they spend most of their time indoors.</li>
                        <li>Outdoor cats are a bit of a different story because they’re at greater risk of hypothermia and frostbite if the temperature gets too low. Thankfully, outdoor cats are pretty good at knowing when it’s time to head back home.</li>
                        <li>That being said, it’s important you don’t leave your cat outdoors in the winter without providing them with one of the best outdoor cat houses as even cats with thick coats can be seriously at risk once the temperature starts to plummet if they don’t have access to warm shelter.</li>
                    </ol>
                    <figure class="image-gallery">
                        <img src="../images/blog1.png" alt="" class="gallery-image" />
                    </figure>
                    <h1 class="article-title">How cold is too cold for cats?</h1>
                    <ul class="additional-tips">
                        <li>"As with humans, all cats will feel the temperature differently," explains Woodnutt. Some aren’t bothered by the cold (especially if they have a thick coat, like the Norwegian Forest Cat or Maine Coon) while others are likely to be a lot more sensitive (such as those adapted to warmer climates, like the Egyptian Mau or Siamese.
                            While it’s hard to put a definite number on it, if you feel cold it’s likely your cat is chilly too. There’s a reason they gravitate towards sunny spots and warm laps!"</li>
                        <li>Temperature, coat type, and weight are all equally important to consider when it comes to how cold is too cold for your feline friend. 
                            Hairless cats and cats that have been shaved down or groomed in any fashion where their hair is cut beyond a minor trim should not be outside in cold weather. Hairless and very short-haired breeds struggle to regulate their body temperature, so even if they're indoors all day, wearing a sweater in the winter is advisable.</li>
                        <li>Obese cats have far more body fat which means they’re better insulated against the cold, but they do move slower than slimmer breeds, so that can cause problems if they’re prone to wandering far from home and get stuck in unexpected extreme weather. 
                            You'll also want to keep a close eye on your kitty if they suffer from any kind of medical condition as ill health can put them at greater risk of hypothermia if they’re outdoors.</li>
                    </ul>
                    <!--<p>By following these tips, you can ensure a safer and more enjoyable walking experience for your dog, even in rainy or flood-prone conditions. Stay safe and keep your furry friend protected!</p>-->
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