package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import ConnectDB.DBContext;
import java.util.ArrayList;
import Model.Services;

public class ServicesDAO {

    public void registerServices(Services c) {
        String query = "insert into ServiceDetail(ServiceName, Price, ServiceDescription, AvatarName, Avatar_Img)\n"
                + "values(?, ?, ?, ?, ?)";
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, c.getServiceName());
            ps.setDouble(2, c.getPrice());
            ps.setString(3, c.getServiceDesc());
            ps.setString(4, c.getAvatar_name());
            ps.setBytes(5, c.getAvatar_img());
            ps.execute();
            new DBContext().close(conn, ps, null);
        } catch (Exception e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public Services findServicesByServicename(String username) {
        String query = "select * from ServiceDetail\n"
                + "where ServiceName = ?\n";
        Services c = null;
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Services(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5), rs.getBytes(6));
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception e) {
            Logger.getLogger(ServicesDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return c;
    }


    public void deleteServices(int id) {
        Connection con = null;
        try {
            PreparedStatement statement;
            con = DBContext.getConnection();
            String sql = "DELETE FROM ServiceDetail WHERE ServiceID=?";
            statement = con.prepareStatement(sql);
            statement.setInt(1, id);
            statement.execute();
            statement.close();
        } catch (SQLException | NumberFormatException ex) {
            Logger.getLogger(ServicesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateServices(Services c) {
        String sql = "UPDATE ServiceDetail SET "
                + "ServiceName = COALESCE(?, ServiceName), "
                + "Price = COALESCE(?, Price), "
                + "ServiceDescription = COALESCE(?, ServiceDescription), "
                + "AvatarName = COALESCE(?, AvatarName), "
                + "Avatar_Img = COALESCE(?, Avatar_Img) "
                + "WHERE ServiceID = ?";
        Connection con = null;
        try {
            con = DBContext.getConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, c.getServiceName());
            statement.setDouble(2, c.getPrice());
            statement.setString(3, c.getServiceDesc());
            statement.setString(4, c.getAvatar_name());
            statement.setBytes(5, c.getAvatar_img());
            statement.setInt(6, c.getServiceID());
            statement.execute();
            new DBContext().close(con, statement, null);
        } catch (Exception ex) {
            Logger.getLogger(ServicesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Services checkExist(int id) {
        String query = "select * from ServiceDetail\n"
                + "where ServiceID = ?\n";
        Services c = null;
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Services(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5), rs.getBytes(6));
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception e) {
            Logger.getLogger(ServicesDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return c;
    }

    public ArrayList<Services> getAllServicess() {
        String query = "select * from ServiceDetail\n";
        ArrayList<Services> list = new ArrayList<>();
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Services p = new Services(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5), rs.getBytes(6));
                list.add(p);
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception e) {
            Logger.getLogger(ServicesDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public ArrayList<Services> getAllServices(int currentPage, int recordsPerPage) {
        DBContext db = new DBContext();
        ArrayList<Services> list = new ArrayList<>();
        try {
            Connection con = db.getConnection();

            String sql = "select * from ServiceDetail ORDER BY ServiceID OFFSET ? Rows FETCH NEXT ? ROWS ONLY;\n";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, currentPage);
            ps.setInt(2, recordsPerPage);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Services p = new Services(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5), rs.getBytes(6));
                list.add(p);
            }
            new DBContext().close(con, ps, rs);
        } catch (Exception ex) {
            Logger.getLogger(ServicesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Integer getNumberOfRows() {
        DBContext db = new DBContext();
        Integer numOfRows = 0;
        try {
            Connection con = db.getConnection();
            String sql = "SELECT * FROM ServiceDetail";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                numOfRows++;
            }
        } catch (Exception ex) {
            Logger.getLogger(ServicesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return numOfRows;
    }
    
    public static void main(String[] args) {
        ServicesDAO ser = new ServicesDAO();
        ser.getAllServicess().forEach(System.out::print);
    }
}