<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PetHub</title>
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/footer.css">
    </head>
    <body>
        <%@include file="includes/header.jsp" %><br>
        <div class="container">
            <div class="main-content">
                <center>
                    <div class="error-message">
                        <h1>404<h1>
                        <h2>OOPS! Not Found. Please go back...</h2>
                    </div>
                </center>
            </div>
        </div>

    </body>
    <%@include file="includes/footer.jsp" %>
</html>

<style>
    .error-message h1{
        margin-bottom: 0px;
        display: block;
        font-family: 'Poppins',sans-serif;
        font-size: 105px;
        font-weight: bold;
        unicode-bidi: isolate;
    }
    
    .error-message h2{
        margin-top: 10px;
        margin-bottom: 40px;
        font-family: 'Poppins',sans-serif;
        font-size:40px;
    }
</style>

