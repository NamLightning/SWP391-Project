/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.EmployeeDAO;
import Model.Employee;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
public class EmployeeControl extends HttpServlet {

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
            out.println("<title>Servlet EmployeeControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EmployeeControl at " + request.getContextPath() + "</h1>");
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
                    editEmployee(request, response);
                    break;
                case "delete":
                    deleteEmployee(request, response);
                    break;
                default:
                    break;
            }
        } else {
            pageValue(request);
            request.getRequestDispatcher("manager-listEmployee.jsp").forward(request, response);
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

        EmployeeDAO employeeDAO = new EmployeeDAO();

        String employeeID = request.getParameter("employeeID").trim();
        int id = Integer.parseInt(employeeID);
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String firstName = request.getParameter("firstName").trim();
        String lastName = request.getParameter("lastName").trim();
        String email = request.getParameter("email").trim();
        String phoneNumber = request.getParameter("phoneNumber").trim();

        String submit = request.getParameter("submit");
        switch (submit) {
            case "Edit":
                Employee p = employeeDAO.checkExist(id);
                String fileName = getImageName(request);
                byte[] fileData = getImage(request);
                p.setUsername(username);
                p.setPassword(password);
                p.setFirstName(firstName);
                p.setLastName(lastName);
                p.setEmail(email);
                p.setPhoneNumber(phoneNumber);

                if (fileName != null) {
                    p.setAvatar_name(fileName);
                }
                if (fileData != null) {
                    p.setAvatar_img(fileData);
                }
                employeeDAO.updateEmployee(p);
                pageValue(request);
                response.sendRedirect("EmployeeControl");
                break;
            case "Cancel":
                pageValue(request);
                request.getRequestDispatcher("EmployeeControl").forward(request, response);
                break;
            default:
                break;
        }
        request.getRequestDispatcher("EmployeeControl").forward(request, response);
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

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String employeeID = request.getParameter("id").trim();
        EmployeeDAO employeeDAO = new EmployeeDAO();

        Employee employee = employeeDAO.checkExist(Integer.parseInt(employeeID));

        request.setAttribute("employee", employee);
        request.getRequestDispatcher("editEmployee.jsp").forward(request, response);
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
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
        EmployeeDAO employeeDao = new EmployeeDAO();
        ArrayList<Employee> products = employeeDao.getAllEmployee(currentPage, recordsPerPage);
        request.setAttribute("products", products);
        int rows = employeeDao.getNumberOfRows();
        int nOfPages = rows / recordsPerPage;
        if (nOfPages % recordsPerPage > 0) {
            nOfPages++;
        }
        request.setAttribute("noOfPages", nOfPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("recordsPerPage", recordsPerPage);
    }

}
