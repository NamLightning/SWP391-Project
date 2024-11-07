
package Dao;

import ConnectDB.DBContext;
import Model.UsedPromotion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UsedPromotionDAO {

    public ArrayList<UsedPromotion> getAllUsedPromotion() {
        DBContext db = new DBContext();
        ArrayList<UsedPromotion> oList = new ArrayList<>();
        String sql = "SELECT * FROM UsedPromotion";
        try {
            Connection con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int promotionID = rs.getInt(1);
                int customerID = rs.getInt(2);

                UsedPromotion p = new UsedPromotion(promotionID, customerID);
                oList.add(p);
            }
            db.close(con, statement, rs);
        } catch (Exception ex) {
            Logger.getLogger(UsedPromotionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return oList;
    }

    public static void getAllPromotion() {
        DBContext db = new DBContext();
        ArrayList<UsedPromotion> oList = new ArrayList<>();
        String sql = "Select * from UsedPromotion";
        try {
            Connection con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {

                UsedPromotion p = new UsedPromotion(rs.getInt(1), rs.getInt(2));
                oList.add(p);
            }
            db.close(con, statement, rs);
        } catch (Exception ex) {
            Logger.getLogger(UsedPromotionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addPromotion(UsedPromotion e) {
        String sql = "INSERT INTO UsedPromotion (PromotionID, CustomerID) VALUES (?, ?)";
        DBContext db = new DBContext();

        try (Connection con = db.getConnection(); PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setInt(1, e.getPromotionID());
            statement.setInt(2, e.getCustomerID());
            statement.execute();
        } catch (Exception ex) {
            Logger.getLogger(UsedPromotionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deletePromotion(int cusID, int proID) {
        String sql = "DELETE FROM UsedPromotion WHERE PromotionID=? AND CustomerID=?";

        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, cusID);
            ps.setInt(2, proID);

            ps.execute();
            ps.close();
            conn.close();

        } catch (Exception e) {
            Logger.getLogger(UsedPromotion.class.getName()).log(Level.SEVERE, null, e);
        }
    }

//    public UsedPromotion checkExist(int id) {
//        String query = "SELECT * FROM UsedPromotion WHERE PromotionID = ?";
//        UsedPromotion e = null;
//        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
//            ps.setInt(1, id);
//            ResultSet rs = ps.executeQuery();
//            if (rs.next()) {
//                e = new UsedPromotion(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getTimestamp(4).toLocalDateTime(), rs.getTimestamp(5).toLocalDateTime(), rs.getString(6));
//            }
//        } catch (Exception ex) {
//            Logger.getLogger(UsedPromotionDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return e;
//    }
}
