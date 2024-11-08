<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>PetHub</title>
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/checkOut.css">
        <link rel="stylesheet" href="css/footer.css">
        <script src="assets/jquery-1.11.3.min.js"></script>
        <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@include file="includes/header.jsp" %>
        <div class="check-out-container">
            <div class="main-checkOut">
                <center>
                    <section class="checkout-container">
                        <!-- grid 1 -->
                        <div class="checkout-information">

                            <h2 class="checkout-title">Check Out Information</h2>
                            <div class="form-container">
                                <div class="name-company-container">
                                    <div class="name-fields">
                                        <div class="input-group">
                                            <label for="firstName" class="input-label" placeholder="First name">First
                                                name</label>
                                            <input type="text" id="firstName" class="input-field" required>
                                        </div>
                                        <div class="input-group">
                                            <label for="lastName" class="input-label" placeholder="Last name">Last
                                                name</label>
                                            <input type="text" id="lastName" class="input-field" required>
                                        </div>
                                    </div>
                                    <div class="company-field">
                                        <label for="companyName" class="input-label">Company Name (Optional)</label>
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

                            <div class="payment-options">
                                <h3 class="payment-title">Payment Option</h3>
                                <div class="payment-methods">
                                    <div class="payment-method">
                                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/024b42f1848824e09483ab0ec0ef26fc588959ec54205cf71673e0c39f64672f?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8"
                                             alt="Cash on Delivery" class="payment-icon">
                                        <span class="payment-name">Cash on Delivery</span>
                                        <input type="radio" name="payment" id="cashOnDelivery"
                                               class="payment-radio visually-hidden">
                                        <label for="cashOnDelivery" class="visually-hidden"></label>
                                    </div>
                                    <div class="payment-divider"></div>
                                    <div class="payment-divider"></div>
                                    <div class="payment-divider"></div>
                                    <div class="payment-divider"></div>
                                    <div class="payment-method">
                                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/dfc5e32f1af95709ba6194b582da6f745934d8eff3ec5130c386760116cb51ff?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8"
                                             alt="VN Pay" class="payment-icon">
                                        <span class="payment-name">VN Pay</span>
                                        <input type="radio" name="payment" id="vnpay" class="payment-radio visually-hidden"
                                               checked>
                                        <label for="vnpay" class="visually-hidden"></label>
                                    </div>
                                </div>
                            </div>


                            <div class="infor-options">
                                <h3 class="payment-title">Additional Information</h3>
                                <div class="addInfor-container">
                                    <h5 class="addinfor-title">Order Notes (Optional)</h5>
                                    <textarea id="addinfor" class="addinfor-input" rows="4"
                                              placeholder="Notes about your order, e.g.special notes for delivery"></textarea>
                                </div>
                            </div>
                        </div>



                        <!-- grid 2 -->
                        <div class="order-information">
                            <aside class="order-summary">
                                <form action="vnpayajax" id="frmCreateOrder" method="post">    
                                    <h3 class="summary-title">Order Summary</h3>
                                    <div class="product-list">
                                        <c:forEach var="c" items="${checkout}">
                                            <input type="text" name="id" value="${c.getCartItemID()}" hidden/>
                                            <div class="product-item">
                                                <img src="${reuse.loadImage(pDAO.checkExist(c.getProductID()).getAvatar_img())}" alt="..." class="product-image">
                                                <div class="product-details">
                                                    <span class="product-name">${pDAO.checkExist(c.getProductID()).getProductName()}</span>
                                                    <div class="product-price">
                                                        <span class="price">${pDAO.checkExist(c.getProductID()).getPrice()}₫</span>
                                                        <span class="quantity"> x ${c.getQuantity()}</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <div class="total-section">
                                        <div class="total-content">
                                            <div class="total-row">
                                                <span class="total-label">Sub-total</span>
                                                <span class="total-value">${price}₫</span>
                                            </div>
                                            <div class="total-row">
                                                <span class="total-label">Shipping</span>
                                                <span class="total-value">Free</span>
                                            </div>
                                            <div class="total-row">
                                                <span class="total-label">Discount</span>
                                                <span class="total-value">0</span>
                                            </div>
                                            <!--                                        <div class="total-row">
                                                                                        <span class="total-label">Tax</span>
                                                                                        <span class="total-value">15.000₫</span>
                                                                                    </div>-->
                                        </div>
                                        <div class="total-divider"></div>
                                        <c:if test="${not empty price}">
                                            <input id="amount" name="amount" type="text" value="${price}" hidden/>
                                        </c:if>
                                        <c:if test="${empty price}">
                                            <input id="amount" name="amount" type="text" value="50000" hidden/>
                                        </c:if>
                                        <div class="grand-total">
                                            <span class="grand-total-label">Total</span>
                                            <span class="grand-total-value">${price}₫</span>
                                        </div>
                                    </div>
                                    <button type="submit" class="place-order-btn">
                                        <span class="btn-label">Place order</span>
                                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/1f37a40d0cf74066da562aae06df8a8b035acabf759e0494644e8b377819499a?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8"
                                             alt="" class="btn-icon">
                                    </button>
                                    <button type="button" class="cancel-btn">Cancel</button>
                                </form>

                            </aside>

                            <div class="coupon-section">
                                <h3 class="coupon-title">Coupon Code</h3>
                                <!--<form class="coupon-form">-->
                                    <!--                                <label for="couponCode" class="visually-hidden">Enter Code</label>
                                                                    <input type="text" id="couponCode" class="coupon-input" placeholder="Enter Code">-->
                                    <div class="coupon-choose">
                                        <label for="couponCode" class="visually-hidden" style="text-align: left;margin-right: 120px; font-weight: 600;">Coupons</label>
                                        <a href="${pageContext.request.contextPath}/includes/promotionCart.jsp" style="text-decoration: none; color: orange; text-align: left;">Choose your promotions</a>
                                    </div>
                                    <button type="submit" class="apply-coupon-btn">Apply Coupon</button>
                                <!--</form>-->
                            </div>
                        </div>
                    </section>
                </center>
            </div>
        </div>
        <%@include file="includes/footer.jsp" %>

        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script type="text/javascript">
            $("#frmCreateOrder").submit(function () {
                var postData = $("#frmCreateOrder").serialize();
                var submitUrl = $("#frmCreateOrder").attr("action");
                $.ajax({
                    type: "POST",
                    url: submitUrl,
                    data: postData,
                    dataType: 'JSON',
                    success: function (x) {
                        if (x.code === '00') {
                            if (window.vnpay) {
                                window.location.href = x.data;
//                                vnpay.open({width: 768, height: 600, url: x.data});
                            } else {
                                window.location.href = x.data;
                            }
                            return false;
                        } else {
                            alert(x.Message);
                        }
                    }
                });
                return false;
            });
        </script>    
    </body>
</html>