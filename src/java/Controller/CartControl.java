/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.CartItemsDAO;
import Dao.CustomerDAO;
import Dao.ItemDAO;
import Model.CartItems;
import Model.Customer;
import Model.Item;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class CartControl extends HttpServlet {

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
            out.println("<title>Servlet CartControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartControl at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "add":
                    addToCart(request, response);
                    break;
                case "addCart":
                    addFromCart(request, response);
                    break;
                case "delete":
                    deleteFromCart(request, response);
                    break;
                case "deleteCart":
                    deleteCart(request, response);
                    break;
                case "remove":
                    removeFromCart(request, response);
                    break;
                default:
                    break;
            }
        } else {
            request.getRequestDispatcher("petFood.jsp").forward(request, response);
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
        processRequest(request, response);
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

    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        CustomerDAO customerDAO = new CustomerDAO();
        CartItemsDAO cartItemsDAO = new CartItemsDAO();
        ItemDAO itemDAO = new ItemDAO();

        if (session.getAttribute("us") == null) {
            response.sendRedirect("homePage.jsp");
        }
        String username = (String) session.getAttribute("us");
        Customer customer = customerDAO.findCustomerByUsername(username.trim());
        String Sid = request.getParameter("id").trim();
        int id = Integer.parseInt(Sid);
        Item i = itemDAO.checkExist(id);
        if (cartItemsDAO.findCartItemsByCustomer(customer.getCustomerID(), i.getProductID()) == null) {
            CartItems c = new CartItems(customer.getCustomerID(), i.getProductID(), 1);
            cartItemsDAO.registerCartItems(c);
        } else if (cartItemsDAO.findCartItemsByCustomer(customer.getCustomerID(), i.getProductID()) != null) {
            CartItems c = cartItemsDAO.findCartItemsByCustomer(customer.getCustomerID(), i.getProductID());
            int Quantity = c.getQuantity() + 1;
            c.setQuantity(Quantity);
            cartItemsDAO.updateCartItems(c);
        }
        response.sendRedirect("petFood.jsp");
    }

    private void removeFromCart(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        CustomerDAO customerDAO = new CustomerDAO();
        CartItemsDAO cartItemsDAO = new CartItemsDAO();
        ItemDAO itemDAO = new ItemDAO();

        if (session.getAttribute("us") == null) {
            response.sendRedirect("homePage.jsp");
        }
        String username = (String) session.getAttribute("us");
        Customer customer = customerDAO.findCustomerByUsername(username.trim());
        String Sid = request.getParameter("cid").trim();
        int id = Integer.parseInt(Sid);
        Item i = itemDAO.checkExist(id);
        if (cartItemsDAO.findCartItemsByCustomer(customer.getCustomerID(), i.getProductID()) != null) {
            CartItems c = cartItemsDAO.findCartItemsByCustomer(customer.getCustomerID(), i.getProductID());
            if (c.getQuantity() > 1) {
                int Quantity = c.getQuantity() - 1;
                c.setQuantity(Quantity);
                cartItemsDAO.updateCartItems(c);
            } else if (c.getQuantity() == 1) {
                cartItemsDAO.deleteCartItems(c.getCartItemID());
            }
        }
        response.sendRedirect("cart.jsp");
    }

    private void deleteFromCart(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        CartItemsDAO cartItemsDAO = new CartItemsDAO();

        if (session.getAttribute("us") == null) {
            response.sendRedirect("homePage.jsp");
        }

        String Sid = request.getParameter("cid").trim();
        int id = Integer.parseInt(Sid);

        CartItems c = cartItemsDAO.checkExist(id);
        if (c != null) {
            cartItemsDAO.deleteCartItems(c.getCartItemID());
        }
        response.sendRedirect("petFood.jsp");
    }

    private void addFromCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        CustomerDAO customerDAO = new CustomerDAO();
        CartItemsDAO cartItemsDAO = new CartItemsDAO();
        ItemDAO itemDAO = new ItemDAO();

        if (session.getAttribute("us") == null) {
            response.sendRedirect("homePage.jsp");
        }
        String username = (String) session.getAttribute("us");
        Customer customer = customerDAO.findCustomerByUsername(username.trim());
        String Sid = request.getParameter("id").trim();
        int id = Integer.parseInt(Sid);
        Item i = itemDAO.checkExist(id);
        if (cartItemsDAO.findCartItemsByCustomer(customer.getCustomerID(), i.getProductID()) == null) {
            CartItems c = new CartItems(customer.getCustomerID(), i.getProductID(), 1);
            cartItemsDAO.registerCartItems(c);
        } else if (cartItemsDAO.findCartItemsByCustomer(customer.getCustomerID(), i.getProductID()) != null) {
            CartItems c = cartItemsDAO.findCartItemsByCustomer(customer.getCustomerID(), i.getProductID());
            int Quantity = c.getQuantity() + 1;
            c.setQuantity(Quantity);
            cartItemsDAO.updateCartItems(c);
        }
        response.sendRedirect("cart.jsp");
    }

    private void deleteCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        CartItemsDAO cartItemsDAO = new CartItemsDAO();

        if (session.getAttribute("us") == null) {
            response.sendRedirect("homePage.jsp");
        }

        String Sid = request.getParameter("cid").trim();
        int id = Integer.parseInt(Sid);

        CartItems c = cartItemsDAO.checkExist(id);
        if (c != null) {
            cartItemsDAO.deleteCartItems(c.getCartItemID());
        }
        response.sendRedirect("cart.jsp");
    }

}
