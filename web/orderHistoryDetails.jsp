<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PetHub</title>  
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/orderHistoryDetails.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    </head>
    <body>
    <center>
        <%@include file="includes/header.jsp"%>
        <div class="main-container">
            <%@include file="includes/userMenu.jsp"%>
            <div class="order-container">
                <div class="products-container">
                    <header class="order-header">
                        <div class="order-title">
                            <a href="orderHistory.jsp">
                                <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/d3a8368e32ab6849e0b920e718917e653e8ff0fca7c206e033fe2a8e99ee65ea?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="order-icon" /></a>
                            <span>Order Details</span>
                        </div>
                        <button class="rating-button" onclick="window.location.href = 'includes/rating.jsp'">
                            <span>Leave a Rating</span>
                            <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/46b9b658abdaaf976f22810fbc9aa6b68f13b2356188c3320e4f62964fcfb5e3?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="rating-icon" />
                        </button>
                    </header>
                    <div class="product-subheader">
                        <div class="product-details">
                            <span class="product-name">Products</span>
                            <span class="product-price">Price</span>
                            <span class="product-quantity">Quantity</span>
                            <span class="product-subtotal">Sub-Total</span>
                        </div>
                    </div>


                    <div class="product-list">
                        <div class="product-item">
                            <div class="product-image-container">
                                <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/8a4b039b7cd14f62caf2b3ab1acbf14578342d3a2560a65d5deec6a6688cdde3?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Dog Leash" class="product-image" />
                                <div class="product-info">
                                    <span class="product-category">ACCESSORIES</span>
                                    <span class="product-name">Dog Leash - Size M - Vani</span>
                                </div>
                            </div>
                            <div class="product-price-details">
                                <span class="product-price">199.000₫</span>
                                <span class="product-quantity">x1</span>
                                <span class="product-subtotal">199.000₫</span>
                            </div>
                        </div>
                        <div class="product-divider"></div>
                        <div class="product-item">
                            <div class="product-image-container">
                                <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/5615c7d0817a6f9d42cec95b3325243ca433607d49a3a0dfabd3d400b7eb7e33?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Pet Food" class="product-image" />
                                <div class="product-info">
                                    <span class="product-category">FOODS</span>
                                    <span class="product-name">Sajo Pet Food - 20kg</span>
                                </div>
                            </div>
                            <div class="product-price-details">
                                <span class="product-price">345.000₫</span>
                                <span class="product-quantity">x3</span>
                                <span class="product-subtotal">1.234.000₫</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="order-tracking">
                    <div class="order-summary">
                        <div class="order-info">
                            <span class="order-number">#96459761</span>
                            <div class="order-meta">
                                <span>4 Products</span>
                                <span>•</span>
                                <span>Order Placed in 17 Sept, 2024 at 7:32 PM</span>
                            </div>
                        </div>
                        <span class="order-total">1.249.000₫</span>
                    </div>
                    <p class="order-arrival">Order expected arrival <strong>23 Sept, 2024</strong></p>
                </div>

                <div class="shipping-billing-notes">
                    <div class="address-section">
                        <h3 class="section-title">Shipping Address</h3>
                        <div class="address-content">
                            <span class="address-name">Kevin Gilbert</span>
                            <span class="address-details">FPT Plaza 1,</span>
                            <div class="contact-info">
                                <span class="contact-label">Phone Number:</span>
                                <span class="contact-value">+1-202-555-0118</span>
                            </div>
                            <div class="contact-info">
                                <p><span class="contact-label">Email:</span> <span class="contact-value">kevin.gilbert@gmail.com</span></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="includes/footer.jsp"%>
    </center>
</body>
</html>
