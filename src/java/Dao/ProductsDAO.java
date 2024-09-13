/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import ConnectDB.DBContext;
import Model.Products;
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
public class ProductsDAO {
    public void registerProduct(Products p) {
        String query = "insert into Products(ProductName, [Description], Price, StockQuantity, CategoryID, AvatarName, Avatar_Img)\n"
                + "values(?, ?, ?, ?, ?, ?, ?)";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, p.getProductName());
            ps.setString(2, p.getDescription());
            ps.setDouble(3, p.getPrice());
            ps.setInt(4, p.getStockQuantity());
            ps.setInt(5, p.getCategoryID());
            ps.setString(6, p.getAvatar_name());
            ps.setBytes(7, p.getAvatar_img());
            ps.execute();
            new DBContext().close(conn, ps, null);
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList<Products> getAllProducts() {
        String query = "select * from Products\n";
        ArrayList<Products> list = new ArrayList<>();
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Products p = new Products(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getBytes(8));
                list.add(p);
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception e) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }
    
    public ArrayList<Products> getAllProducts(int currentPage, int recordsPerPage) {
        DBContext db = new DBContext();
        ArrayList<Products> list = new ArrayList<>();
        try {
            Connection con = db.getConnection();
            
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
                Products p = new Products(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getBytes(8));
                list.add(p);
            }
            new DBContext().close(con, ps, rs);
        } catch (Exception ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public Integer getNumberOfRows() {
        DBContext db = new DBContext();
        Integer numOfRows = 0;
        try {
            Connection con = db.getConnection();
            String sql = "SELECT * FROM Products";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                numOfRows++;
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return numOfRows;
    }

    public Products findProductByProductName(String productName) {
        String query = "select * from Products\n"
                + "where ProductName = ?\n";
        Products p = null;
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, productName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p = new Products(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getBytes(8));
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }
    
    public Products findProductByCategory(int category) {
        String query = "select * from Products\n"
                + "where CategoryID = ?\n";
        Products p = null;
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, category);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p = new Products(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getBytes(8));
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }

    public void deleteProduct(int id) {
        try {
            DBContext db = new DBContext();
            PreparedStatement statement;
            try (Connection con = db.getConnection()) {
                String sql = "DELETE FROM Products WHERE ProductID=?";
                statement = con.prepareStatement(sql);
                statement.setInt(1, id);
                statement.execute();
            }
            statement.close();
        } catch (SQLException | NumberFormatException ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateProduct(Products p) {
        String sql = " UPDATE Products\n" + "SET ProductName = ?, [Description] = ?, Price = ?, StockQuantity = ?, CategoryID = ?, AvatarName = ?, Avatar_Img = ?\n" + "WHERE ProductID = ?";
        DBContext db = new DBContext();
        try {
            Connection con = db.getConnection();
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
            new DBContext().close(con, statement, null);
        } catch (Exception ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Products checkExist(int id) {
        String query = "select * from Products\n"
                + "where ProductID = ?\n";
        Products p = null;
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p = new Products(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getBytes(8));
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception ex) {
            Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }
}
