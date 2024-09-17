<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*, java.io.*, Dao.PetsDAO" %>
<jsp:useBean id="p" class="Dao.PetsDAO" scope="page"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    String imageStream = PetsDAO.getImage(1);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pet Page</title>
    </head>
    <body>
        <c:forEach var="s" items="${p.getAllPet()}">
            <div class="card-body">
                <h5 class="card-title">Order</h5>
                <img src="<%= "data:image/jpeg;base64," + imageStream %>" alt="${s.getAvatar_name()}">
                <p class="card-text"><c:if test="${not empty s.getPetName()}">${s.getPetName()} - </c:if>${s.getPetType()} </p>
                <p class="card-text">Condition: ${s.getHealthStatus()} </p>
                <p class="card-text">Last checked date: ${s.getLastCheckedDate()} </p>
            </div>

        </c:forEach>

    </body>
</html>
