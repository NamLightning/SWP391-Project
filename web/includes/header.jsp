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

    .popup-hover2 {
        display: none; /* Hidden by default */
        padding: 10px;
        background-color: #f0f0f0;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        width: 200px;
        position: absolute;
        right: 50px;
        z-index: 100;
    }
    .popup-hover img{
        width: 50%;
        height: 50%;
    }
</style>
<style>
.shopping-cart {
  padding: 0 0 24px;
  border-radius: 4px;
  border: 1px solid #e4e7e9;
  background: #fff;
  box-shadow: 0 8px 40px rgba(0, 0, 0, 0.12);
  max-width: 376px;
  width: 100%;
  font: 14px Public Sans, sans-serif;
}

.cart-popup-header {
  width: auto;
  background: #fff;
  box-shadow: 0 -1px 0 0 #e4e7e9 inset;
  font-size: 16px;
  color: #5f6c72;
  font-weight: 500;
  line-height: 24px;
  padding: 16px 24px;
}

.cart-count {
  font-weight: 400;
  color: #5f6c72;
}

.product-popup-list {
  display: flex;
  margin-top: 20px;
  flex-direction: column;
}

.product-popup-item {
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 3px;
  background: #fff;
  gap: 16px;
  margin-top: 16px;
}

.product-popup-image {
  aspect-ratio: 1;
  object-fit: contain;
  width: 80px;
}

.product-popup-details {
  display: flex;
  flex-direction: column;
  width: 200px;
}

.product-popup-name {
  color: #191c1f;
  font-weight: 400;
  line-height: 20px;
}

.product-popup-price {
  display: flex;
  margin-top: 8px;
  align-items: start;
  gap: 4px;
  line-height: 1;
}

.quantity-popup {
  color: #5f6c72;
  font-weight: 400;
}

.price-popup {
  color: #2da5f3;
  font-weight: 600;
}

.remove-icon {
  width: 16px;
}

.divider-popup {
  background-color: #e4e7e9;
  height: 1px;
  margin-top: 20px;
  width: 100%;
}

.subtotal-popup {
  display: flex;
  margin-top: 20px;
  justify-content: space-between;
  padding: 0 24px;
}

.subtotal-label-popup {
  color: #475156;
  font-weight: 400;
}

.subtotal-amount-popup {
  color: #191c1f;
  font-weight: 500;
}

.cart-actions-popup {
  display: flex;
  margin-top: 20px;
  padding: 0 24px;
  flex-direction: column;
  gap: 12px;
}

.btn {
  border-radius: 2px;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.17px;
  line-height: 48px;
  text-align: center;
  cursor: pointer;
}

.btn-primary {
  background-color: #fd7e14;
  color: #fff;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  border-style: hidden;
}

.btn-secondary {
  color: #fd7e14;
  background-color: #ffffff;
  border: 2px solid #fa8232;
}

