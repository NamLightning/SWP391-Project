/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import ConnectDB.DBContext;
import Model.Employee;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrator
 */
public class EmployeeDAO {
    public void registerEmployee(Employee e) {
        String query = "insert into Employees(Username, [Password], FirstName, LastName, Email, PhoneNumb, AvatarName, Avatar_Img)\n"
                + "values(?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, e.getUsername());
            ps.setString(2, e.getPassword());
            ps.setString(3, e.getFirstName());
            ps.setString(4, e.getLastName());
            ps.setString(5, e.getEmail());
            ps.setString(6, e.getPhoneNumber());
            ps.setString(7, e.getAvatar_name());
            ps.setBytes(8, e.getAvatar_img());
            ps.execute();
            new DBContext().close(conn, ps, null);
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static ArrayList<Employee> getAllEmployee() {
        DBContext db = new DBContext();
        ArrayList<Employee> oList = new ArrayList<>();
        String sql = "Select * from Employees";
        try {
            Connection con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                int employeeID = rs.getInt(1);
                String username = rs.getString(2);
                String password = rs.getString(3);
                String firstName = rs.getString(4);
                String lastName = rs.getString(5);
                String email = rs.getString(6);
                String phoneNumber = rs.getString(7);
                String avatar_name = rs.getString(8);
                byte[] avatar_img = rs.getBytes(9);
                Employee p = new Employee(employeeID, username, password, firstName, lastName, email, phoneNumber, avatar_name, avatar_img);
                oList.add(p);
            }
            db.close(con, statement, rs);
        } catch (Exception ex) {
            Logger.getLogger(PetsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return oList;
    }

    public static String getImage(int employeeID) {
        String sql = "SELECT Avatar_Img FROM Employees WHERE id = ?";
        DBContext db = new DBContext();
        try {
            Connection con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, employeeID);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                // Get the image data from the result set
                byte[] imageBytes = resultSet.getBytes("Avatar_Img");
                if (imageBytes != null) {
                    return Base64.getEncoder().encodeToString(imageBytes);
                }
            }
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(PetsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Employee findEmployeeByUsername(String username) {
        String query = "select * from Employees\n"
                + "where Username = ?\n";
        Employee e = null;
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                e = new Employee(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getBytes(9));
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return e;
    }
    
    public Employee findEmployeeByPhoneNumb(String phoneNumb) {
        String query = "select * from Employees\n"
                + "where PhoneNumb = ?\n";
        Employee e = null;
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, phoneNumb);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                e = new Employee(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getBytes(9));
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return e;
    }

    public void deleteEmployee(int id) {
        try {
            DBContext db = new DBContext();
            PreparedStatement statement;
            try (Connection con = db.getConnection()) {
                String sql = "DELETE FROM Employees WHERE EmployeeID=?";
                statement = con.prepareStatement(sql);
                statement.setInt(1, id);
                statement.execute();
            }
            statement.close();
        } catch (SQLException | NumberFormatException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateEmployee(Employee e) {
        String sql = " UPDATE Employees\n" + "SET Username = ?, [Password] = ?, FirstName = ?, LastName = ?, Email = ?, PhoneNumb = ?, AvatarName = ?, Avatar_Img = ?\n" + "WHERE EmployeeID = ?";
        DBContext db = new DBContext();
        try {
            Connection con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, e.getUsername());
            statement.setString(2, e.getPassword());
            statement.setString(3, e.getFirstName());
            statement.setString(4, e.getLastName());
            statement.setString(5, e.getEmail());
            statement.setString(6, e.getPhoneNumber());
            statement.setString(7, e.getAvatar_name());
            statement.setBytes(8, e.getAvatar_img());
            statement.setInt(9, e.getEmployeeID());
            statement.execute();
            new DBContext().close(con, statement, null);
        } catch (Exception ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Employee checkExist(int id) {
        String query = "select * from Employees\n"
                + "where EmployeeID = ?\n";
        Employee e = null;
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                e = new Employee(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getBytes(9));
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return e;
    }
}
