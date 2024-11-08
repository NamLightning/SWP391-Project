/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.ServicesDAO;
import Model.Services;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author DELL
 */
@MultipartConfig
public class ServiceControl extends HttpServlet {

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
            out.println("<title>Servlet ServiceControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServiceControl at " + request.getContextPath() + "</h1>");
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
                    editServices(request, response);
                    break;
                case "delete":
                    deleteServices(request, response);
                    break;
                default:
                    break;
            }
        } else {
            pageValue(request);
            request.getRequestDispatcher("admin/manageService.jsp").forward(request, response);
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

        ServicesDAO serviceDAO = new ServicesDAO();

        String serviceID;
        Integer id = null;

        if (request.getParameter("serviceID") != null) {
            serviceID = request.getParameter("serviceID");
            id = Integer.parseInt(serviceID);
        }

        String serviceName = request.getParameter("serviceName");
        double prices = Double.parseDouble(request.getParameter("price").trim());

        String serviceDesc = request.getParameter("serviceDes").trim();

        String submit = request.getParameter("submit");
        switch (submit) {
            case "Add":
                String fileName1 = getImageName(request);
                byte[] fileData1 = getImage(request);
                Services i = new Services(serviceName, prices, serviceDesc);
                if (fileName1 != null) {
                    i.setAvatar_name(fileName1);
                }
                if (fileData1 != null) {
                    i.setAvatar_img(fileData1);
                }
                serviceDAO.registerServices(i);
                response.sendRedirect("ServiceControl");
                break;
            case "Edit":
                Services p = serviceDAO.checkExist(id);
                String fileName = getImageName(request);
                byte[] fileData = getImage(request);

                p.setServiceName(serviceName);
                p.setPrice(prices);
                p.setServiceDesc(serviceDesc);

                if (fileName != null) {
                    p.setAvatar_name(fileName);
                }
                if (fileData != null) {
                    p.setAvatar_img(fileData);
                }
                serviceDAO.updateServices(p);
                pageValue(request);
                response.sendRedirect("ServiceControl");
                break;
            case "Cancel":
                pageValue(request);
                request.getRequestDispatcher("ServiceControl").forward(request, response);
                break;
            default:
                break;
        }
        request.getRequestDispatcher("ServiceControl").forward(request, response);
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

    private void editServices(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String serviceID = request.getParameter("id");
        ServicesDAO serviceDAO = new ServicesDAO();

        Services service = serviceDAO.checkExist(Integer.parseInt(serviceID));
        pageValue(request);

        request.setAttribute("service", service);
        request.getRequestDispatcher("admin/updateService.jsp").forward(request, response);
    }

    private void deleteServices(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String serviceID = request.getParameter("id").trim();
        ServicesDAO productsDAO = new ServicesDAO();
        Services service = productsDAO.checkExist(Integer.parseInt(serviceID));
        if (service != null) {
            productsDAO.deleteServices(service.getServiceID());
        }
        response.sendRedirect("ServiceControl?page=" + request.getParameter("page") + "&pageSize=" + request.getParameter("pageSize"));
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

        int offset = (currentPage - 1) * recordsPerPage;
        ServicesDAO serviceDao = new ServicesDAO();
        ArrayList<Services> products = serviceDao.getAllServices(offset, recordsPerPage);
        request.setAttribute("services", products);
        int rows = serviceDao.getNumberOfRows();
        int totalPages = (int) Math.ceil((double) rows / recordsPerPage);
        request.setAttribute("noOfPages", totalPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("recordsPerPage", recordsPerPage);
    }
}