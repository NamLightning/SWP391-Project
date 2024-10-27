<%-- 
    Document   : userProfile
    Created on : Sep 5, 2024, 10:18:19 PM
    Author     : Administrator
--%>

<%@page import="Model.Customer"%>
<%@page import="Dao.CustomerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        CustomerDAO customerDAO = new CustomerDAO();
        String username = (String) session.getAttribute("us");
        Customer customer = customerDAO.findCustomerByUsername(username);
        pageContext.setAttribute("account", customer);
    %>
    <body>
        <form action="ProfileControl" method="POST">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-floating mb-3">
                        <input type="text" name="fname" class="form-control" id="floatingInputUsername" placeholder="First Name" value="${account.getFirstName()}" autofocus readonly>
                        <label for="floatingInputUsername">First Name </label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating mb-3">
                        <input type="text" name="lname" class="form-control" id="floatingInputUsername" placeholder="LastName" value="${account.getLastName()}" autofocus readonly>
                        <label for="floatingInputUsername">Last Name </label>
                    </div>
                </div>
            </div>

            <div class="form-floating mb-3">
                <input type="tel" name="phone_numb" class="form-control" id="floatingInputUsername" placeholder="Phone" value="${account.getPhoneNumber()}" autofocus readonly>
                <label for="floatingInputUsername">Phone Number </label>
            </div>
            <div class="form-floating mb-3">
                <input type="email" name="email" class="form-control" id="floatingInputUsername" placeholder="Email" value="${account.getEmail()}" autofocus readonly>
                <label for="floatingInputUsername">Email </label>
            </div>
            <div class="form-floating mb-3">
                <input type="text" name="username" class="form-control" id="floatingInputUsername" placeholder="Username" value="${account.getUsername()}"  autofocus readonly>
                <label for="floatingInputUsername">Username</label>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-floating mb-3">
                        <input type="text" name="newFname" class="form-control" id="floatingInputUsername" placeholder="First Name" required autofocus>
                        <label for="floatingInputUsername">Enter New First Name <span class="required"></span></label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating mb-3">
                        <input type="text" name="newLname" class="form-control" id="floatingInputUsername" placeholder="LastName" required autofocus>
                        <label for="floatingInputUsername">Enter New Last Name <span class="required"></span></label>
                    </div>

                </div>
            </div>

            <div class="form-floating mb-3">
                <input type="tel" name="newPhone_numb" class="form-control" id="floatingInputUsername" placeholder="Phone" required autofocus>
                <label for="floatingInputUsername">Enter New Phone Number <span class="required"></span></label>
            </div>
            <div class="form-floating mb-3">
                <input type="email" name="newEmail" class="form-control" id="floatingInputUsername" placeholder="Email" required autofocus>
                <label for="floatingInputUsername">Enter New Email <span class="required"></span></label>
            </div>
            <div class="form-floating mb-3">
                <input type="text" name="newUsername" class="form-control" id="floatingInputUsername" placeholder="Username" required autofocus>
                <label for="floatingInputUsername">Enter New Username<span class="required"></span></label>
            </div>
            <div class="form-floating mb-3">
                <input type="password" name="password" class="form-control" id="floatingInputUsername" placeholder="Password" required autofocus>
                <label for="floatingInputUsername">Enter New Password <span class="required"></span></label>
            </div>
            <div class="form-floating mb-3">
                <input type="password" name="repassword" class="form-control" id="floatingInputUsername" placeholder="Re-password" required autofocus>
                <label for="floatingInputUsername">Enter New Re-password <span class="required"></span></label>
            </div>
            <input type="submit" value="Update Information"><br><br>
            <button onclick="window.location.href = 'home.jsp'" type="button">Return</button><br><br>
            <!--<a href="ProfileServlet?action=delete">Delete Account</a>-->
        </form>
    </body>
</html>
