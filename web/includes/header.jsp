<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<header>
    <center>
        <div class="container">
            <div class="left-sidebar"></div>
            <div class="main-content">
                <header class="header">
                    <div class="top-bar">
                        <div class="contact-info" style="margin-top: 0;">
                            <div class="phone-number">
                                <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/c2f9d63fab85b206bc10ae5040360353f1243581ebadde50d05aa9b213830e0d?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" alt="" class="icon" />
                                <span>+84 357572079</span>
                            </div>
                        </div>
                        <div class="location-info"style="padding-right:5px;">
                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/0459a1766085384576accced4da0e6d1e8a5e9e88191f8dad13bb1d757e0fe77?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" alt="" class="icon" />
                            <span>FPT Plaza, Ngu Hanh Son District, Da Nang</span>
                        </div>              
                        <div class="user-profile">
                            <c:if test="${empty us}">
                                <span><a href="login.jsp" style="text-decoration:0; color:#000" class="button">Login</a></span>
                                <span>|</span>
                                <span><a href="signUp.jsp" style="text-decoration:0; color:#000" class="button">Sign Up</a></span>
                            </c:if>
                            <c:if test="${not empty us}">
                                <a href="userProfile.jsp">
                                <span>Hi,User</span>
                                <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/9d9994c0a1b936c2427317594bc441b8fcc98af8133e59027568749dfd2cb1ae?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" alt="User avatar" class="user-avatar" />
                                </a>
                            </c:if>
                        </div>
                    </div>
                    <nav class="main-nav">
                        <div class="brand">
                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/414bc3aa4ba1b0e046c9120ca0cecefee610e27e98072a299dbc81848a1ae88c?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" alt="Pet Hub logo" class="brand-logo" />
                            <a href="homePage.jsp" style="color: #000;text-decoration: none;">Pet Hub</a>
                        </div>
                        <ul class="nav-menu">
                            <li class="nav-item"><a href="petFood.jsp">Items</a></li>
                            <li class="nav-item"><a href="servicePage.jsp">Service</a></li>
                            <li class="nav-item"><a href="news_blog.jsp">News & Blog</a></li>
                            <li class="nav-item"><a href="contactUsPage.jsp">Contact Us</a></li>
                        </ul>
                        <form class="search-container">
                            <input type="text" id="search-input" class="search-input" style="padding-left: 5%;" placeholder="  Search products...">
                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/f54504702ed8a70ca94c77306304e000bffd092436dcd387934a645a88007bc1?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" alt="Search Icon" class="search-icon">
                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/45b4a97be78e3927557d72496281145219fc1416258a4802e859df73cb06928a?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" alt="Cart Icon" class="cart-icon">
                        </form>
                    </nav>
                </header>
            </div>
            <div class="left-sidebar"></div>
        </div>
    </center>
</header>
