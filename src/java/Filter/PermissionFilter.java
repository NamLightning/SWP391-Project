/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Filter;

import Dao.CustomerDAO;
import Dao.EmployeeDAO;
import Dao.ManagerDAO;
import Model.Employee;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class PermissionFilter implements Filter {

    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;

    public PermissionFilter() {
    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("PermissionFilter:DoBeforeProcessing");
        }

        // Write code here to process the request and/or response before
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log items on the request object,
        // such as the parameters.
	/*
         for (Enumeration en = request.getParameterNames(); en.hasMoreElements(); ) {
         String name = (String)en.nextElement();
         String values[] = request.getParameterValues(name);
         int n = values.length;
         StringBuffer buf = new StringBuffer();
         buf.append(name);
         buf.append("=");
         for(int i=0; i < n; i++) {
         buf.append(values[i]);
         if (i < n-1)
         buf.append(",");
         }
         log(buf.toString());
         }
         */
    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("PermissionFilter:DoAfterProcessing");
        }

	// Write code here to process the request and/or response after
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log the attributes on the
        // request object after the request has been processed. 
	/*
         for (Enumeration en = request.getAttributeNames(); en.hasMoreElements(); ) {
         String name = (String)en.nextElement();
         Object value = request.getAttribute(name);
         log("attribute: " + name + "=" + value.toString());

         }
         */
        // For example, a filter might append something to the response.
	/*
         PrintWriter respOut = new PrintWriter(response.getWriter());
         respOut.println("<P><B>This has been appended by an intrusive filter.</B>");
         */
    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    private static final Map<String, List<String>> roleAccessMap = new HashMap<>();
    private static final Map<String, List<String>> roleNoAccessMap = new HashMap<>();

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        if (debug) {
            log("PermissionFilter:doFilter()");
        }

        doBeforeProcessing(request, response);

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        log("Session: " + (session != null ? "exists" : "null"));
        log("RequestedURI: " + httpRequest.getRequestURI());
        log("ServletPath: " + httpRequest.getServletPath());
        String url = httpRequest.getServletPath();
        String username = session != null ? ((String) session.getAttribute("us") == null ? null : (String) session.getAttribute("us")) : null;
        String role = getUserRoleByUsername(username);
        log("Role: " + role);
        if (isStaticResource(url)) {
            chain.doFilter(request, response);
            return;
        }
        if (role != null && isRestrictedForRole(role, url)) {
            httpResponse.sendRedirect("/PetStore/error.jsp");
            return;
        }

        if (role == null || !isAuthorizedForPath(role, url)) {
            if (role.equals("Guest") || role.equals("Customer")) {
                httpResponse.sendRedirect("/PetStore/error.jsp");
            }
            if (role.equals("Manager")){
                httpResponse.sendRedirect("admin/admin.jsp");
            }
            return;
        }
        Throwable problem = null;
        try {
            chain.doFilter(request, response);
        } catch (Throwable t) {
            // If an exception is thrown somewhere down the filter chain,
            // we still want to execute our after processing, and then
            // rethrow the problem after that.
            problem = t;
            t.printStackTrace();
        }

        doAfterProcessing(request, response);

        // If there was a problem, we want to rethrow it if it is
        // a known type, otherwise log it.
        if (problem != null) {
            if (problem instanceof ServletException) {
                throw (ServletException) problem;
            }
            if (problem instanceof IOException) {
                throw (IOException) problem;
            }
            sendProcessingError(problem, response);
        }
    }

    private boolean isStaticResource(String url) {
        return url.endsWith(".css") || url.endsWith(".js");
    }

    private String getUserRoleByUsername(String username) {
        CustomerDAO customerDAO = new CustomerDAO();
        EmployeeDAO employeeDAO = new EmployeeDAO();
        ManagerDAO managerDAO = new ManagerDAO();
        if (managerDAO.findManagerByUsername(username) != null) {
            return "Manager";
        }
        if (employeeDAO.findEmployeeByUsername(username) != null) {
            return "Employee";
        }
        if (customerDAO.findCustomerByUsername(username) != null) {
            return "Customer";
        }
        return "Guest";
    }

    private boolean isAuthorizedForPath(String role, String path) {
        // Get the allowed paths for the role
        List<String> allowedPaths = roleAccessMap.get(role);
        if (allowedPaths == null) {
            return false;
        }

        // Check if any allowed path is a prefix of the requested path
        for (String allowedPath : allowedPaths) {
            if (path.startsWith(allowedPath)) {
                return true;
            }
        }
        return false;
    }

    private boolean isRestrictedForRole(String role, String url) {
        List<String> restrictedUrls = roleNoAccessMap.get(role);
        return restrictedUrls != null && restrictedUrls.stream().anyMatch(url::startsWith);
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("PermissionFilter:Initializing filter");
            }
        }
        roleAccessMap.put("Guest", Arrays.asList("/CategoriesControl", "/cart.jsp", "/landingPage.jsp", "/homePage.jsp", "/login.jsp", "/signUp.jsp", "/servicePage.jsp", "/news_blog.jsp", "/error.jsp", "/contactUsPage.jsp", "/forgotPassword_ChangePass.jsp", "/forgotPassword_EnterCode.jsp", "/forgotPassword_EnterEmail.jsp", "/forgotPassword_Success.jsp", "/LoginControl", "/ForgotPasswordControl", "/SignUpControl", "/NewPasswordControl", "/ValidateOtp"));
        roleAccessMap.put("Customer", Arrays.asList("/CategoriesControl", "/CheckOutControl", "/CartControl", "/LogOutControl", "/checkOut.jsp", "/cart.jsp", "/landingPage.jsp", "/homePage.jsp", "/servicePage.jsp", "/news_blog.jsp", "/error.jsp", "/contactUsPage.jsp", "/userProfile.jsp"));
        roleAccessMap.put("Employee", Arrays.asList("/employee/", "/CategoriesControl", "/LogOutControl"));
        roleAccessMap.put("Manager", Arrays.asList("/admin/", "/manager-listEmployee.jsp", "/LogOutControl", "/ProductControl", "/DataServlet"));
        roleNoAccessMap.put("Manager", Arrays.asList("/admin/editProduct.jsp", "/admin/product.jsp"));
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("PermissionFilter()");
        }
        StringBuffer sb = new StringBuffer("PermissionFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
