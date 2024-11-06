package Dao;

import ConnectDB.DBContext;
import Model.ServiceBooking;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ServiceBookingDAO {

    public void registerServiceBooking(ServiceBooking c) {
        String query = "insert into [Services](ServiceID, CustomerID, ServiceDate, Status)\n"
                + "values(?, ?, ?, ?)";
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, c.getServiceID());
            ps.setInt(2, c.getCustomerID());
            ps.setTimestamp(3, Timestamp.valueOf(c.ServiceDate()));
            ps.setString(4, c.getStatus());
            ps.execute();
            new DBContext().close(conn, ps, null);
        } catch (Exception e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void deleteServiceBooking(int serID, int cusID) {
        Connection con = null;
        try {
            PreparedStatement statement;
            con = DBContext.getConnection();
            String sql = "DELETE FROM [Services] WHERE ServiceID=? AND CustomerID=? ";
            statement = con.prepareStatement(sql);
            statement.setInt(1, serID);
            statement.setInt(1, cusID);

            statement.execute();
            statement.close();
        } catch (SQLException | NumberFormatException ex) {
            Logger.getLogger(ServiceBookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ServiceBooking checkExist(int serID, int cusID) {
        String query = "select * from [Services]\n"
                + "where ServiceID = ? AND CustomerID = ?\n";
        ServiceBooking c = null;
        Connection conn = null;
        try {
            conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, serID);
            ps.setInt(2, cusID);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                LocalDateTime serviceDate = rs.getTimestamp(3).toLocalDateTime();

                c = new ServiceBooking(rs.getInt(1), rs.getInt(2), serviceDate, rs.getString(4));
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception e) {
            Logger.getLogger(ServiceBookingDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return c;
    }

    public ArrayList<ServiceBooking> getAllServiceBookings() {
        String query = "select * from ServiceDetail\n";
        ArrayList<ServiceBooking> list = new ArrayList<>();
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                LocalDateTime serviceDate = rs.getTimestamp(3).toLocalDateTime();

                ServiceBooking p = new ServiceBooking(rs.getInt(1), rs.getInt(2), serviceDate, rs.getString(4));
                list.add(p);
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception e) {
            Logger.getLogger(ServiceBookingDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

}
