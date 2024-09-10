/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import ConnectDB.DBContext;
import Model.CustomerPet;
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
public class CustomerPetDAO {
    public void registerCustomerPet(CustomerPet c) {
        String query = "insert into CustomerPets(CustomerID, AssignedTo, HealthStatus)\n"
                + "values(?, ?, ?)";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, c.getCustomerID());
            ps.setInt(2, c.getAssignTo());
            ps.setString(3, c.getHealthStatus());
            ps.execute();
            new DBContext().close(conn, ps, null);
        } catch (Exception e) {
            Logger.getLogger(CustomerPetDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public ArrayList<CustomerPet> findAllCustomerPetByCustomerID(int customerID) {
        String query = "select * from CustomerPets\n"
                + "where CustomerID = ?\n";
        ArrayList<CustomerPet> list = new ArrayList<>();
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, customerID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CustomerPet c = new CustomerPet(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4));
                list.add(c);
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception e) {
            Logger.getLogger(CustomerPetDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }
    
    public ArrayList<CustomerPet> findAllPetByAssignedTo(int assignedTo) {
        String query = "select * from CustomerPets\n"
                + "where assignedTo = ?\n";
        ArrayList<CustomerPet> list = new ArrayList<>();
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, assignedTo);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CustomerPet c = new CustomerPet(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4));
                list.add(c);
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception e) {
            Logger.getLogger(CustomerPetDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public void deleteCustomerPet(int id) {
        try {
            DBContext db = new DBContext();
            PreparedStatement statement;
            try (Connection con = db.getConnection()) {
                String sql = "DELETE FROM CustomerPets WHERE CustomerPetID=?";
                statement = con.prepareStatement(sql);
                statement.setInt(1, id);
                statement.execute();
            }
            statement.close();
        } catch (SQLException | NumberFormatException ex) {
            Logger.getLogger(CustomerPetDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateCustomerPet(CustomerPet c) {
        String sql = " UPDATE CustomerPets\n" + "SET HealthStatus = ?\n" + "WHERE CustomerPetID = ?";
        DBContext db = new DBContext();
        try {
            Connection con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, c.getHealthStatus());
            statement.setInt(2, c.getCustomerPetID());
            statement.execute();
            new DBContext().close(con, statement, null);
        } catch (Exception ex) {
            Logger.getLogger(CustomerPetDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public CustomerPet checkExist(int id) {
        String query = "select * from CustomerPets\n"
                + "where CustomerPetID = ?\n";
        CustomerPet c = null;
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                c = new CustomerPet(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4));
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception e) {
            Logger.getLogger(CustomerPetDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return c;
    }
}
