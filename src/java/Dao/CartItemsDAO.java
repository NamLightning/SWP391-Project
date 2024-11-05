/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import ConnectDB.DBContext;
import Model.CartItems;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Administrator
 */
public class CartItemsDAO {
    public void registerCartItems(CartItems c) {
        String query = "insert into CartItems(CustomerID, ProductID, Quantity)\n"
                + "values(?, ?, ?)";
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, c.getCustomerID());
            ps.setInt(2, c.getProductID());
            ps.setInt(3, c.getQuantity());
            ps.execute();
            DBContext.GetInstance().close(conn, ps, null);
        } catch (Exception ex) {
            Logger.getLogger(CartItemsDAO.class.getName()).log(Level.SEVERE, null, ex);
            
        }
    }

    public CartItems findCartItemsByCustomer(int customerID, int productID) {
        String query = "select * from CartItems\n"
                + "where CustomerID = ? and ProductID = ?\n";
        CartItems c = null;
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, customerID);
            ps.setInt(2, productID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                c = new CartItems(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4));
            }
            DBContext.GetInstance().close(conn, ps, rs);
        } catch (Exception ex) {
            Logger.getLogger(CartItemsDAO.class.getName()).log(Level.SEVERE, null, ex);  
        }
        return c;
    }

    public ArrayList<CartItems> getAllCartItems(int customerID) {
        String query = "select * from CartItems Where CustomerID = ?\n";
        ArrayList<CartItems> list = new ArrayList<>();
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, customerID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CartItems c = new CartItems(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4));
                list.add(c);
            }
            DBContext.GetInstance().close(conn, ps, rs);
        } catch (Exception ex) {
            Logger.getLogger(CartItemsDAO.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        return list;
    }

    public void deleteCartItems(int id) {
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            PreparedStatement statement;
            String sql = "DELETE FROM CartItems WHERE CartItemID=?";
            statement = conn.prepareStatement(sql);
            statement.setInt(1, id);
            statement.execute();
            DBContext.GetInstance().close(conn, statement, null);
        } catch (Exception ex) {
            Logger.getLogger(CartItemsDAO.class.getName()).log(Level.SEVERE, null, ex);
            
        }
    }

    public void updateCartItems(CartItems c) {
        String sql = " UPDATE CartItems\n" + "SET Quantity = ?\n" + "WHERE CartItemID = ?";
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, c.getQuantity());
            statement.setInt(2, c.getCartItemID());
            statement.execute();
            DBContext.GetInstance().close(conn, statement, null);
        } catch (Exception ex) {
            Logger.getLogger(CartItemsDAO.class.getName()).log(Level.SEVERE, null, ex);
            
        }
    }

    public CartItems checkExist(int id) {
        String query = "select * from CartItems\n"
                + "where CartItemID = ?\n";
        CartItems c = null;
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                c = new CartItems(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4));
            }
            DBContext.GetInstance().close(conn, ps, rs);
        } catch (Exception ex) {
            Logger.getLogger(CartItemsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }
}
