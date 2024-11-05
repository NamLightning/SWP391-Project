/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.AccountControl;

import Dao.CustomerDAO;
import Dao.EmployeeDAO;
import Dao.ManagerDAO;
import Model.Customer;
import Model.Employee;
import Model.Manager;
import Utils.CookieUtils;
import google_context.GooglePojo;
import google_context.GoogleUtils;
import static google_context.GoogleUtils.removeAccents;
import java.io.IOException;
import java.io.PrintWriter;
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

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
                Customer emailExist = accountDAO.findByEmail(account);
                if (emailExist == null) {
                    accountDAO.addnewAccountWithGoogle(account);
                    accountDAO.registerCustomer(accountDAO.findByEmail(account));
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

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
                String remember = request.getParameter("remember-me");
                HttpSession session = request.getSession();
                CustomerDAO customerDAO = new CustomerDAO();
                EmployeeDAO employeeDAO = new EmployeeDAO();
                ManagerDAO managerDAO = new ManagerDAO();
                Customer a = customerDAO.checkLogin(username, password);
                Employee e = employeeDAO.checkLogin(username, password);
                Manager m = managerDAO.checkLogin(username, password);
                System.out.println(username + password);
                if (a == null && e == null && m == null) {
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
                    if (a != null) {
                        response.sendRedirect("homePage.jsp");
                    }
                    if (e != null){
                        response.sendRedirect("petFood.jsp");
                    }
                    if (m != null){
                        response.sendRedirect("admin/admin.jsp");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred during login. Please try again.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
