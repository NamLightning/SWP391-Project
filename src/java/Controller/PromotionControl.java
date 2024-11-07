/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.PromotionsDAO;
import Model.Item;
import Model.Promotions;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
public class PromotionControl extends HttpServlet {

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
            out.println("<title>Servlet PromotionControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PromotionControl at " + request.getContextPath() + "</h1>");
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
                    editPromotions(request, response);
                    break;
                case "delete":
                    deletePromotions(request, response);
                    break;
                default:
                    break;
            }
        } else {
            pageValue(request);
            request.getRequestDispatcher("admin/managePromotion.jsp").forward(request, response);
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

        PromotionsDAO promotionsDAO = new PromotionsDAO();

        String promotionsID = request.getParameter("promotionID").trim();
        int promotionId = Integer.parseInt(promotionsID);
        String promotionName = request.getParameter("promotionName");
        String descriptions = request.getParameter("promotionDecs").trim();
        int discountPercents = Integer.parseInt(request.getParameter("discount").trim());
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
        LocalDateTime startDate = LocalDateTime.parse(request.getParameter("startDate").trim(), formatter);
        LocalDateTime endDate = LocalDateTime.parse(request.getParameter("endDate").trim(), formatter);

        String action = request.getParameter("action");
        switch (action) {
            case "Add":
                Promotions p = promotionsDAO.checkExist(promotionId);
                p = new Promotions(promotionName, discountPercents, startDate, endDate, descriptions);
                promotionsDAO.addPromotion(p);
                response.sendRedirect("PromotionControl");
                break;
            case "Edit":
                p = promotionsDAO.checkExist(promotionId);

                p.setPromotionID(promotionId);
                p.setPromotionName(promotionName);
                p.setDiscountPercent(discountPercents);
                p.setStartDate(startDate);
                p.setEndDate(endDate);
                p.setDescriptions(descriptions);

                promotionsDAO.updatePromotion(p);
                pageValue(request);
                response.sendRedirect("PromotionControl");
                break;

            case "Cancel":
                pageValue(request);
                request.getRequestDispatcher("PromotionControl").forward(request, response);
                break;

            default:
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

    private void editPromotions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String promotionsID = request.getParameter("id").trim();
        PromotionsDAO promotionsDAO = new PromotionsDAO();

        Promotions promotions = promotionsDAO.checkExist(Integer.parseInt(promotionsID));

        request.setAttribute("promotions", promotions);
        request.getRequestDispatcher("editPromotions.jsp").forward(request, response);
    }

    private void deletePromotions(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
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
        PromotionsDAO promotionsDao = new PromotionsDAO();
        ArrayList<Promotions> products = promotionsDao.getAllPromotion(currentPage, recordsPerPage);
        request.setAttribute("products", products);
        int rows = promotionsDao.getNumberOfRows();
        int nOfPages = rows / recordsPerPage;
        if (nOfPages % recordsPerPage > 0) {
            nOfPages++;
        }
        request.setAttribute("noOfPages", nOfPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("recordsPerPage", recordsPerPage);
    }
}
