/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.Customer;
import ConnectDB.DBContext;


/**
 *
 * @author Administrator
 */
public class CustomerDAO {
    public void registerCustomer(Customer c) {
        String query = "insert into Customers(Username, [Password], FirstName, LastName, Email, PhoneNumb, address)\n"
                + "values(?, ?, ?, ?, ?, ?, ?)";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, c.getUsername());
            ps.setString(2, c.getPassword());
            ps.setString(3, c.getFirstName());
            ps.setString(4, c.getLastName());
            ps.setString(5, c.getEmail());
            ps.setString(6, c.getPhoneNumber());
            ps.setString(7, c.getAddress());
            ps.execute();
            new DBContext().close(conn, ps, null);
        } catch (Exception e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public Customer findCustomerByUsername(String username) {
        String query = "select * from Customers\n"
                + "where Username = ?\n";
        Customer c = null;
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception e) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return c;
    }
    
    public Customer findCustomerByPhoneNumb(String phoneNumb) {
        String query = "select * from Customers\n"
                + "where PhoneNumb = ?\n";
        Customer c = null;
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, phoneNumb);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception e) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return c;
    }

    public void deleteCustomer(int id) {
        try {
            DBContext db = new DBContext();
            PreparedStatement statement;
            try (Connection con = db.getConnection()) {
                String sql = "DELETE FROM Customers WHERE CustomerID=?";
                statement = con.prepareStatement(sql);
                statement.setInt(1, id);
                statement.execute();
            }
            statement.close();
        } catch (SQLException | NumberFormatException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateCustomer(Customer c) {
        String sql = " UPDATE Customers\n" + "SET Username = ?, [Password] = ?, FirstName = ?, LastName = ?, Email = ?, PhoneNumb = ?, address = ?\n" + "WHERE CustomerID = ?";
        DBContext db = new DBContext();
        try {
            Connection con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, c.getUsername());
            statement.setString(2, c.getPassword());
            statement.setString(3, c.getFirstName());
            statement.setString(4, c.getLastName());
            statement.setString(5, c.getEmail());
            statement.setString(6, c.getPhoneNumber());
            statement.setString(7, c.getAddress());
            statement.setInt(8, c.getCustomerID());
            statement.execute();
            new DBContext().close(con, statement, null);
        } catch (Exception ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Customer checkExist(int id) {
        String query = "select * from Customers\n"
                + "where CustomerID = ?\n";
        Customer c = null;
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception e) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return c;
    }
}
