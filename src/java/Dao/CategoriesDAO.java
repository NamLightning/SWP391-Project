
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import ConnectDB.DBContext;
import Model.Categories;
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
public class CategoriesDAO {
    public void registerCategories(Categories c) {
        String query = "insert into Categories(CategoryName)\n"
                + "values(?)";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, c.getCategoryName());
            ps.execute();
            new DBContext().close(conn, ps, null);
        } catch (Exception e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public Categories findCategoriesByCategoryName(String categoryName) {
        String query = "select * from Categories\n"
                + "where CategoryName = ?\n";
        Categories c = null;
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, categoryName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                c = new Categories(rs.getInt(1), rs.getString(2));
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception e) {
            Logger.getLogger(CategoriesDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return c;
    }
    
    public ArrayList<Categories> getAllCategories() {
        String query = "select * from Categories\n";
        ArrayList<Categories> list = new ArrayList<>();
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Categories c = new Categories(rs.getInt(1), rs.getString(2));
                list.add(c);
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception e) {
            Logger.getLogger(CategoriesDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public void deleteCategories(int id) {
        try {
            DBContext db = new DBContext();
            PreparedStatement statement;
            try (Connection con = db.getConnection()) {
                String sql = "DELETE FROM Categories WHERE CategoryID=?";
                statement = con.prepareStatement(sql);
                statement.setInt(1, id);
                statement.execute();
            }
            statement.close();
        } catch (SQLException | NumberFormatException ex) {
            Logger.getLogger(CategoriesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateCategories(Categories c) {
        String sql = " UPDATE Categories\n" + "SET CategoryName = ?\n" + "WHERE CategoryID = ?";
        DBContext db = new DBContext();
        try {
            Connection con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, c.getCategoryName());
            statement.setInt(2, c.getCategoryID());
            statement.execute();
            new DBContext().close(con, statement, null);
        } catch (Exception ex) {
            Logger.getLogger(CategoriesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Categories checkExist(int id) {
        String query = "select * from Categories\n"
                + "where CategoryID = ?\n";
        Categories c = null;
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                c = new Categories(rs.getInt(1), rs.getString(2));
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception e) {
            Logger.getLogger(CategoriesDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return c;
    }
}