</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css">
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
                        <div class="location-info" style="padding-right:5px;">
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
                                <div id="hoverItem">
                                    <span style="text-decoration: none; color: #000;">Hi, ${us}</span>
                                    <a href="userProfile.jsp">
                                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/9d9994c0a1b936c2427317594bc441b8fcc98af8133e59027568749dfd2cb1ae?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" alt="User avatar" class="user-avatar" />
                                        <%@include file="userMenu.jsp" %>
                                    </a>
                                </div>
                            </c:if>
                        </div>
                    </div>
                    <nav class="main-nav">
                        <div class="brand">
                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/414bc3aa4ba1b0e046c9120ca0cecefee610e27e98072a299dbc81848a1ae88c?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" alt="Pet Hub logo" class="brand-logo" />
                            <a href="homePage.jsp" style="color: #000;text-decoration: none;">Pet Hub</a>
                        </div>
                        <ul class="nav-menu">
                            <li class="nav-item"><a href="CategoriesControl">Items</a></li>
                            <li class="nav-item"><a href="servicePage.jsp">Service</a></li>
                            <li class="nav-item"><a href="news_blog.jsp">News & Blog</a></li>
                            <li class="nav-item"><a href="contactUsPage.jsp">Contact Us</a></li>
                        </ul>
                        <form class="search-container">
                            <input type="text" id="search-input" class="search-input" style="padding-left: 5%;" placeholder="  Search products...">
                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/f54504702ed8a70ca94c77306304e000bffd092436dcd387934a645a88007bc1?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" alt="Search Icon" class="search-icon">
                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/45b4a97be78e3927557d72496281145219fc1416258a4802e859df73cb06928a?placeholderIfAbsent=true&apiKey=1d890b3ac32c4e0faad33073d6425f1b" alt="Cart Icon" class="cart-icon" id="hoverItem2" onclick="location.href = 'cart.jsp'">
                            <div class="popup-hover" id="popupHover2">
                                <c:if test="${empty us}"> <!-- <- This line is for Guest -->
                                    <%@include file="cartPopup.jsp" %>
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
                                    <section class="shopping-cart">
                                        <header class="cart-header">
                                            Shopping Cart <span class="cart-count">(${carts.size()})</span>
                                        </header>
                                        <div class="product-popup-list">
                                            <c:forEach var="c" items="${carts}">
                                                <c:url var="deleteLink" value="CartControl">
                                                    <c:param name="action" value="delete"></c:param>
                                                    <c:param name="cid" value="${c.getCartItemID()}"></c:param>
                                                </c:url>
                                                <article class="product-popup-item">
                                                    <img src="${reuse.loadImage(pDAO.checkExist(c.getProductID()).getAvatar_img())}" alt="..." class="product-image">
                                                    <div class="product-popup-details">
                                                        <h3 class="product-popup-name">${pDAO.checkExist(c.getProductID()).getProductName()}</h3>
                                                        <div class="product-popup-price">
                                                            <span class="quantity-popup">${c.getQuantity()}</span> <span>x</span> <span class="price-popup">${pDAO.checkExist(c.getProductID()).getPrice()}₫</span>
                                                        </div>
                                                    </div>
                                                    <button class="remove-item" aria-label="Remove Canon EOS 1500D from cart" type="button" onclick="window.location.href = '${deleteLink}'"><img src="https://cdn.builder.io/api/v1/image/assets/TEMP/c91e37402f51849aa5fb805e073a5241b50541d17ba1bfd5a828b560ec357a1f?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="remove-icon" /></button>
                                                </article>
                                                <c:set var="itemTotal" value="${pDAO.checkExist(c.getProductID()).getPrice() * c.getQuantity()}" />
                                                <c:set var="totalPrice" value="${totalPrice + itemTotal}" />
                                            </c:forEach>
                                        </div>
                                        <div class="divider-popup" role="separator"></div>
                                        <div class="subtotal-popup">
                                            <span class="subtotal-popup-label">Sub-Total:</span><span class="subtotal-popup-amount">${totalPrice}₫</span>
                                        </div>
                                        <div class="cart-actions">
                                            <button class="btn btn-primary" type="button" onclick="window.location.href = 'checkOut.jsp'">Checkout Now<img src="https://cdn.builder.io/api/v1/image/assets/TEMP/0bfd7ef916026eff87b43b560d5575f85e58e7b5c3fa9b0f3710711f43901ee6?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" aria-hidden="true" /></button>
                                            <button class="btn btn-secondary" type="button" onclick="window.location.href = 'cart.jsp'">View Cart</button>
                                        </div>
                                    </section>
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
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
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
                                                                });</script>
<script>
                    // Get elements
                    const hoverItem2 = document.getElementById('hoverItem2');
                    const popupHover2 = document.getElementById('popupHover2');
                    // Function to show popup
                            function showPopup2() {
                            popupHover2.style.display = 'block';
                            }

                    // Function to hide popup
                    function hidePopup2() {
                    popupHover2.style.display = 'none';
                    }

                    // Show popup when mouse enters hoverItem or popupHover
                    hoverItem2.addEventListener('mouseenter', showPopup2);
                            popupHover2.addEventListener('mouseenter', showPopup2);
                            // Hide popup when mouse leaves both hoverItem and popupHover
                            hoverItem2.addEventListener('mouseleave', () => {
                            setTimeout(() => {
                            if (!popupHover2.matches(':hover') && !hoverItem2.matches(':hover')) {
                            hidePopup2();
                            }
                            }, 100); // Small delay to allow mouse to move between elements
                            });
                            popupHover2.addEventListener('mouseleave', () => {
                            setTimeout(() => {
                            if (!popupHover2.matches(':hover') && !hoverItem2.matches(':hover')) {
                            hidePopup2();
                            }
                            }, 100);
                            });
</script>
