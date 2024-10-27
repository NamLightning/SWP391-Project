<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<%@page import="Utils.Reuseable, Dao.CartItemsDAO, java.util.ArrayList, Model.CartItems, Model.Customer, Dao.CustomerDAO, Model.Item, Dao.ItemDAO"%>
<jsp:useBean id="reuse" class="Utils.Reuseable" scope="page"/>
<jsp:useBean id="pDAO" class="Dao.ItemDAO" scope="page"/>
<style>
    /* Styling the hover trigger item */
    .hover-item {
        display: inline-block;
        padding: 10px;
        background-color: #007bff;
        color: white;
        cursor: pointer;
        border-radius: 5px;
        margin-bottom: 10px;
    }

    /* Styling the popup */
    .popup-hover {
        display: none; /* Hidden by default */
        padding: 10px;
        background-color: #f0f0f0;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        width: 200px;
        position: absolute;
        top: 45px; /* Adjust based on the desired popup position */
        left: 250px;
        z-index: 100;
    }
    .popup-hover img{
        width: 50%;
        height: 50%;
    }
    .remove-button,
        .quantity-button {
            background-color: transparent;
            border: none;
            color: #333;
            font-size: 20px;
            cursor: pointer;
        }
</style>
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
                                    <span>Hi, ${us}</span>
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

                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/45b4a97be78e3927557d72496281145219fc1416258a4802e859df73cb06928a?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" alt="Cart Icon" class="cart-icon" id="hoverItem" onclick="location.href = 'cart.jsp'">
                            <div class="popup-hover" id="popupHover">
                                <c:if test="${empty us}"> <!-- <- This line is for Guest -->
                                    Coming soon!
                                </c:if>
                                <c:if test="${not empty us}"> <!-- <- This line is for Customer -->
                                    <c:set var="totalPrice" value="0" scope="page"/>
                                    <%
                                        CartItemsDAO cartItemsDAO = new CartItemsDAO();
                                        CustomerDAO customerDAO = new CustomerDAO();
                                        String username = (String) session.getAttribute("us");
                                        Customer c = customerDAO.findCustomerByUsername(username);
                                        ArrayList<CartItems> cartList = cartItemsDAO.getAllCartItems(c.getCustomerID());
                                        pageContext.setAttribute("carts", cartList);
                                    %>
                                    <h3>Shopping Cart (${carts.size()})</h3>
                                    <c:forEach var="c" items="${carts}">
                                        <c:url var="deleteLink" value="CartControl">
                                            <c:param name="action" value="delete"></c:param>
                                            <c:param name="cid" value="${c.getCartItemID()}"></c:param>
                                        </c:url>
                                        <img src="${reuse.loadImage(pDAO.checkExist(c.getProductID()).getAvatar_img())}" alt="..." class="product-image">
                                        <div class="item">
                                            <p>${pDAO.checkExist(c.getProductID()).getProductName()}</p>
                                            <p>${c.getQuantity()} x ${pDAO.checkExist(c.getProductID()).getPrice()}₫</p>
                                            <button class="remove-button" type="button" onclick="window.location.href = '${deleteLink}'"><i class="fas fa-times"></i></button>
                                        </div>
                                        <c:set var="itemTotal" value="${pDAO.checkExist(c.getProductID()).getPrice() * c.getQuantity()}" />
                                        <c:set var="totalPrice" value="${totalPrice + itemTotal}" />
                                    </c:forEach>
                                    <div class="subtotal">
                                        <p>Sub-Total: ${totalPrice}₫</p>
                                    </div>
                                    <button type="button" onclick="window.location.href = 'checkOut.jsp'">Checkout Now</button>
                                    <button type="button" onclick="window.location.href = 'cart.jsp'">View Cart</button>
                                </c:if>
                            </div>
                        </form>
                    </nav>
                </header>
            </div>
            <div class="left-sidebar"></div>
        </div>
    </center>
</header>
<script>
            // Get elements
            const hoverItem = document.getElementById('hoverItem');
            const popupHover = document.getElementById('popupHover');
            // Function to show popup
                    function showPopup() {
                    popupHover.style.display = 'block';
                    }

            // Function to hide popup
            function hidePopup() {
            popupHover.style.display = 'none';
            }

            // Show popup when mouse enters hoverItem or popupHover
            hoverItem.addEventListener('mouseenter', showPopup);
                    popupHover.addEventListener('mouseenter', showPopup);
                    // Hide popup when mouse leaves both hoverItem and popupHover
                    hoverItem.addEventListener('mouseleave', () => {
                    setTimeout(() => {
                    if (!popupHover.matches(':hover') && !hoverItem.matches(':hover')) {
                    hidePopup();
                    }
                    }, 100); // Small delay to allow mouse to move between elements
                    });
                    popupHover.addEventListener('mouseleave', () => {
                    setTimeout(() => {
                    if (!popupHover.matches(':hover') && !hoverItem.matches(':hover')) {
                    hidePopup();
                    }
                    }, 100);
                    });
</script>
