/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.CategoriesDAO;
import Dao.ProductsDAO;
import Model.Categories;
import Model.Products;
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
public class ProductControl extends HttpServlet {

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
                    pageValue(request);
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
            request.getRequestDispatcher("product.jsp").forward(request, response);
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

        ProductsDAO productsDAO = new ProductsDAO();
        CategoriesDAO categoriesDAO = new CategoriesDAO();

        String productID = request.getParameter("productID").trim();
        int id = Integer.parseInt(productID);
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
            case "Edit":
                Products p = productsDAO.checkExist(id);
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
                request.getRequestDispatcher("product.jsp").forward(request, response);
                break;
            case "Cancel":
                pageValue(request);
                request.getRequestDispatcher("product.jsp").forward(request, response);
                break;
            default:
                break;
        }
        request.getRequestDispatcher("product.jsp").forward(request, response);
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
        ProductsDAO productsDAO = new ProductsDAO();
        CategoriesDAO categoriesDAO = new CategoriesDAO();
        ArrayList<Categories> list = categoriesDAO.getAllCategories();
        Products product = productsDAO.checkExist(Integer.parseInt(productID));
        request.setAttribute("categoryList", list);
        request.setAttribute("product", product);
        request.getRequestDispatcher("editProduct.jsp").forward(request, response);
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
        ProductsDAO productsDAO = new ProductsDAO();
        ArrayList<Products> products = productsDAO.getAllProducts(currentPage, recordsPerPage);
        request.setAttribute("products", products);
        int rows = productsDAO.getNumberOfRows();
        int nOfPages = rows / recordsPerPage;
        if (nOfPages % recordsPerPage > 0) {
            nOfPages++;
        }
        request.setAttribute("noOfPages", nOfPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("recordsPerPage", recordsPerPage);
    }

}