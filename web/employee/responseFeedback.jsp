<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Support</title>  
        <link rel="stylesheet" href="<c:url value="/css/header.css"/>">
        <link rel="stylesheet" href="<c:url value="/css/footer.css"/>">
        <link rel="stylesheet" href="<c:url value="/css/feedback.css"/>">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    </head>
    <body>
    <center>
        <%@include file="../includes/header.jsp"%>
        <div class="main-container">
        </div>
        <%@include file="../includes/footer.jsp"%>
    </center>
</body>
</html>