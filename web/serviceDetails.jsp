<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="serDAO" class="Dao.ServicesDAO" scope="page"/>
<%@page import="Model.Services, Utils.Reuseable, java.util.ArrayList"%>
<jsp:useBean id="reuses" class="Utils.Reuseable" scope="page"/>
<%@page import="Model.Customer"%>
<%@page import="Dao.CustomerDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PetHub</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}css/serviceindex.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}css/footer.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    </head>

    <%
        String serviceId = request.getParameter("serghfgfgf");
        Services sao = null;
        if (serviceId == null || serviceId.isEmpty()) {
            out.println("serviceId parameter is missing.");
        } else {
            sao = serDAO.checkExist(Integer.parseInt(serviceId));
            if (sao != null) {
                request.setAttribute("sao", sao);
            }
        }

        CustomerDAO customerDAO2 = new CustomerDAO();
        String username2 = (String) session.getAttribute("us");
        Customer customer2 = customerDAO2.findCustomerByUsername(username2);
        pageContext.setAttribute("cus", customer2);
    %>


    <body>
    <center>
        <%@include file="includes/header.jsp"%>
        <div class="detail-container">

            <div class="main-details-content">
                <!--item-->

                <div data-layername="serviceDetail" class="service-detail">
                    <div data-layername="servicePreview" class="service-preview">
                        <img loading="lazy" src="${reuses.loadImage(sao.getAvatar_img())}" alt="Descriptive image content" />
                    </div>
                    <div class="service-detail-2">
                        <form class="form-container" action="${pageContext.request.contextPath}/BookedServiceControl" method="POST" >
                            <input id="serviceID" name="serviceID" type="text" value="${sao.getServiceID()}" hidden readonly>
                            <input id="customerID" name="customerID" type="text" value="${cus.getCustomerID()}" hidden readonly>

                            <div class="service-content">
                                <div class="heading">
                                    <div class="stars">
                                        <div class="star">
                                            <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/b3e962d171860a06ad0200f3339940e8f174d17fce66f33ab9d5551673a8fe06?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="img" alt="Star rating" />
                                            <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/b3e962d171860a06ad0200f3339940e8f174d17fce66f33ab9d5551673a8fe06?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="img" alt="Star rating" />
                                            <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/b3e962d171860a06ad0200f3339940e8f174d17fce66f33ab9d5551673a8fe06?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="img" alt="Star rating" />
                                            <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/b3e962d171860a06ad0200f3339940e8f174d17fce66f33ab9d5551673a8fe06?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="img" alt="Star rating" />
                                            <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/b3e962d171860a06ad0200f3339940e8f174d17fce66f33ab9d5551673a8fe06?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="img" alt="Star rating" />
                                        </div>
                                        <div class="star-rating">4.7 Star Rating</div>
                                    </div>
                                    <h1 class="dog-full-grooming">
                                        <!--<span>Dog</span>-->
                                        <span>${sao.getServiceName()}</span>
                                    </h1>
                                </div>
                                <div class="fun-fact">
                                    <div class="row">
                                        <div class="pet-type-dog">
                                            <span style="font-weight: 1000;">Pet Type:</span>
                                            <span>Dog</span>
                                        </div>
                                        <div class="duration">
                                            <span style="font-weight: 1000;">Duration:</span>
                                            <span>1 hour</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="description">
                                <h2 >Description</h2>
                                <p>${sao.getServiceDesc()}</p>
                            </div>
                            <div data-layername="prices" class="prices">
                                <div data-layername="price" class="price">${sao.getPrice()}₫ </div>
                            </div>
                            <div data-layername="devider" class="devider"></div>

                            <div data-layername="button" class="">
                                <input name="submit" type="submit" class="label" value="Booking now">

                            </div>
                        </form>


                        <div class="content">

                            <div data-layername="content" class="content">
                                <div data-layername="100GuaranteeSafeCHeckout" class="guarantee-safe-checkout-100">
                                    100% Guarantee Safe Checkout
                                </div>
                                <div data-layername="shareItem" class="share-item">
                                    <div data-layername="shareItem" class="share-item-2">Share item:</div>
                                    <div data-layername="socialIcon" class="social-icon">
                                        <img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/bb1f241da910ae5b69f1d2a9e6e27c1ab21c163c8c64f82812af96aa675d5d8a?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="img-12" alt="Social media icon" />
                                        <a href="https://www.facebook.com/"><img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/6566c625e4f3432f409fde4355028ff9350085d0079c00a500a18a2c37ec0c62?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="img-13" alt="Social media icon" /></a>
                                        <a href="https://x.com/"><img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/edbc9734bdde143dd7f6bc7723d083b91b6e87f1fa0200ae4bdffc135bb8b945?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="img-14" alt="Social media icon" /></a>
                                        <a href="https://www.pinterest.com/"><img loading="lazy" src="https://cdn.builder.io/api/v1/image/assets/TEMP/f108ee3304be9e00319f5d50d7bf1eee621454189c3cd5a1d6a28e93e8c63fc6?placeholderIfAbsent=true&apiKey=5ab9b8f40f3f4c73bf963337551ad1d8" class="img-15" alt="Social media icon" /></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!--related service-->

                <div class="item-container" style="flex: 1;width: 1296px; height: 700px">
                    <div class="related-item" id="best_seller">
                        <h1>Related Item</h1>
                        <div class="related-item-menu">
                            <div class="related-item-container">
                                <c:forEach var="s" items="${serDAO.getAllServicess()}">

                                    <a href="serviceDetails.jsp?serghfgfgf=${s.getServiceID()}" style="text-decoration: none; color: #000;display: block;">
                                        <article class="service-card">
                                            <img src="${reuses.loadImage(s.getAvatar_img())}" alt="${s.getServiceName()}" class="service-image" />
                                            <div class="service-content">
                                                <h3>${s.getServiceName()}</h3>
                                                <p>${s.getServiceDesc()}</p>
                                            </div>
                                        </article>
                                    </a>
                                </c:forEach>

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
