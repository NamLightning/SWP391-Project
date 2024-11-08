///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
package Dao;

import ConnectDB.DBContext;
import Model.OrderItem;
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
public class OrderItemDAO {
//    public void registerOrder(OrderItem o) {
//        String query = "INSERT INTO OrderItem\n" +
//"           (ProductID\n" +
//"           ,Quantity\n" +
//"           ,AddInfor\n" +
//"           ,Price)\n"
//                + " values(?, ?, ?, ?)";
//        Connection conn = null;
//        try {
//            conn = DBContext.getConnection();
//            PreparedStatement ps = conn.prepareStatement(query);
//            ps.setInt(1, o.getProductID());
//            ps.setInt(2, o.getQuantity());
//            ps.setString(3, o.getAddInfo());
//            ps.setDouble(4, o.getPrice());
//            ps.execute();
//            DBContext.GetInstance().close(conn, ps, null);
//        } catch (Exception ex) {
//            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//
//    public ArrayList<OrderItem> getAllProducts() {
//        String query = "select * from Products\n";
//        ArrayList<OrderItem> list = new ArrayList<>();
//        Connection conn = null;
//        try {
//            conn = DBContext.getConnection();
//            PreparedStatement ps = conn.prepareStatement(query);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                OrderItem p = new OrderItem(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getDouble(5));
//                list.add(p);
//            }
//            DBContext.GetInstance().close(conn, ps, rs);
//        } catch (Exception e) {
//            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, e);
//        }
//        return list;
//    }
//    
//    public ArrayList<OrderItem> getAllProductsWithCategory(int CategoryID) {
//        String query = "select * from Products Where CategoryID = ?\n";
//        ArrayList<OrderItem> list = new ArrayList<>();
//        Connection conn = null;
//        try {
//            conn = DBContext.getConnection();
//            PreparedStatement ps = conn.prepareStatement(query);
//            ps.setInt(1, CategoryID);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                OrderItem p = new OrderItem(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getBytes(8));
//                list.add(p);
//            }
//            DBContext.GetInstance().close(conn, ps, rs);
//        } catch (Exception e) {
//            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, e);
//        }
//        return list;
//    }
//    
//    public ArrayList<OrderItem> getAllProductsWithCategory(int CategoryID, int offset, int recordsPerPage) {
//        String query = "select * from Products Where CategoryID = ? ORDER BY ProductID OFFSET ? Rows FETCH NEXT ? ROWS ONLY;\n";
//        ArrayList<OrderItem> list = new ArrayList<>();
//        Connection conn = null;
//        try {
//            conn = DBContext.getConnection();
//            PreparedStatement ps = conn.prepareStatement(query);
//            ps.setInt(1, CategoryID);
//            ps.setInt(2, offset);
//            ps.setInt(3, recordsPerPage);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                OrderItem p = new OrderItem(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getBytes(8));
//                list.add(p);
//            }
//            DBContext.GetInstance().close(conn, ps, rs);
//        } catch (Exception e) {
//            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, e);
//        }
//        return list;
//    }
//    
//    public ArrayList<OrderItem> getAllProducts(int offset, int recordsPerPage) {
//        ArrayList<OrderItem> list = new ArrayList<>();
//        Connection con = null;
//        try {
//            con = DBContext.getConnection();
//            String sql = "SELECT * FROM Products ORDER BY ProductID OFFSET ? Rows FETCH NEXT ? ROWS ONLY;";
//            PreparedStatement ps = con.prepareStatement(sql);
//            ps.setInt(1, offset);
//            ps.setInt(2, recordsPerPage);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                OrderItem p = new OrderItem(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getBytes(8));
//                list.add(p);
//            }
//            new DBContext().close(con, ps, rs);
//        } catch (Exception ex) {
//            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return list;
//    }
//
//    public Integer getNumberOfRows() {
//        Integer numOfRows = 0;
//        Connection con = null;
//        try {
//            con = DBContext.getConnection();
//            String sql = "SELECT * FROM Products";
//            PreparedStatement ps = con.prepareStatement(sql);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                numOfRows++;
//            }
//            DBContext.GetInstance().close(con, ps, rs);
//        } catch (Exception ex) {
//            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return numOfRows;
//    }
//    
//    public Integer getNumberOfRowsOfCategory(int categoryID) {
//        Integer numOfRows = 0;
//        Connection con = null;
//        try {
//            con = DBContext.getConnection();
//            String sql = "SELECT * FROM Products Where CategoryID = ?";
//            PreparedStatement ps = con.prepareStatement(sql);
//            ps.setInt(1, categoryID);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                numOfRows++;
//            }
//            DBContext.GetInstance().close(con, ps, rs);
//        } catch (Exception ex) {
//            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return numOfRows;
//    }
//
//    public OrderItem findProductByProductName(String productName) {
//        String query = "select * from Products\n"
//                + "where ProductName = ?\n";
//        OrderItem p = null;
//        Connection conn = null;
//        try {
//            conn = DBContext.getConnection();
//            PreparedStatement ps = conn.prepareStatement(query);
//            ps.setString(1, productName);
//            ResultSet rs = ps.executeQuery();
//            if (rs.next()) {
//                p = new OrderItem(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getBytes(8));
//            }
//            DBContext.GetInstance().close(conn, ps, rs);
//        } catch (Exception ex) {
//            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return p;
//    }
//
//    public OrderItem findProductByCategory(int category) {
//        String query = "select * from Products\n"
//                + "where CategoryID = ?\n";
//        OrderItem p = null;
//        Connection conn = null;
//        try {
//            conn = DBContext.getConnection();
//            PreparedStatement ps = conn.prepareStatement(query);
//            ps.setInt(1, category);
//            ResultSet rs = ps.executeQuery();
//            if (rs.next()) {
//                p = new OrderItem(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getBytes(8));
//            }
//            DBContext.GetInstance().close(conn, ps, rs);
//        } catch (Exception ex) {
//            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return p;
//    }
//
//    public void deleteProduct(int id) {
//        Connection conn = null;
//        try {
//            PreparedStatement statement;
//            Connection con = DBContext.getConnection();
//            String sql = "DELETE FROM Products WHERE ProductID=?";
//            statement = con.prepareStatement(sql);
//            statement.setInt(1, id);
//            statement.execute();
//            DBContext.GetInstance().close(conn, statement, null);
//        } catch (Exception ex) {
//            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//
//    public void updateProduct(OrderItem p) {
//        String sql = " UPDATE Products\n" + "SET ProductName = ?, [Description] = ?, Price = ?, StockQuantity = ?, CategoryID = ?, AvatarName = ?, Avatar_Img = ?\n" + "WHERE ProductID = ?";
//        Connection con = null;
//        try {
//            con = DBContext.getConnection();
//            PreparedStatement statement = con.prepareStatement(sql);
//            statement.setString(1, p.getProductName());
//            statement.setString(2, p.getDescription());
//            statement.setDouble(3, p.getPrice());
//            statement.setInt(4, p.getStockQuantity());
//            statement.setInt(5, p.getCategoryID());
//            statement.setString(6, p.getAvatar_name());
//            statement.setBytes(7, p.getAvatar_img());
//            statement.setInt(8, p.getProductID());
//            statement.execute();
//            DBContext.GetInstance().close(con, statement, null);
//        } catch (Exception ex) {
//            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//
//    public OrderItem checkExist(int id) {
//        String query = "select * from Products\n"
//                + "where ProductID = ?\n";
//        OrderItem p = null;
//        Connection conn = null;
//        try {
//            conn = DBContext.getConnection();
//            PreparedStatement ps = conn.prepareStatement(query);
//            ps.setInt(1, id);
//            ResultSet rs = ps.executeQuery();
//            if (rs.next()) {
//                p = new OrderItem(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getBytes(8));
//            }
//            DBContext.GetInstance().close(conn, ps, rs);
//        } catch (Exception ex) {
//            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return p;
//    }
}
