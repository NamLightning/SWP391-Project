/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

/**
 *
 * @author Administrator
 */
@ServerEndpoint("/chatserver/{username}/{role}")
public class WebSocketChatServer extends HttpServlet {

    private static Set<Session> customerSessions = Collections.synchronizedSet(new HashSet<>());
    private static Set<Session> employeeSessions = Collections.synchronizedSet(new HashSet<>());
    private static Map<Session, Session> customerToEmployeeMap = new ConcurrentHashMap<>();

    @OnOpen
    public void onOpen(Session session, @PathParam("username") String username, @PathParam("role") String role) {
        session.getUserProperties().put("username", username);
        session.getUserProperties().put("role", role);

        if ("customer".equals(role)) {
            customerSessions.add(session);
            assignCustomerToEmployee(session);
        } else if ("employee".equals(role)) {
            employeeSessions.add(session);
        }
    }

    private void assignCustomerToEmployee(Session customerSession) {
        for (Session employeeSession : employeeSessions) {
            if (!customerToEmployeeMap.containsValue(employeeSession)) {
                customerToEmployeeMap.put(customerSession, employeeSession);
                break;
            }
        }
    }

    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        String role = (String) session.getUserProperties().get("role");
        if ("customer".equals(role)) {
            sendToAssignedEmployee(session, message);
        } else if ("employee".equals(role)) {
            sendToAssignedCustomer(session, message);
        }
    }

    private void sendToAssignedEmployee(Session customerSession, String message) {
        Session employeeSession = customerToEmployeeMap.get(customerSession);
        if (employeeSession != null && employeeSession.isOpen()) {
            try {
                String username = (String) customerSession.getUserProperties().get("username");
                employeeSession.getBasicRemote().sendText("Customer " + username + ": " + message);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void sendToAssignedCustomer(Session employeeSession, String message) {
        for (Map.Entry<Session, Session> entry : customerToEmployeeMap.entrySet()) {
            if (entry.getValue().equals(employeeSession)) {
                try {
                    String username = (String) employeeSession.getUserProperties().get("username");
                    entry.getKey().getBasicRemote().sendText("Employee " + username + ": " + message);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                break;
            }
        }
    }

    @OnClose
    public void onClose(Session session) {
        customerSessions.remove(session);
        employeeSessions.remove(session);
        customerToEmployeeMap.remove(session);
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        throwable.printStackTrace();
    }

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
            out.println("<title>Servlet WebSocketChatServer</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet WebSocketChatServer at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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

}
