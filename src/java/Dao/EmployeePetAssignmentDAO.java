/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import ConnectDB.DBContext;
import Model.EmployeePetAssignment;
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
public class EmployeePetAssignmentDAO {
    public void registerEmployeePetAssignment(EmployeePetAssignment c) {
        String query = "insert into EmployeePetAssignment(EmployeeID, CustomerPetID, Status)\n"
                + "values(?, ?, ?, ?)";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, c.getDoctorID());
            ps.setInt(2, c.getCustomerPetID());
            ps.setString(3, c.getStatus());
            ps.execute();
            new DBContext().close(conn, ps, null);
        } catch (Exception e) {
            Logger.getLogger(EmployeePetAssignmentDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public ArrayList<EmployeePetAssignment> findAllEmployeePetAssignmentByEmployeeID(int employeeID) {
        String query = "select * from EmployeePetAssignment\n"
                + "where employeeID = ?\n";
        ArrayList<EmployeePetAssignment> list = new ArrayList<>();
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, employeeID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                EmployeePetAssignment c = new EmployeePetAssignment(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDate(4), rs.getString(5));
                list.add(c);
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception e) {
            Logger.getLogger(EmployeePetAssignmentDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }
    
    public ArrayList<EmployeePetAssignment> findAllEmployeePetAssignmentByDate(int requestID) {
        String query = "select * from EmployeePetAssignment\n"
                + "where AssignmentDate = ?\n";
        ArrayList<EmployeePetAssignment> list = new ArrayList<>();
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, requestID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                EmployeePetAssignment c = new EmployeePetAssignment(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDate(4), rs.getString(5));
                list.add(c);
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception e) {
            Logger.getLogger(EmployeePetAssignmentDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public void deleteEmployeePetAssignment(int id) {
        try {
            DBContext db = new DBContext();
            PreparedStatement statement;
            try (Connection con = db.getConnection()) {
                String sql = "DELETE FROM EmployeePetAssignment WHERE AssignmentID=?";
                statement = con.prepareStatement(sql);
                statement.setInt(1, id);
                statement.execute();
            }
            statement.close();
        } catch (SQLException | NumberFormatException ex) {
            Logger.getLogger(EmployeePetAssignmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateEmployeePetAssignment(EmployeePetAssignment c) {
        String sql = " UPDATE EmployeePetAssignment\n" + "SET Status = ?\n" + "WHERE AssignmentID = ?";
        DBContext db = new DBContext();
        try {
            Connection con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, c.getStatus());
            statement.setInt(2, c.getAssignmentID());
            statement.execute();
            new DBContext().close(con, statement, null);
        } catch (Exception ex) {
            Logger.getLogger(EmployeePetAssignmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public EmployeePetAssignment checkExist(int id) {
        String query = "select * from EmployeePetAssignment\n"
                + "where AssignmentID = ?\n";
        EmployeePetAssignment c = null;
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                c = new EmployeePetAssignment(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDate(4), rs.getString(5));
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception e) {
            Logger.getLogger(EmployeePetAssignmentDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return c;
    }
}
