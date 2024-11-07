
package Dao;

import ConnectDB.DBContext;
import Model.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OrderDAO {

    public ArrayList<Order> getAllOrders() {
        DBContext db = new DBContext();
        ArrayList<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM Orders";
        try (Connection con = db.getConnection(); PreparedStatement statement = con.prepareStatement(sql); ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {

                Order order = new Order(rs.getInt(1), rs.getInt(2), rs.getDouble(3), rs.getDate(4), rs.getString(5), rs.getString(6));
                orders.add(order);
            }
        } catch (SQLException | NumberFormatException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    
    public ArrayList<Order> getAllOrder(int currentPage, int recordsPerPage) {
        DBContext db = new DBContext();
        ArrayList<Order> list = new ArrayList<>();
        try {
            Connection con = db.getConnection();

            int start = currentPage * recordsPerPage - recordsPerPage;
            int end = recordsPerPage * currentPage;
            String sql = "select * from Orders ORDER BY OrderID  OFFSET ? Rows FETCH NEXT ? ROWS ONLY;\n";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, start);
            ps.setInt(2, end);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order(rs.getInt(1), rs.getInt(2), rs.getDouble(3), rs.getDate(4), rs.getString(5), rs.getString(6));
                list.add(order);
            }
            new DBContext().close(con, ps, rs);
        } catch (SQLException | NumberFormatException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    
    public void addOrder(Order order) {
        String sql = "INSERT INTO Orders (CustomerID, TotalAmount, OrderDate, AddInfor, OrderStatus) VALUES (?, ?, ?, ?, ?)";
        DBContext db = new DBContext();
        try (Connection con = db.getConnection(); PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setInt(1, order.getCustomerID());
            statement.setDouble(2, order.getTotalAmount());
            statement.setTimestamp(3, new Timestamp(order.getOrderDate().getTime()));
            statement.setString(4, order.getAddInfo());
            statement.setString(5, order.getOrderStatus());
            statement.execute();
        } catch (SQLException | NumberFormatException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateOrder(Order order) {
        String sql = "UPDATE Orders SET CustomerID = ?, TotalAmount = ?, OrderDate = ?, AddInfor=?,OrderStatus = ? WHERE OrderID = ?";
        DBContext db = new DBContext();
        try (Connection con = db.getConnection(); PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setInt(1, order.getCustomerID());
            statement.setDouble(2, order.getTotalAmount());
            statement.setTimestamp(3, new Timestamp(order.getOrderDate().getTime()));
            statement.setString(4, order.getAddInfo());
            statement.setString(5, order.getOrderStatus());
            statement.setInt(6, order.getOrderID());
            statement.execute();
        } catch (SQLException | NumberFormatException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteOrder(int orderID) {
        String sql = "DELETE FROM Orders WHERE OrderID = ?";
        DBContext db = new DBContext();
        try (Connection con = db.getConnection(); PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setInt(1, orderID);
            statement.execute();
        } catch (SQLException | NumberFormatException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Order checkExist(int orderID) {
        String sql = "SELECT * FROM Orders WHERE OrderID = ?";
        DBContext db = new DBContext();
        Order order = null;
        try (Connection con = db.getConnection(); PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setInt(1, orderID);
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {

                    order = new Order(rs.getInt(1), rs.getInt(2), rs.getDouble(3), rs.getDate(4), rs.getString(5), rs.getString(6));
                }
            }
        } catch (SQLException | NumberFormatException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return order;
    }

    public int getNumberOfOrders() {
        DBContext db = new DBContext();
        Integer numOfRows = 0;
        try {
            Connection con = db.getConnection();
            String sql = "SELECT * FROM Orders";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                numOfRows++;
            }
        } catch (SQLException | NumberFormatException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return numOfRows;
    }

    public static void main(String[] args) {
        OrderDAO orderDAO = new OrderDAO();
        // In ra tất cả các đơn hàng
        orderDAO.getAllOrders().forEach(System.out::println);
    }
}
