/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.CustomerDAO;
import Dao.PetsDAO;
import Dao.ServiceBookingDAO;
import Dao.ServicesDAO;
import Model.ServiceBooking;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
public class BookedServiceControl extends HttpServlet {

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
            out.println("<title>Servlet BookedServiceControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookedServiceControl at " + request.getContextPath() + "</h1>");
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
                    deleteServiceBooking(request, response);
                    break;
                default:
                    break;
            }
        } else {
            pageValue(request);
            request.getRequestDispatcher("booking_2.jsp").forward(request, response);
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

        ServiceBookingDAO serviceDAO = new ServiceBookingDAO();
        ServicesDAO serDAO = new ServicesDAO();
        CustomerDAO cusDAO = new CustomerDAO();
        PetsDAO petDAO = new PetsDAO();

        String serviceID;
        Integer serId = null;

        String customerID;
        Integer cusId = null;

        if (request.getParameter("serviceID") != null) {
            serviceID = request.getParameter("serviceID");
            serId = Integer.parseInt(serviceID);
        }

        if (request.getParameter("customerID") != null) {
            customerID = request.getParameter("customerID");
            cusId = Integer.parseInt(customerID);
        }

//        String status = request.getParameter("status").trim();
        String submit = request.getParameter("submit");
        switch (submit) {
            case "Booking now":
                ServiceBooking i = new ServiceBooking(serId, cusId, LocalDateTime.now());
                serviceDAO.registerServiceBooking(i);
                request.setAttribute("serbook1", i);

                request.getRequestDispatcher("booking_1.jsp").forward(request, response);

                break;
            case "Continue":
                String serID;
                Integer serid = null;

                String cusID;
                Integer cusid = null;

                if (request.getParameter("serID") != null) {
                    serID = request.getParameter("serID");
                    serid = Integer.parseInt(serID);
                }

                if (request.getParameter("cusID") != null) {
                    cusID = request.getParameter("cusID");
                    cusid = Integer.parseInt(cusID);
                }

                String dateString = request.getParameter("date"); // dạng yyyy-MM-dd
                String timeString = request.getParameter("time"); // dạng HH:mm

                DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                LocalDate dates = LocalDate.parse(dateString, dateFormatter);
                DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
                LocalTime time = LocalTime.parse(timeString, timeFormatter);

                LocalDateTime serviceDate = LocalDateTime.of(dates, time);
                ArrayList<ServiceBooking> list = serviceDAO.getAllServiceBookings();
                ArrayList<Integer> l = new ArrayList<>();
                
                for (ServiceBooking li : list) {
                    l.add(li.getServiceBookedID());
                }
                
                ServiceBooking sb = serviceDAO.checkExist(Collections.max(l), cusid);
                sb.setServiceDate(serviceDate);

                serviceDAO.updateServiceBooking(sb);
                request.setAttribute("cus", cusDAO.checkExist(cusid));
                request.setAttribute("ser", serDAO.checkExist(serid));
                request.setAttribute("pet", petDAO.checkExistByCusID(cusid));
                request.setAttribute("date", sb.ServiceDate());

                request.getRequestDispatcher("booking_3.jsp").forward(request, response);
                break;

            case "Cancel":
                pageValue(request);
                request.getRequestDispatcher("BookedServiceControl").forward(request, response);
                break;
            default:
                break;
        }
        request.getRequestDispatcher("BookedServiceControl").forward(request, response);
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
        ServiceBookingDAO serviceDAO = new ServiceBookingDAO();

        ServiceBooking service = serviceDAO.checkExist(Integer.parseInt(serviceID));
        pageValue(request);

        request.setAttribute("serviceBooked", service);
        request.getRequestDispatcher("admin/updateServiceBooked.jsp").forward(request, response);
    }

    private void deleteServiceBooking(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String serviceID = request.getParameter("serviceBookedID").trim();

        ServiceBookingDAO productsDAO = new ServiceBookingDAO();
        ServiceBooking service = productsDAO.checkExist(Integer.parseInt(serviceID));
        if (service != null) {
            productsDAO.deleteServiceBooking(service.getServiceBookedID());
        }
        response.sendRedirect("BookedServiceControl?page=" + request.getParameter("page") + "&pageSize=" + request.getParameter("pageSize"));
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
        ServiceBookingDAO serviceDao = new ServiceBookingDAO();
        ArrayList<ServiceBooking> serviceBookings = serviceDao.getAllServiceBooking(offset, recordsPerPage);
        request.setAttribute("serviceBookings", serviceBookings);
        int rows = serviceDao.getNumberOfRows();
        int totalPages = (int) Math.ceil((double) rows / recordsPerPage);
        request.setAttribute("noOfPages", totalPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("recordsPerPage", recordsPerPage);
    }
}
