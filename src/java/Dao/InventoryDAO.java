/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import ConnectDB.DBContext;
import Model.Inventory;
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
public class InventoryDAO {
    public void registerInventory(Inventory i) {
        String query = "insert into Inventory(ProductID, Quantity, ManagerID)\n"
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
            Logger.getLogger(InventoryDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public ArrayList<Inventory> findAllInventoryByEmployeeID(int employeeID) {
        String query = "select * from Inventory\n"
                + "where employeeID = ?\n";
        ArrayList<Inventory> list = new ArrayList<>();
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, employeeID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Inventory i = new Inventory(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4));
                list.add(c);
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception e) {
            Logger.getLogger(InventoryDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }
    
    public ArrayList<Inventory> findAllInventoryByRequestID(int requestID) {
        String query = "select * from Inventory\n"
                + "where RequestID = ?\n";
        ArrayList<Inventory> list = new ArrayList<>();
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, requestID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Inventory i = new Inventory(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4));
                list.add(i);
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception e) {
            Logger.getLogger(InventoryDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public void deleteInventory(int id) {
        try {
            DBContext db = new DBContext();
            PreparedStatement statement;
            try (Connection con = db.getConnection()) {
                String sql = "DELETE FROM Inventory WHERE InventoryID=?";
                statement = con.prepareStatement(sql);
                statement.setInt(1, id);
                statement.execute();
            }
            statement.close();
        } catch (SQLException | NumberFormatException ex) {
            Logger.getLogger(InventoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateInventory(Inventory i) {
        String sql = " UPDATE Inventory\n" + "SET Quantity = ?\n" + "WHERE InventoryID = ?";
        DBContext db = new DBContext();
        try {
            Connection con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, i.getQuantity());
            statement.setInt(2, i.getInventoryID());
            statement.execute();
            new DBContext().close(con, statement, null);
        } catch (Exception ex) {
            Logger.getLogger(InventoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Inventory checkExist(int id) {
        String query = "select * from Inventory\n"
                + "where SupportID = ?\n";
        Inventory i = null;
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                i = new Inventory(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4));
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception e) {
            Logger.getLogger(InventoryDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return i;
    }
}