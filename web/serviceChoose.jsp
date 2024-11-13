<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="reuses" class="Utils.Reuseable" scope="page"/>
<jsp:useBean id="serDAO" class="Dao.ServicesDAO" scope="page"/>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PetHub</title>
        <link rel="stylesheet" href="css/serviceindex.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/footer.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@include file="includes/header.jsp"%>
        <div class="service-choose-container">
            <div class="left-sidebar" style="background-color: #ffffff; width:312px; height: 1150px;"></div>
            <div class="service-choose-content" style="flex: 1;width: 1296px; height: 1150px">
                <div class="services-section">
                    <h1>Our Services</h1>
                    <div class="service-menu">
                        <div class="service-grid">

                            <c:forEach var="s" items="${serDAO.getAllServicess()}">

                                <a href="serviceDetails.jsp?serID=${s.getServiceID()}" style="text-decoration: none; color: #000;display: block;">
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
            <div class="right-sidebar" style="background-color: #ffffff; width:312px; height: 1150px"></div>
        </div>
        <%@include file="includes/footer.jsp"%>
    </body>
</html>