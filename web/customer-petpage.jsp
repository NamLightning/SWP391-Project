<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="p" class="Dao.PetsDAO" scope="page"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:forEach var="s" items="${p.getAllPet()}">
            <div class="card-body">
                <h5 class="card-title">Order</h5>
                <img src="image?petID=${s.getPetID()}">
                <p class="card-text">To: <c:if test="${not empty pkg.getFinal_apartment_number()}">${pkg.getFinal_apartment_number()},</c:if> ${pkg.getFinal_street_name()}, ${pkg.getFinal_District()}, ${pkg.getFinal_Ward()}, ${pkg.getFinal_city()} </p>
                <p class="card-text">Phone: ${pkg.getFinal_Phone()} </p>
                <p class="card-text">Request day: ${s.getOrder_Date()} - ${pkg.getRequested_Delivery_Date()} </p>

                <a href="OrderServlet?command=delete&Order_Id=${s.getOrder_ID()}" 
                   onclick="if (!(confirm('Sure?')))
                                                           return false">Delete Order</a>
            </div>


        </c:forEach>

    </body>
</html>