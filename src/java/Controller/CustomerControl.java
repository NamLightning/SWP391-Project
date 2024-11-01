/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.CustomerDAO;
import Model.Customer;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author DELL
 */
public class CustomerControl extends HttpServlet {

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
            out.println("<title>Servlet CustomerControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerControl at " + request.getContextPath() + "</h1>");
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
                case "edit":
                    pageValue(request);
                    editCustomer(request, response);
                    break;
                case "delete":
                    deleteCustomer(request, response);
                    break;
                default:
                    break;
            }
        } else {
            pageValue(request);
            request.getRequestDispatcher("managerCustomer.jsp").forward(request, response);
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

        CustomerDAO customerDAO = new CustomerDAO();

        String customerID = request.getParameter("customerID").trim();
        int id = Integer.parseInt(customerID);
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String firstName = request.getParameter("firstName").trim();
        String lastName = request.getParameter("lastName").trim();
        String email = request.getParameter("email").trim();
        String phoneNumber = request.getParameter("phoneNumber").trim();
        String address = request.getParameter("address").trim();

        String submit = request.getParameter("submit");
        switch (submit) {
            case "Add":
                String fileName1 = getImageName(request);
                byte[] fileData1 = getImage(request);
                Customer i = new Customer(username,password,firstName,lastName,email,phoneNumber,address);
                if (fileName1 != null) {
                    i.setAvatar_name(fileName1);
                }
                if (fileData1 != null) {
                    i.setAvatar_img(fileData1);
                }
                customerDAO.registerCustomer(i);
                response.sendRedirect("CustomerControl");
                break;
            case "Edit":
                Customer p = customerDAO.checkExist(id);
                String fileName = getImageName(request);
                byte[] fileData = getImage(request);
                
                p.setUsername(username);
                p.setPassword(password);
                p.setFirstName(firstName);
                p.setLastName(lastName);
                p.setEmail(email);
                p.setPhoneNumber(phoneNumber);
                p.setAddress(address);

                if (fileName != null) {
                    p.setAvatar_name(fileName);
                }
                if (fileData != null) {
                    p.setAvatar_img(fileData);
                }
                customerDAO.updateCustomer(p);
                pageValue(request);
                response.sendRedirect("CustomerControl");
                break;
            case "Cancel":
                pageValue(request);
                request.getRequestDispatcher("CustomerControl").forward(request, response);
                break;
            default:
                break;
        }
        request.getRequestDispatcher("CustomerControl").forward(request, response);
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

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String customerID = request.getParameter("customerID").trim();
        CustomerDAO customerDAO = new CustomerDAO();

        Customer customer = customerDAO.checkExist(Integer.parseInt(customerID));
        pageValue(request);

        request.setAttribute("customer", customer);
        request.getRequestDispatcher("admin/editCustomer.jsp").forward(request, response);
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String customerID = request.getParameter("customerID").trim();
        CustomerDAO productsDAO = new CustomerDAO();
        Customer customer = productsDAO.checkExist(Integer.parseInt(customerID));
        if (customer != null){
            productsDAO.deleteCustomer(customer.getCustomerID());
        }
        response.sendRedirect("CustomerControl?page=" + request.getParameter("page") + "&pageSize=" + request.getParameter("pageSize"));
    }

    private String getImageName(HttpServletRequest request) throws IOException, ServletException {
        Part filePart = request.getPart("image");
        String fileName = null;
        if (filePart != null) {
            fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        }
        return fileName;
    }

    private byte[] getImage(HttpServletRequest request) throws IOException, ServletException {
        Part filePart = request.getPart("image");
        byte[] fileData = null;
        if (filePart != null) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            if (!fileName.isEmpty()) {
                String uploadPath = request.getServletContext().getRealPath("/images").replace("\\build", "");
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                filePart.write(uploadPath + File.separator + fileName);
                fileData = Files.readAllBytes(Paths.get(uploadDir.getAbsolutePath() + File.separator + fileName));
            }
        }
        return fileData;
    }

    private void pageValue(HttpServletRequest request) {
        int currentPage;
        if (request.getParameter("currentPage") != null && !request.getParameter("currentPage").isEmpty()) {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        } else {
            currentPage = 1;
        }
        int recordsPerPage;
        if (request.getParameter("recordsPerPage") != null && !request.getParameter("recordsPerPage").isEmpty()) {
            recordsPerPage = Integer.parseInt(request.getParameter("recordsPerPage"));
        } else {
            recordsPerPage = 12;
        }
        CustomerDAO customerDao = new CustomerDAO();
        ArrayList<Customer> products = customerDao.getAllCustomer(currentPage, recordsPerPage);
        request.setAttribute("customer", products);
        int rows = customerDao.getNumberOfRows();
        int nOfPages = rows / recordsPerPage;
        if (nOfPages % recordsPerPage > 0) {
            nOfPages++;
        }
        request.setAttribute("noOfPages", nOfPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("recordsPerPage", recordsPerPage);
    }
}
