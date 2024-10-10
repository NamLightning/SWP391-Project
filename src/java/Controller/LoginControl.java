/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.CustomerDAO;
import Model.Customer;
import Utils.CookieUtils;
import google_context.GooglePojo;
import google_context.GoogleUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.Normalizer;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class LoginControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String code = request.getParameter("code");
        if (code != null) {
            String accessToken = GoogleUtils.getToken(code);
            if (accessToken != null) {
                GooglePojo user = GoogleUtils.getUserInfo(accessToken);
                String name = removeAccents(user.getName().trim());

                Customer account = new Customer();
                account.setUsername(name);
                account.setPassword("");
                account.setFirstName(removeAccents(user.getGiven_name().trim()));
                account.setLastName(removeAccents(user.getFamily_name().trim()));
                account.setEmail(user.getEmail().trim());
                account.setPassword("");
                CustomerDAO accountDAO = new CustomerDAO();
                CustomerDAO customerDAO = new CustomerDAO();
//                Customer emailExist = CustomerDAO.findByEmail(account);
//                if (emailExist == null) {
//                    accountDAO.addnewAccountWithGoogle(account);
//                    customerDAO.registerCustomer(new Customer(accountDAO.findByEmail(account).getCustomerID()));
                    session.setAttribute("us", name);
                    request.getRequestDispatcher("home.jsp").forward(request, response);
                } else {
                    session.setAttribute("us", emailExist.getUsername());
                    request.getRequestDispatcher("home.jsp").forward(request, response);
                }
            } else {
                response.sendRedirect("login.jsp?mess=Cannot get access token");
            }
        } else {
            response.sendRedirect("login.jsp?mess=No code provided");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try {
            String code = request.getParameter("code");
            if (code != null && !code.isEmpty()) {
//                String accessToken = GoogleUtils.getToken(code);
//                GooglePojo user = GoogleUtils.getUserInfo(accessToken);
//                System.out.println(user);
//                List<Account> listUser =new ArrayList<>(); 
//                String avatar = user.getPicture();
//                Account account = new Account();
////                account.setEmail(email);
//                account.setAvatar(avatar);
//
////                listUser = generalImplement.findByEmail(account);
//                //list trống thì thêm tài khoản vào database
//                if (listUser.isEmpty()) {
//                    generalImplement.addnewAccountWithGoogle(account);
//                }
//
//                HttpSession session = request.getSession();
//                session.setAttribute("email", email);
//                session.setAttribute("avatar", avatar);
//                request.getRequestDispatcher("Scr_Profile_CustomerProfile.jsp").forward(request, response);
            } else {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String remember = request.getParameter("remember");
                HttpSession session = request.getSession();
                CustomerDAO loginDAO = new CustomerDAO();
                Customer a = loginDAO.checkLogin(username, password);
                if (a == null) {
                    request.setAttribute("mess", "Wrong Username or Password");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
//                    Cookie u = new Cookie("user", username);
//                    Cookie p = new Cookie("pass", password);
//                    u.setMaxAge(7 * 24 * 60 * 60);
//                    if (remember != null) {
//                        p.setMaxAge(7 * 24 * 60 * 60);
//                    } else {
//                        p.setMaxAge(0);
//                    }
//                    response.addCookie(u);
//                    response.addCookie(p);
                    CookieUtils.add("user", username, 24, response);
                    session.setAttribute("us", username.trim());
//                    session.setAttribute("pw", password);
                    request.getRequestDispatcher("home.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred during login. Please try again.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    public static String removeAccents(String input) {
        String normalized = Normalizer.normalize(input, Normalizer.Form.NFD);
        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
        return pattern.matcher(normalized).replaceAll("");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
