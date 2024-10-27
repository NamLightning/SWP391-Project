/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import ConnectDB.DBContext;
import Model.Item;
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
public class ItemDAO {

    private static ItemDAO productsDAO;

    public static ItemDAO getInstance() {
        if (productsDAO == null) {
            productsDAO = new ItemDAO();
        }
        return productsDAO;
    }

    public void registerProduct(Item p) {
        String query = "insert into Products(ProductName, [Description], Price, StockQuantity, CategoryID, AvatarName, Avatar_Img)\n"
                + "values(?, ?, ?, ?, ?, ?, ?)";
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, p.getProductName());
            ps.setString(2, p.getDescription());
            ps.setDouble(3, p.getPrice());
            ps.setInt(4, p.getStockQuantity());
            ps.setInt(5, p.getCategoryID());
            ps.setString(6, p.getAvatar_name());
            ps.setBytes(7, p.getAvatar_img());
            ps.execute();
            DBContext.GetInstance().close(conn, ps, null);
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Item> getAllProducts() {
        String query = "select * from Products\n";
        ArrayList<Item> list = new ArrayList<>();
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Item p = new Item(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getBytes(8));
                list.add(p);
            }
            DBContext.GetInstance().close(conn, ps, rs);
        } catch (Exception e) {
            Logger.getLogger(ItemDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }
    
    public ArrayList<Item> getAllProductsWithCategory(int CategoryID) {
        String query = "select * from Products Where CategoryID = ?\n";
        ArrayList<Item> list = new ArrayList<>();
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, CategoryID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Item p = new Item(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getBytes(8));
                list.add(p);
            }
            DBContext.GetInstance().close(conn, ps, rs);
        } catch (Exception e) {
            Logger.getLogger(ItemDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public ArrayList<Item> getAllProducts(int currentPage, int recordsPerPage) {

        ArrayList<Item> list = new ArrayList<>();
        Connection con = null;
        try {
            con = DBContext.getConnection();

            int start = currentPage * recordsPerPage - recordsPerPage;
            int end = recordsPerPage * currentPage;
            String sql = "With prod AS\n"
                    + "( SELECT *,\n"
                    + "ROW_NUMBER() OVER (order by ProductID) as RowNumber \n"
                    + "FROM Products )\n"
                    + "select *\n"
                    + "from prod\n"
                    + "Where RowNumber Between ? and ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, start);
            ps.setInt(2, end);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Item p = new Item(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getBytes(8));
                list.add(p);
            }
            new DBContext().close(con, ps, rs);
        } catch (Exception ex) {
            Logger.getLogger(ItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Integer getNumberOfRows() {
        Integer numOfRows = 0;
        Connection con = null;
        try {
            con = DBContext.getConnection();
            String sql = "SELECT * FROM Products";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                numOfRows++;
            }
            DBContext.GetInstance().close(con, ps, rs);
        } catch (Exception ex) {
            Logger.getLogger(ItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return numOfRows;
    }

    public Item findProductByProductName(String productName) {
        String query = "select * from Products\n"
                + "where ProductName = ?\n";
        Item p = null;
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, productName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p = new Item(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getBytes(8));
            }
            DBContext.GetInstance().close(conn, ps, rs);
        } catch (Exception ex) {
            Logger.getLogger(ItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }

    public Item findProductByCategory(int category) {
        String query = "select * from Products\n"
                + "where CategoryID = ?\n";
        Item p = null;
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, category);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p = new Item(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getBytes(8));
            }
            DBContext.GetInstance().close(conn, ps, rs);
        } catch (Exception ex) {
            Logger.getLogger(ItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }

    public void deleteProduct(int id) {
        Connection conn = null;
        try {
            PreparedStatement statement;
            Connection con = DBContext.getConnection();
            String sql = "DELETE FROM Products WHERE ProductID=?";
            statement = con.prepareStatement(sql);
            statement.setInt(1, id);
            statement.execute();
            DBContext.GetInstance().close(conn, statement, null);
        } catch (Exception ex) {
            Logger.getLogger(ItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateProduct(Item p) {
        String sql = " UPDATE Products\n" + "SET ProductName = ?, [Description] = ?, Price = ?, StockQuantity = ?, CategoryID = ?, AvatarName = ?, Avatar_Img = ?\n" + "WHERE ProductID = ?";
        Connection con = null;
        try {
            con = DBContext.getConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, p.getProductName());
            statement.setString(2, p.getDescription());
            statement.setDouble(3, p.getPrice());
            statement.setInt(4, p.getStockQuantity());
            statement.setInt(5, p.getCategoryID());
            statement.setString(6, p.getAvatar_name());
            statement.setBytes(7, p.getAvatar_img());
            statement.setInt(8, p.getProductID());
            statement.execute();
            DBContext.GetInstance().close(con, statement, null);
        } catch (Exception ex) {
            Logger.getLogger(ItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Item checkExist(int id) {
        String query = "select * from Products\n"
                + "where ProductID = ?\n";
        Item p = null;
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p = new Item(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getBytes(8));
            }
            DBContext.GetInstance().close(conn, ps, rs);
        } catch (Exception ex) {
            Logger.getLogger(ItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }
}
