package Dao;

import ConnectDB.DBContext;
import Model.Promotions;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PromotionsDAO {

    public static ArrayList<Promotions> getAllPromotions() {
        DBContext db = new DBContext();
        ArrayList<Promotions> oList = new ArrayList<>();
        String sql = "SELECT * FROM Promotions";
        try {
            Connection con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int promotionID = rs.getInt(1);
                String promotionName = rs.getString(2);
                int discountPercent = rs.getInt(3);
                LocalDateTime startDate = rs.getTimestamp(4).toLocalDateTime();
                LocalDateTime endDate = rs.getTimestamp(5).toLocalDateTime();
                String descriptions = rs.getString(6);

                Promotions p = new Promotions(promotionID, promotionName, discountPercent, startDate, endDate, descriptions);
                oList.add(p);
            }
            db.close(con, statement, rs);
        } catch (Exception ex) {
            Logger.getLogger(PromotionsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return oList;
    }

    public static void getAllPromotion() {
        DBContext db = new DBContext();
        ArrayList<Promotions> oList = new ArrayList<>();
        String sql = "Select * from Promotions";
        try {
            Connection con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                int promotionID = rs.getInt(1);
                String promotionName = rs.getString(2);
                int discountPercent = rs.getInt(3);
                LocalDateTime startDate = rs.getTimestamp(4).toLocalDateTime();
                LocalDateTime endDate = rs.getTimestamp(5).toLocalDateTime();
                String Descriptions = rs.getString(6);
                Promotions p = new Promotions(promotionID, promotionName, discountPercent, startDate, endDate, Descriptions);
                oList.add(p);
            }
            db.close(con, statement, rs);
        } catch (Exception ex) {
            Logger.getLogger(PromotionsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addPromotion(Promotions e) {
        String sql = "INSERT INTO Promotions (PromotionID, PromotionName, DiscountPercent, StartDate, EndDate, Descriptions) VALUES (?, ?, ?, ?, ?, ?)";
        DBContext db = new DBContext();

        try (Connection con = db.getConnection();
             PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setInt(1, e.getPromotionID());
            statement.setString(2, e.getPromotionName());
            statement.setInt(3, e.getDiscountPercent());
            statement.setTimestamp(4, Timestamp.valueOf(e.getStartDate()));
            statement.setTimestamp(5, Timestamp.valueOf(e.getEndDate()));
            statement.setString(6, e.getDescriptions());
            statement.execute();
        } catch (Exception ex) {
            Logger.getLogger(PromotionsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

     public void updatePromotion(Promotions e) {
        String sql = "UPDATE Promotions SET PromotionName = ?, DiscountPercent = ?, StartDate = ?, EndDate = ?, Descriptions = ? WHERE PromotionID = ?";
        DBContext db = new DBContext();

        try (Connection con = db.getConnection();
             PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setString(1, e.getPromotionName());
            statement.setInt(2, e.getDiscountPercent());
            statement.setTimestamp(3, Timestamp.valueOf(e.getStartDate()));
            statement.setTimestamp(4, Timestamp.valueOf(e.getEndDate()));
            statement.setString(5, e.getDescriptions());
            statement.setInt(6, e.getPromotionID());
            statement.execute();
        } catch (Exception ex) {
            Logger.getLogger(PromotionsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deletePromotion(int id) {
        String sql = "DELETE FROM Promotions WHERE PromotionID=?";

        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();

            ps.close();
            conn.close();

        } catch (Exception e) {
            Logger.getLogger(Promotions.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public ArrayList<Promotions> getAllPromotion(int currentPage, int recordsPerPage) {
        DBContext db = new DBContext();
        ArrayList<Promotions> list = new ArrayList<>();
        try {
            Connection con = db.getConnection();

            int start = currentPage * recordsPerPage - recordsPerPage;
            int end = recordsPerPage * currentPage;
            String sql = "With prod AS\n"
                    + "( SELECT *,\n"
                    + "ROW_NUMBER() OVER (order by PromotionID) as RowNumber \n"
                    + "FROM Promotions )\n"
                    + "select *\n"
                    + "from prod\n"
                    + "Where RowNumber Between ? and ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, start);
            ps.setInt(2, end);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Promotions p = new Promotions(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getTimestamp(4).toLocalDateTime(), rs.getTimestamp(5).toLocalDateTime(), rs.getString(6));
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
            String sql = "SELECT * FROM Promotions";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                numOfRows++;
            }
        } catch (Exception ex) {
            Logger.getLogger(PromotionsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return numOfRows;
    }

   public Promotions checkExist(int id) {
        String query = "SELECT * FROM Promotions WHERE PromotionID = ?";
        Promotions e = null;
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                e = new Promotions(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getTimestamp(4).toLocalDateTime(), rs.getTimestamp(5).toLocalDateTime(), rs.getString(6));
            }
        } catch (Exception ex) {
            Logger.getLogger(PromotionsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return e;
    }
}
