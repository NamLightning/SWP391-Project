/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.PetsDAO;
import Model.Pets;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author DELL
 */
public class PetControl extends HttpServlet {

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
            out.println("<title>Servlet PetControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PetControl at " + request.getContextPath() + "</h1>");
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
                    editPets(request, response);
                    break;
                case "delete":
                    deletePets(request, response);
                    break;
                default:
                    break;
            }
        } else {
            pageValue(request);
            request.getRequestDispatcher("manager-listPets.jsp").forward(request, response);
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

        PetsDAO petsDAO = new PetsDAO();

        String petsID = request.getParameter("petID").trim();
        int petId = Integer.parseInt(petsID);
        String managerID = request.getParameter("managerID");
        int manageId = Integer.parseInt(managerID);
        String petName = request.getParameter("petName");
        String petType = request.getParameter("petType").trim();
        String healthStatus = request.getParameter("healthStatus").trim();
        String lastCheckedDate = request.getParameter("lastCheckedDate").trim();
        
        // Parse the lastCheckedDate to java.sql.Date
        java.sql.Date sqlLastCheckedDate = null;
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        try {
            java.util.Date parsedDate = sdf.parse(lastCheckedDate);
            sqlLastCheckedDate = new java.sql.Date(parsedDate.getTime());
        } catch (ParseException ex) {
            Logger.getLogger(PetControl.class.getName()).log(Level.SEVERE, "Invalid date format", ex);
        }
        
        String employeeID = request.getParameter("employeeID").trim();
        int empID = Integer.parseInt(employeeID);

        String action = request.getParameter("action"); // Changed to "action" for clarity
        switch (action) {
            case "Edit":
                Pets p = petsDAO.checkExist(petId);
                String fileName = getImageName(request);
                byte[] fileData = getImage(request);
                
                // Update pet details
                p.setPetID(petId);
                p.setManagerID(manageId);
                p.setPetName(petName);
                p.setPetType(petType);
                p.setHealthStatus(healthStatus);
                p.setLastCheckedDate(sqlLastCheckedDate); // Set the parsed date

                if (fileName != null) {
                    p.setAvatar_name(fileName);
                }
                if (fileData != null) {
                    p.setAvatar_img(fileData);
                }
                
                // Update pet in database
                petsDAO.updatePet(p);
                pageValue(request);
                response.sendRedirect("PetsControl");
                break;
                
            case "Cancel":
                pageValue(request);
                request.getRequestDispatcher("PetsControl").forward(request, response);
                break;
                
            default:
                // Handle cases where action is not "Edit" or "Cancel"
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
                break;
        }
    }

    // Add the necessary helper methods: getImageName, getImage, and pageValue


    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void editPets(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String petsID = request.getParameter("id").trim();
        PetsDAO petsDAO = new PetsDAO();

        Pets pets = petsDAO.checkExist(Integer.parseInt(petsID));

        request.setAttribute("pets", pets);
        request.getRequestDispatcher("editPets.jsp").forward(request, response);
    }

    private void deletePets(HttpServletRequest request, HttpServletResponse response) {
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
        PetsDAO petsDao = new PetsDAO();
        ArrayList<Pets> products = petsDao.getAllPet(currentPage, recordsPerPage);
        request.setAttribute("products", products);
        int rows = petsDao.getNumberOfRows();
        int nOfPages = rows / recordsPerPage;
        if (nOfPages % recordsPerPage > 0) {
            nOfPages++;
        }
        request.setAttribute("noOfPages", nOfPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("recordsPerPage", recordsPerPage);
    }
}
