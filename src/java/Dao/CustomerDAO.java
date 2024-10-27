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
        String query = "insert into Customers(Username, [Password], FirstName, LastName, Email, PhoneNumb, address, AvatarName, Avatar_Img)\n"
                + "values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, c.getUsername());
            ps.setString(2, c.getPassword());
            ps.setString(3, c.getFirstName());
            ps.setString(4, c.getLastName());
            ps.setString(5, c.getEmail());
            ps.setString(6, c.getPhoneNumber());
            ps.setString(7, c.getAddress());
            ps.setString(8, c.getAvatar_name());
            ps.setBytes(9, c.getAvatar_img());
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
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getBytes(10));
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
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, phoneNumb);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getBytes(10));
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception e) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return c;
    }

    public void deleteCustomer(int id) {
        Connection con = null;
        try {
            PreparedStatement statement;
            con = DBContext.getConnection();
            String sql = "DELETE FROM Customers WHERE CustomerID=?";
            statement = con.prepareStatement(sql);
            statement.setInt(1, id);
            statement.execute();
            statement.close();
        } catch (SQLException | NumberFormatException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateCustomer(Customer c) {
        String sql = " UPDATE Customers\n" + "SET Username = ?, [Password] = ?, FirstName = ?, LastName = ?, Email = ?, PhoneNumb = ?, address = ?, AvatarName = ?, Avatar_Img = ?\n" + "WHERE CustomerID = ?";
        Connection con = null;
        try {
            con = DBContext.getConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, c.getUsername());
            statement.setString(2, c.getPassword());
            statement.setString(3, c.getFirstName());
            statement.setString(4, c.getLastName());
            statement.setString(5, c.getEmail());
            statement.setString(6, c.getPhoneNumber());
            statement.setString(7, c.getAddress());
            statement.setString(8, c.getAvatar_name());
            statement.setBytes(9, c.getAvatar_img());
            statement.setInt(10, c.getCustomerID());
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
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getBytes(10));
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception e) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return c;
    }

    public Customer checkLogin(String username, String password) {
        Connection con = null;
        Customer a = null;
        try {
            String query = "select * from Customers where Username = ? and [Password] = ?";
            con = DBContext.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                a = new Customer(rs.getString(1), rs.getString(2));
            }
            DBContext.GetInstance().close(con, ps, rs);
        } catch (Exception e) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return a;
    }

    public Customer findByEmail(Customer account) {
        String sqlQuerry_find = "SELECT CustomerID, Username, Email FROM Account WHERE Email=?";
        String check_email = account.getEmail();
        Customer a = null;
        Connection con = null;
        try {
            con = DBContext.getConnection();
            PreparedStatement ps = con.prepareStatement(sqlQuerry_find);
            ps.setString(1, check_email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                a = new Customer(rs.getInt(1), rs.getString(2), rs.getString(3));
            }
            con.close();
        } catch (Exception e) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return a;
    }

    public void addnewAccountWithGoogle(Customer account) {
        String email = account.getEmail();
        String sqlQuerry_add = "insert into Account(Username,Password,Email) values(?,?,?);";
        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(sqlQuerry_add);
            ps.setString(1, account.getUsername());
            ps.setString(2, account.getPassword());
            ps.setString(3, email);
            ps.execute();
            conn.close();
        } catch (Exception e) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
}
