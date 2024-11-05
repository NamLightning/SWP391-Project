/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.CategoriesDAO;
import Dao.ItemDAO;
import Model.Categories;
import Model.Item;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;

/**
 *
 * @author Administrator
 */
@MultipartConfig
public class ItemControl extends HttpServlet {

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
            out.println("<title>Servlet ProductControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductControl at " + request.getContextPath() + "</h1>");
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
                    editProduct(request, response);
                    break;
                case "delete":
                    deleteProduct(request, response);
                    break;
                default:
                    break;
            }
        } else {
            pageValue(request);
            request.getRequestDispatcher("admin/manageItem.jsp").forward(request, response);
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

        ItemDAO productsDAO = new ItemDAO();
        CategoriesDAO categoriesDAO = new CategoriesDAO();
        String productID;
        Integer id = null;
        if (request.getParameter("productID") != null) {
            productID = request.getParameter("productID").trim();
            id = Integer.parseInt(productID);
        }
        String productName = request.getParameter("productName");
        String productDesc = request.getParameter("productDesc");
        String price = request.getParameter("price").trim();
        double price2 = Double.parseDouble(price);
        String stock = request.getParameter("stock").trim();
        int stock2 = Integer.parseInt(stock);
        String categories = request.getParameter("categories").trim();
        int id2 = Integer.parseInt(categories);

        String submit = request.getParameter("submit");
        switch (submit) {
            case "Add":
                Categories cadd = categoriesDAO.checkExist(id2);
                String fileName1 = getImageName(request);
                byte[] fileData1 = getImage(request);
                Item i = new Item(productName, productDesc, price2, stock2, cadd.getCategoryID());
                if (fileName1 != null) {
                    i.setAvatar_name(fileName1);
                }
                if (fileData1 != null) {
                    i.setAvatar_img(fileData1);
                }
                productsDAO.registerProduct(i);
                response.sendRedirect("ProductControl");
                break;
            case "Edit":
                Item p = productsDAO.checkExist(id);
                Categories c = categoriesDAO.checkExist(id2);
                String fileName = getImageName(request);
                byte[] fileData = getImage(request);
                p.setProductName(productName);
                p.setDescription(productDesc);
                p.setPrice(price2);
                p.setStockQuantity(stock2);
                p.setCategoryID(c.getCategoryID());
                if (fileName != null) {
                    p.setAvatar_name(fileName);
                }
                if (fileData != null) {
                    p.setAvatar_img(fileData);
                }
                productsDAO.updateProduct(p);
                pageValue(request);
//                request.getRequestDispatcher("ProductControl").forward(request, response);
                response.sendRedirect("ProductControl?page=" + request.getParameter("page") + "&pageSize=" + request.getParameter("pageSize"));
                break;
            case "Cancel":
                pageValue(request);
                request.getRequestDispatcher("ProductControl").forward(request, response);
                break;
            default:
                break;
        }
        request.getRequestDispatcher("ProductControl").forward(request, response);
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

    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String productID = request.getParameter("id").trim();
        ItemDAO productsDAO = new ItemDAO();
        CategoriesDAO categoriesDAO = new CategoriesDAO();
        ArrayList<Categories> list = categoriesDAO.getAllCategories();
        Item product = productsDAO.checkExist(Integer.parseInt(productID));
        pageValue(request);
        request.setAttribute("categoryList", list);
        request.setAttribute("product", product);
        request.getRequestDispatcher("admin/updateItem.jsp").forward(request, response);
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String productID = request.getParameter("id").trim();
        ItemDAO productsDAO = new ItemDAO();
        Item product = productsDAO.checkExist(Integer.parseInt(productID));
        if (product != null){
            productsDAO.deleteProduct(product.getProductID());
        }
        response.sendRedirect("ProductControl?page=" + request.getParameter("page") + "&pageSize=" + request.getParameter("pageSize"));
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
        CategoriesDAO categoriesDAO = new CategoriesDAO();
        ArrayList<Item> products = productsDAO.getAllProducts(offset, pageSize);
        request.setAttribute("products", products);
        request.setAttribute("categoryList", categoriesDAO.getAllCategories());
        int rows = productsDAO.getNumberOfRows();
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
