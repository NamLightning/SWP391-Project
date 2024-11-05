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
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, c.getCategoryName());
            ps.execute();
            DBContext.GetInstance().close(conn, ps, null);
        } catch (Exception ex) {
            Logger.getLogger(CategoriesDAO.class.getName()).log(Level.SEVERE, null, ex);
            
        }
    }

    public Categories findCategoriesByCategoryName(String categoryName) {
        String query = "select * from Categories\n"
                + "where CategoryName = ?\n";
        Categories c = null;
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, categoryName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                c = new Categories(rs.getInt(1), rs.getString(2));
            }
            DBContext.GetInstance().close(conn, ps, rs);
        } catch (Exception ex) {
            Logger.getLogger(CategoriesDAO.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        return c;
    }

    public ArrayList<Categories> getAllCategories() {
        String query = "select * from Categories\n";
        ArrayList<Categories> list = new ArrayList<>();
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Categories c = new Categories(rs.getInt(1), rs.getString(2));
                list.add(c);
            }
            DBContext.GetInstance().close(conn, ps, rs);
        } catch (Exception ex) {
            Logger.getLogger(CategoriesDAO.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        return list;
    }

    public void deleteCategories(int id) {
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            PreparedStatement statement;
            String sql = "DELETE FROM Categories WHERE CategoryID=?";
            statement = conn.prepareStatement(sql);
            statement.setInt(1, id);
            statement.execute();
            DBContext.GetInstance().close(conn, null, null);
        } catch (Exception ex) {
            Logger.getLogger(CategoriesDAO.class.getName()).log(Level.SEVERE, null, ex);
            
        }
    }

    public void updateCategories(Categories c) {
        String sql = " UPDATE Categories\n" + "SET CategoryName = ?\n" + "WHERE CategoryID = ?";
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, c.getCategoryName());
            statement.setInt(2, c.getCategoryID());
            statement.execute();
            DBContext.GetInstance().close(conn, null, null);
        } catch (Exception ex) {
            Logger.getLogger(CategoriesDAO.class.getName()).log(Level.SEVERE, null, ex);
            
        }
    }

    public Categories checkExist(int id) {
        String query = "select * from Categories\n"
                + "where CategoryID = ?\n";
        Categories c = null;
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                c = new Categories(rs.getInt(1), rs.getString(2));
            }
            DBContext.GetInstance().close(conn, ps, rs);
        } catch (Exception ex) {
            Logger.getLogger(CategoriesDAO.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        return c;
    }
}
