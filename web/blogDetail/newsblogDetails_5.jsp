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
            <img src="../images/news3.jpg" alt="" class="hero-image" />
            <div class="content-wrapper">
                <main class="main-news-content">
                    <h1 class="article-title">Cats May Connect to Their Owners Just as Much as Dogs, Study Finds</h1>
                    <p class="article-intro">
                        Researchers at Oregon State University have found that "cats display distinct attachment styles toward human caregivers" and share "social traits once attributed to dogs and humans".
                        While the adage "man's best friend" is still reserved for dogs, a study supports the idea that cats might be just as affectionate.
                        The study, published in Current Biology and conducted by a team at Oregon State University, found that pet cats exhibited distinct attachment styles toward caregivers that are similarly seen in dogs and even babies.
                        The team of researchers examined the traits of 70 kitten and 38 cat subjects, and looked at how they behaved both with and without their human caregivers.
                        The experiment, called an attachment test, placed the felines in a room with their owners for two minutes, before being separated for another two minutes.

                        When they were reunited, researchers kept close watch and categorized the cats' behavior in relation to several specific attachment styles.</p>

                        <p>Researchers found that around 65 percent of the cats (both young and older) exhibited what is known as a "secure" attachment style, meaning they showed signs of distress when their caregivers left the room and a "reduced stress response," or healthy mix of attachment and exploration, when they returned.
                            Around 35 percent exhibited an insecure attachment style, meaning they stayed stressed even when reunited with their owners, and displayed a mix of excessive contact, avoidant, or disorganized behavior when their owners came back into the room.</p>

                        <p>According to the study, the disparity of secure and insecure attachment styles was similar to that found in the findings for human children.

                        The study also noted that similar experiments have previously been performed on primates and dogs, which is where the attachment style criteria came from.
                        In conclusion, the study reported that "cats show a similar capacity for the formation of secure and insecure attachments towards human caregivers previously demonstrated in children ... and dogs," noting that "the majority of individuals in these [cat] populations securely attached to their caregiver."
                    </p>
                    <!--                    <section class="highlight-box">
                                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/e7df3e14cccc5ef7f965b3be1497edfff50d8e898bde41169dc27fb2d6cf199d?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Rainy weather icon" class="highlight-icon" />
                                            <p class="highlight-text">Rain or shine, walk with confidence and care – because every step with your furry friend matters!</p>
                                        </section>-->
                </main>
                <aside class="sidebar">
                    <section class="blog-section">
                        <h2 class="blog-title">Latest Blog</h2>
                        <a href="../newsblogDetails.jsp" style="text-decoration: none; color: #000; display: block;">
                            <article class="blog-post">
                                <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/645ed63efa619f99dd9553063ff261b3775ddedb728f93bec296f632f2ceaa57?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Cat eating pumpkin" class="blog-image" />
                                <div class="blog-content">
                                    <h3 class="blog-post-title">Can Cat Eat Pumpkin?</h3>
                                    <time class="blog-post-date" datetime="2024-10-28">28 Oct, 2024</time>
                                </div>
                            </article>
                        </a>
                        <a href="../newsblogDetails.jsp" style="text-decoration: none; color: #000; display: block;">
                            <article class="blog-post">
                                <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/f809568f65ac5782f5ed6f16928d3d01ae9777b5d7dc41e54b06a5d6d9a6d398?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Dog training" class="blog-image" />
                                <div class="blog-content">
                                    <h3 class="blog-post-title">How Much Does Dog Training Cost?</h3>
                                    <time class="blog-post-date" datetime="2024-08-21">21 Aug, 2024</time>
                                </div>
                            </article>
                        </a>
                        <a href="../newsblogDetails.jsp" style="text-decoration: none; color: #000; display: block;">
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