<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PetHub</title>
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/checkOut.css">
        <link rel="stylesheet" href="css/footer.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@include file="includes/header.jsp" %>
        <div class="container">
            <div class="main-content">
                <center>
                    <section class="checkout-container">
                        <div class="checkout-information">
                            <form class="billing-information">
                                <h2 class="checkout-title">Check Out Information</h2>
                                <div class="form-container">
                                    <div class="name-company-container">
                                        <div class="name-fields">
                                            <div class="input-group">
                                                <label for="firstName" class="input-label">First name</label>
                                                <input type="text" id="firstName" class="input-field" required>
                                            </div>
                                            <div class="input-group">
                                                <label for="lastName" class="input-label">Last name</label>
                                                <input type="text" id="lastName" class="input-field" required>
                                            </div>
                                        </div>
                                        <div class="company-field">
                                            <label for="companyName" class="company-label">Company Name (Optional)</label>
                                            <input type="text" id="companyName" class="company-input">
                                        </div>
                                    </div>
                                    <div class="address-field">
                                        <label for="address" class="input-label">Address</label>
                                        <input type="text" id="address" class="address-input" required>
                                    </div>
                                    <div class="contact-fields">
                                        <div class="email-field">
                                            <label for="email" class="input-label">Email</label>
                                            <input type="email" id="email" class="contact-input" required>
                                        </div>
                                        <div class="phone-field">
                                            <label for="phone" class="input-label">Phone Number</label>
                                            <input type="tel" id="phone" class="contact-input" required>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <div class="payment-options">
                                <h3 class="payment-title">Payment Option</h3>
                                <div class="payment-methods">
                                    <div class="payment-method">
                                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/024b42f1848824e09483ab0ec0ef26fc588959ec54205cf71673e0c39f64672f?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Cash on Delivery" class="payment-icon">
                                        <span class="payment-name">Cash on Delivery</span>
                                        <input type="radio" name="payment" id="cashOnDelivery" class="payment-radio visually-hidden">
                                        <label for="cashOnDelivery" class="visually-hidden">Cash on Delivery</label>
                                    </div>
                                    <div class="payment-divider"></div>
                                    <div class="payment-divider"></div>
                                    <div class="payment-divider"></div>
                                    <div class="payment-divider"></div>
                                    <div class="vnpay-method">
                                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/dfc5e32f1af95709ba6194b582da6f745934d8eff3ec5130c386760116cb51ff?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="VN Pay" class="vnpay-icon">
                                        <span class="vnpay-title">VN Pay</span>
                                        <input type="radio" name="payment" id="vnpay" class="vnpay-radio visually-hidden" checked>
                                        <label for="vnpay" class="visually-hidden">VN Pay</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <aside class="order-summary">
                            <h3 class="summary-title">Order Summary</h3>
                            <div class="product-list">
                                <div class="product-item">
                                    <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/3acf9a9d08579dc019186cf2333b29d887201f26c5d39e3d070dbcb0cc98f658?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Dog Leash" class="product-image">
                                    <div class="product-details">
                                        <span class="product-name">Dog Leash - Size M - Vani</span>
                                        <div class="product-price">
                                            <span class="quantity">1 x</span>
                                            <span class="price">199.000₫</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-item">
                                    <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/f80d949581a070d2bc3b7fce8c915416ddf78de3eca75da0fe23c86d73c17350?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="Sajo Pet Food" class="product-image">
                                    <div class="product-details">
                                        <span class="product-name">Sajo Pet Food - 20kg</span>
                                        <div class="product-price">
                                            <span class="quantity">3 x</span>
                                            <span class="price">345.000₫</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="total-section">
                                <div class="total-content">
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
                                <div class="total-divider"></div>
                                <div class="grand-total">
                                    <span class="grand-total-label">Total</span>
                                    <span class="grand-total-value">1.249.000₫</span>
                                </div>
                            </div>
                            <button type="submit" class="place-order-btn">
                                <span class="btn-label">Place order</span>
                                <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/1f37a40d0cf74066da562aae06df8a8b035acabf759e0494644e8b377819499a?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" alt="" class="btn-icon">
                            </button>
                            <button type="button" class="cancel-btn">Cancel</button>
                        </aside>
                        <div class="coupon-section">
                            <h3 class="coupon-title">Coupon Code</h3>
                            <form class="coupon-form">
                                <label for="couponCode" class="visually-hidden">Enter Code</label>
                                <input type="text" id="couponCode" class="coupon-input" placeholder="Enter Code">
                                <button type="submit" class="apply-coupon-btn">Apply Coupon</button>
                            </form>
                        </div>
                    </section>
                </center>
            </div>
        </div>

    </body>
    <%@include file="includes/footer.jsp" %>
</html>