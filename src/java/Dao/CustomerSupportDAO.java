/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import ConnectDB.DBContext;
import Model.CustomerSupport;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Administrator
 */
public class CustomerSupportDAO {
    public void registerCustomerSupport(CustomerSupport c) {
        String query = "insert into CustomerSupport(EmployeeID, RequestID, Response)\n"
                + "values(?, ?, ?)";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, c.getEmployeeID());
            ps.setInt(2, c.getRequestID());
            ps.setString(3, c.getResponse());
            ps.execute();
            new DBContext().close(conn, ps, null);
        } catch (Exception e) {
            Logger.getLogger(CustomerSupportDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public ArrayList<CustomerSupport> findAllCustomerSupportByEmployeeID(int employeeID) {
        String query = "select * from CustomerSupport\n"
                + "where employeeID = ?\n";
        ArrayList<CustomerSupport> list = new ArrayList<>();
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, employeeID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CustomerSupport c = new CustomerSupport(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4));
                list.add(c);
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception e) {
            Logger.getLogger(CustomerSupportDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }
    
    public ArrayList<CustomerSupport> findAllCustomerSupportByRequestID(int requestID) {
        String query = "select * from CustomerSupport\n"
                + "where RequestID = ?\n";
        ArrayList<CustomerSupport> list = new ArrayList<>();
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, requestID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CustomerSupport c = new CustomerSupport(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4));
                list.add(c);
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception e) {
            Logger.getLogger(CustomerSupportDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public void deleteCustomerSupport(int id) {
        try {
            DBContext db = new DBContext();
            PreparedStatement statement;
            try (Connection con = db.getConnection()) {
                String sql = "DELETE FROM CustomerSupport WHERE SupportID=?";
                statement = con.prepareStatement(sql);
                statement.setInt(1, id);
                statement.execute();
            }
            statement.close();
        } catch (SQLException | NumberFormatException ex) {
            Logger.getLogger(CustomerSupportDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateCustomerSupport(CustomerSupport c) {
        String sql = " UPDATE CustomerSupport\n" + "SET Response = ?\n" + "WHERE SupportID = ?";
        DBContext db = new DBContext();
        try {
            Connection con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, c.getResponse());
            statement.setInt(2, c.getRequestID());
            statement.execute();
            new DBContext().close(con, statement, null);
        } catch (Exception ex) {
            Logger.getLogger(CustomerSupportDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public CustomerSupport checkExist(int id) {
        String query = "select * from CustomerSupport\n"
                + "where SupportID = ?\n";
        CustomerSupport c = null;
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                c = new CustomerSupport(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4));
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception e) {
            Logger.getLogger(CustomerSupportDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return c;
    }
}
