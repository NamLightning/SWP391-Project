<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*, java.io.*, Dao.EmployeeDAO" %>
<jsp:useBean id="e" class="Dao.EmployeeDAO" scope="page"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    String imageStream = EmployeeDAO.getImage(1);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Employee</title>
    </head>
    <body>
        <c:forEach var="s" items="${e.getAllEmployee()}">
            <div class="card-body">
                <h5 class="card-title">List Employee</h5>
                <img src="<%= "data:image/jpeg;base64," + imageStream %>" alt="${s.getAvatar_name()}">
                <p class="card-text">Name: ${s.getFirstName()} ${s.getLastName()} </p>
                <p class="card-text">Email: ${s.getEmail()} </p>
                <p class="card-text">Phone number: ${s.getPhoneNumber()} </p>
            </div>

        </c:forEach>

    </body>
</html>
