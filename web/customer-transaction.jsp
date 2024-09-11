<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="Utils.CookieUtils" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    </head>
    <body>
        <form action="OrderServlet" method="GET" enctype="multipart/form-data">
            <c:forEach var="s" items="${ship.getAllOrderDetailsForCustomer(customerID)}">
                <c:if test="${s.getCust_Rating() != null}">

                    <input type="hidden" name="action" value="rating" />
                    <div class="card col-md-7 bg-light">
                        <div class="row g-0">
                            <div class="col-md-3">
                                <img src="images/Profile.png" class="img-fluid rounded-start" alt="...">
                            </div>
                            <div class="col-md-9">
                                <div class="card-body text-start">
                                    <h5 class="card-title">Order</h5>

                                    <c:set var="pkg" value="${p.getPackageDetailsByOrderID(s.getOrder_ID())}" />

                                    <p class="card-text">To: <c:if test="${not empty pkg.getFinal_apartment_number()}">${pkg.getFinal_apartment_number()},</c:if> ${pkg.getFinal_street_name()}, ${pkg.getFinal_District()}, ${pkg.getFinal_Ward()}, ${pkg.getFinal_city()} </p>
                                    <p class="card-text">Phone: ${pkg.getFinal_Phone()} </p>
                                    <p class="card-text">Request day: ${s.getOrder_Date()} - ${pkg.getRequested_Delivery_Date()} </p>

                                </div>
                            </div>
                        </div>

                        <p>
                            <a class="btn btn-primary" data-bs-toggle="collapse" href="#${s.getOrder_ID()}" role="button" aria-expanded="false" aria-controls="${s.getOrder_ID()}">Extend</a>
                        </p>

                        <div class="collapse" id="${s.getOrder_ID()}">
                            <hr style="max-width: 700px; margin: 0 auto;">
                            <div class="content row g-0" style="margin: 20px 0;">
                                <div class="row nothing">
                                    <p class="col-md-3">Service Quality :</p>
                                    <div class="stars col-md-2 rating" style="margin-top: -5px;">
                                        <input type="radio" name="star" id="star5" value="5"><label for="star5" title="Awesome - 5 stars">★</label>
                                        <input type="radio" name="star" id="star4" value="4"><label for="star4" title="Pretty good - 4 stars">★</label>
                                        <input type="radio" name="star" id="star3" value="3"><label for="star3" title="Meh - 3 stars">★</label>
                                        <input type="radio" name="star" id="star2" value="2"><label for="star2" title="Kinda bad - 2 stars">★</label>
                                        <input type="radio" name="star" id="star1" value="1"><label for="star1" title="Sucks big time - 1 star">★</label>
                                    </div>
                                    <div id="ratingResult" class="mt-3"></div>
                                </div>

                                <div class="actions row nothing" style="margin: 0 auto; margin-top: 10px;">
                                    <div class="upload-button col-md-3">
                                        <button class="btn btn-custom btn-photo" onclick="document.getElementById('imageUpload').click()">
                                            <div class="button-content">
                                                <span class="hover-text">Add Photo</span>
                                            </div>
                                        </button>
                                        <input type="file" id="imageUpload" accept="image/*" class="hidden" onchange="showFileName(event, 'imageFileName')">
                                    </div>

                                    <!--                                    <div class="upload-button col-md-3">
                                                                            <button class="btn btn-custom btn-video" onclick="document.getElementById('videoUpload').click()">
                                                                                <div class="button-content">
                                                                                    <span class="hover-text">Add Video</span>
                                                                                </div>
                                                                            </button>
                                                                            <input type="file" id="videoUpload" accept="video/*" class="hidden" onchange="showFileName(event, 'videoFileName')">
                                                                        </div>-->
                                </div>
                                <div id="imageFileName" class="file-name"></div>
                                <!--<div id="videoFileName" class="file-name"></div>-->

                            </div>
                            <div class="content row">
                                <div class="feedback col-md-10" style="margin: 0 auto;">
                                    <label for="comment" class="form-label" style="margin-right: 1000px;">Comment: </label>
                                    <textarea id="comment" name="comment" placeholder="Write your feedback here..."></textarea>
                                </div>
                            </div>
                            <br>
                            <input type="submit" class="btn btn-primary" style="margin: 10px;margin-top: -20px;" value="Rating" />

                        </div>
                    </div>
                    <br>
                </c:if>
            </c:forEach>
        </form>

        <script src="./js/header-home.js"></script>

    </body>
</html>