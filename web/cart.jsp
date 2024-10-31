<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PetHub</title>
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/cart.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@include file="includes/header.jsp" %>
        <div class="main-cart-container">
            <section class="shopping-cart-container">
                <div class="shopping-cart-layout">
                    <div class="cart-items-column">
                        <div class="shopping-card">
                            <h2 class="card-heading">Shopping Card</h2>
                            <div class="card-subheading">
                                <span class="products-label">Products</span>
                                <span class="price-label">Price</span>
                                <span class="quantity-label">Quantity</span>
                                <span class="subtotal-label">Sub-Total</span>
                            </div>
                            <div class="product-list">
                                <div class="product-item">
                                    <input type="checkbox" class="checkbox"/>
                                    <!--<img src="https://cdn.builder.io/api/v1/image/assets/TEMP/39e586d401e1f781a03ffa2ba7bbd367778422bc800ef03b16340aac620abd30?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="product-icon" />-->
                                    <div class="product-details">
                                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/89a9ba1deb831d0eb4b10822e08b22bbc79c2a4571dae5d55b5c790bd9e1e3ba?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Dog Leash" class="product-image" />
                                        <span class="product-name">Dog Leash - Size M - Vani</span>
                                    </div>
                                    <span class="product-price">199.000₫</span>
                                    <div class="quantity-selector">
                                        <div class="quantity-button">
                                            <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/ba388e0eabad954235024ee887707edd5d6e5c8af2f51cf95d84f47e8d6d2fd9?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="img-8" alt="Decrease quantity" onclick="decreaseQuantity()" />
                                            <div data-layername="01" class="quantity-value" id="quantity">01</div>
                                            <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/c4ef0281caf6e16bf01681ba248222d77473d0422e9e910a1484d63287f291cf?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="img-9" alt="Increase quantity" onclick="increaseQuantity()" />
                                        </div>
                                    </div>
                                    <span class="product-subtotal">199.000₫</span>
                                    <a href="#" style="text-decoration: none;">
                                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/845ef8f109e4938e3b5fce1aaeca34ea645a24fc1223763708662246a39f8930?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Remove item" class="remove-icon" /></a>
                                </div>
                                <div class="product-item">
                                    <input type="checkbox" class="checkbox"/>
                                    <!--<img src="https://cdn.builder.io/api/v1/image/assets/TEMP/f3a9892601d2dcb9663593a4668d494f5033a538aea375ec7b94a560657b84f4?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="product-icon" />-->
                                    <div class="product-details">
                                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/8ee76b8c06d5632fe5c8151a61e621e575d08ed3fd356204be34d4b39267b9df?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Sajo Pet Food" class="product-image" />
                                        <span class="product-name">Sajo Pet Food - 20kg</span>
                                    </div>
                                    <span class="product-price">345.000₫</span>
                                    <div class="quantity-selector">
                                        <div class="quantity-button">
                                            <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/ba388e0eabad954235024ee887707edd5d6e5c8af2f51cf95d84f47e8d6d2fd9?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="img-8" alt="Decrease quantity" onclick="decreaseQuantity()" />
                                            <div data-layername="01" class="quantity-value" id="quantityy">03</div>
                                            <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/c4ef0281caf6e16bf01681ba248222d77473d0422e9e910a1484d63287f291cf?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="img-9" alt="Increase quantity" onclick="increaseQuantity()" />
                                        </div>
                                    </div>
                                    <span class="product-subtotal">1.234.000₫</span>
                                    <a href="#" style="text-decoration: none;">
                                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/e24300aee460dbd925f70c0c2cb4f8306fdecb78dc972fab5208d649bd8868e7?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Remove item" class="remove-icon" /></a>
                                </div>
                            </div>
                            <!--<hr class="cart-divider" />-->
                        </div>
                    </div>
                    <div class="cart-summary-column">
                        <div class="cart-total">
                            <h3 class="total-heading">Card Totals</h3>
                            <div class="total-content">
                                <div class="total-details">
                                    <div class="total-row">
                                        <span class="total-label">Sub-total</span>
                                        <span class="total-value">1.234.000₫</span>
                                    </div>
                                    <div class="total-row">
                                        <span class="total-label">Shipping</span>
                                        <span class="total-value">Free</span>
                                    </div>
                                    <div class="total-row">
                                        <span class="total-label">Discount</span>
                                        <span class="total-value">0</span>
                                    </div>
                                    <div class="total-row">
                                        <span class="total-label">Tax</span>
                                        <span class="total-value">15.000₫</span>
                                    </div>
                                </div>
                                <hr class="total-divider" />
                                <div class="grand-total">
                                    <span class="grand-total-label">Total</span>
                                    <span class="grand-total-value">1.249..000₫</span>
                                </div>
                            </div>
                            <button class="buy-now-button">
                                <span class="button-label">BUY NOW</span>
                                <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/a5b1ffe29b68895324ddf197d8ed231c0dff565b516fd161dc7f990933da2c9e?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="button-icon" />
                            </button>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </body>
    <%@include file="includes/footer.jsp" %>
    <script src="js/editQuantity.js"></script>
</html>