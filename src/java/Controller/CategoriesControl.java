/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.ItemDAO;
import Model.Item;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
public class CategoriesControl extends HttpServlet {

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
            out.println("<title>Servlet CategoriesControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CategoriesControl at " + request.getContextPath() + "</h1>");
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
                case "accessory":
                    pageValueForAccessories(request);
                    request.getRequestDispatcher("petAccessories.jsp").forward(request, response);
                    break;
                case "cloth":
                    pageValueForClothing(request);
                    request.getRequestDispatcher("petClothing.jsp").forward(request, response);
                    break;
                case "furniture":
                    pageValueForFurniture(request);
                    request.getRequestDispatcher("petFurniture.jsp").forward(request, response);
                    break;
                default:
                    break;
            }
        } else {
            pageValueForFood(request);
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

    private void pageValueForFood(HttpServletRequest request) {
        int pageNumber;
        if (request.getParameter("page") != null && !request.getParameter("page").isEmpty()) {
            pageNumber = Integer.parseInt(request.getParameter("page"));
        } else {
            pageNumber = 1;
        }
        int pageSize;
        if (request.getParameter("pageSize") != null && !request.getParameter("pageSize").isEmpty()) {
            pageSize = Integer.parseInt(request.getParameter("pageSize"));
        } else {
            pageSize = 12;
        }
        int offset = (pageNumber - 1) * pageSize;
        ItemDAO productsDAO = new ItemDAO();
        ArrayList<Item> products = productsDAO.getAllProductsWithCategory(1, offset, pageSize);
        request.setAttribute("products", products);
        int rows = productsDAO.getNumberOfRowsOfCategory(1);
        int totalPages = (int) Math.ceil((double) rows / pageSize);
        int startPage = Math.max(1, pageNumber - 2);
        int endPage = Math.min(totalPages, pageNumber + 2);

        request.setAttribute("currentPage", pageNumber);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
    }

    private void pageValueForFurniture(HttpServletRequest request) {
        int pageNumber;
        if (request.getParameter("page") != null && !request.getParameter("page").isEmpty()) {
            pageNumber = Integer.parseInt(request.getParameter("page"));
        } else {
            pageNumber = 1;
        }
        int pageSize;
        if (request.getParameter("pageSize") != null && !request.getParameter("pageSize").isEmpty()) {
            pageSize = Integer.parseInt(request.getParameter("pageSize"));
        } else {
            pageSize = 12;
        }
        int offset = (pageNumber - 1) * pageSize;
        ItemDAO productsDAO = new ItemDAO();
        ArrayList<Item> products = productsDAO.getAllProductsWithCategory(3, offset, pageSize);
        request.setAttribute("products", products);
        int rows = productsDAO.getNumberOfRowsOfCategory(3);
        int totalPages = (int) Math.ceil((double) rows / pageSize);
        int startPage = Math.max(1, pageNumber - 2);
        int endPage = Math.min(totalPages, pageNumber + 2);

        request.setAttribute("currentPage", pageNumber);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
    }

    private void pageValueForAccessories(HttpServletRequest request) {
        int pageNumber;
        if (request.getParameter("page") != null && !request.getParameter("page").isEmpty()) {
            pageNumber = Integer.parseInt(request.getParameter("page"));
        } else {
            pageNumber = 1;
        }
        int pageSize;
        if (request.getParameter("pageSize") != null && !request.getParameter("pageSize").isEmpty()) {
            pageSize = Integer.parseInt(request.getParameter("pageSize"));
        } else {
            pageSize = 12;
        }
        int offset = (pageNumber - 1) * pageSize;
        ItemDAO productsDAO = new ItemDAO();
        ArrayList<Item> products = productsDAO.getAllProductsWithCategory(4, offset, pageSize);
        request.setAttribute("products", products);
        int rows = productsDAO.getNumberOfRowsOfCategory(4);
        int totalPages = (int) Math.ceil((double) rows / pageSize);
        int startPage = Math.max(1, pageNumber - 2);
        int endPage = Math.min(totalPages, pageNumber + 2);

        request.setAttribute("currentPage", pageNumber);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
    }

    private void pageValueForClothing(HttpServletRequest request) {
        int pageNumber;
        if (request.getParameter("page") != null && !request.getParameter("page").isEmpty()) {
            pageNumber = Integer.parseInt(request.getParameter("page"));
        } else {
            pageNumber = 1;
        }
        int pageSize;
        if (request.getParameter("pageSize") != null && !request.getParameter("pageSize").isEmpty()) {
            pageSize = Integer.parseInt(request.getParameter("pageSize"));
        } else {
            pageSize = 12;
        }
        int offset = (pageNumber - 1) * pageSize;
        ItemDAO productsDAO = new ItemDAO();
        ArrayList<Item> products = productsDAO.getAllProductsWithCategory(2, offset, pageSize);
        request.setAttribute("products", products);
        int rows = productsDAO.getNumberOfRowsOfCategory(2);
        int totalPages = (int) Math.ceil((double) rows / pageSize);
        int startPage = Math.max(1, pageNumber - 2);
        int endPage = Math.min(totalPages, pageNumber + 2);

        request.setAttribute("currentPage", pageNumber);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
    }
}
