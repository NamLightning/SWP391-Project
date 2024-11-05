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
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
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
        ArrayList<Employee> oList = new ArrayList<>();
        String sql = "Select * from Employees";
        Connection con = null;
        try {
            con = DBContext.getConnection();
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
        } catch (Exception ex) {
            Logger.getLogger(PetsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return oList;
    }

    public static String getImage(int employeeID) {
        String sql = "SELECT Avatar_Img FROM Employees WHERE id = ?";
        Connection con = null;
        try {
            con = DBContext.getConnection();
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
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
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
    
    public Employee checkLogin(String username, String password) {
        Connection con = null;
        Employee e = null;
        try {
            String query = "select * from Employees where Username = ? and [Password] = ?";
            con = DBContext.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                e = new Employee(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getBytes(9));
            }
            DBContext.GetInstance().close(con, ps, rs);
        } catch (Exception ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return e;
    }

    public Employee findEmployeeByPhoneNumb(String phoneNumb) {
        String query = "select * from Employees\n"
                + "where PhoneNumb = ?\n";
        Employee e = null;
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
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
        Connection con = null;
        try {
            PreparedStatement statement;
            con = DBContext.getConnection();
            String sql = "DELETE FROM Employees WHERE EmployeeID=?";
            statement = con.prepareStatement(sql);
            statement.setInt(1, id);
            statement.execute();
            statement.close();
        } catch (SQLException | NumberFormatException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateEmployee(Employee e) {
        String sql = " UPDATE Employees\n" + "SET Username = ?, [Password] = ?, FirstName = ?, LastName = ?, Email = ?, PhoneNumb = ?, AvatarName = ?, Avatar_Img = ?\n" + "WHERE EmployeeID = ?";
        Connection con = null;
        try {
            con = DBContext.getConnection();
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
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
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
    
    public ArrayList<Employee> getAllEmployee(int currentPage, int recordsPerPage) {
        DBContext db = new DBContext();
        ArrayList<Employee> list = new ArrayList<>();
        try {
            Connection con = db.getConnection();
            
            int start = currentPage * recordsPerPage - recordsPerPage;
            int end = recordsPerPage * currentPage;
            String sql = "With prod AS\n"
                    + "( SELECT *,\n"
                    + "ROW_NUMBER() OVER (order by EmployeeID) as RowNumber \n"
                    + "FROM Employees )\n"
                    + "select *\n"
                    + "from prod\n"
                    + "Where RowNumber Between ? and ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, start);
            ps.setInt(2, end);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Employee p = new Employee(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),rs.getString(8), rs.getBytes(9));
                list.add(p);
            }
            new DBContext().close(con, ps, rs);
        } catch (Exception ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
     public Integer getNumberOfRows() {
        DBContext db = new DBContext();
        Integer numOfRows = 0;
        try {
            Connection con = db.getConnection();
            String sql = "SELECT * FROM Employees";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                numOfRows++;
            }
        } catch (Exception ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return numOfRows;
    }
}
