package Dao;

import ConnectDB.DBContext;
import Model.OrderItem;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OrderItemDAO {

    public ArrayList<OrderItem> getAllOrderItems() {
        DBContext db = new DBContext();
        ArrayList<OrderItem> orders = new ArrayList<>();
        String sql = "SELECT * FROM OrderItem";
        try (Connection con = db.getConnection(); PreparedStatement statement = con.prepareStatement(sql); ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {

                OrderItem order = new OrderItem(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getDouble(6));
                orders.add(order);
            }
        } catch (SQLException | NumberFormatException ex) {
            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    public ArrayList<OrderItem> getAllOrderItem(int currentPage, int recordsPerPage) {
        DBContext db = new DBContext();
        ArrayList<OrderItem> list = new ArrayList<>();
        try {
            Connection con = db.getConnection();

            int start = currentPage * recordsPerPage - recordsPerPage;
            int end = recordsPerPage * currentPage;
            String sql = "select * from OrderItem ORDER BY OrderItemID  OFFSET ? Rows FETCH NEXT ? ROWS ONLY;\n";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, start);
            ps.setInt(2, end);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderItem order = new OrderItem(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getDouble(6));
                list.add(order);
            }
            new DBContext().close(con, ps, rs);
        } catch (SQLException | NumberFormatException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void addOrderItem(OrderItem order) {
        String sql = "INSERT INTO OrderItems (OrderID, ProductID, Quantity, AddInfor, Price) VALUES (?, ?, ?, ?, ?)";
        DBContext db = new DBContext();
        try (Connection con = db.getConnection(); PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setInt(1, order.getOrderID());
            statement.setInt(2, order.getProductID());
            statement.setInt(3, order.getQuantity());
            statement.setString(4, order.getAddInfo());
            statement.setDouble(5, order.getPrice());
            statement.execute();
        } catch (SQLException | NumberFormatException ex) {
            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateOrderItem(OrderItem order) {
        String sql = "UPDATE OrderItem SET OrderID = ?, ProductID = ?, Quantity = ?, AddInfor=?, Price = ? WHERE OrderItemID = ?";
        DBContext db = new DBContext();
        try (Connection con = db.getConnection(); PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setInt(1, order.getOrderID());
            statement.setInt(2, order.getProductID());
            statement.setInt(3, order.getQuantity());
            statement.setString(4, order.getAddInfo());
            statement.setDouble(5, order.getPrice());
            statement.setInt(6, order.getOrderItemID());
            statement.execute();
        } catch (SQLException | NumberFormatException ex) {
            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteOrderItem(int orderID) {
        String sql = "DELETE FROM OrderItem WHERE OrderItemID = ?";
        DBContext db = new DBContext();
        try (Connection con = db.getConnection(); PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setInt(1, orderID);
            statement.execute();
        } catch (SQLException | NumberFormatException ex) {
            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public OrderItem checkExist(int orderID) {
        String sql = "SELECT * FROM OrderItem WHERE OrderItemID = ?";
        DBContext db = new DBContext();
        OrderItem order = null;
        try (Connection con = db.getConnection(); PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setInt(1, orderID);
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    order = new OrderItem(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getDouble(6));
                }
            }
        } catch (SQLException | NumberFormatException ex) {
            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return order;
    }

    public int getNumberOfOrderItems() {
        DBContext db = new DBContext();
        Integer numOfRows = 0;
        try {
            Connection con = db.getConnection();
            String sql = "SELECT * FROM OrderItem";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                numOfRows++;
            }
        } catch (SQLException | NumberFormatException ex) {
            Logger.getLogger(OrderItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return numOfRows;
    }
}
