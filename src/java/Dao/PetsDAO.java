package Dao;

import ConnectDB.DBContext;
import Model.Pets;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PetsDAO {

    public static ArrayList<Pets> getAllPets() {
        DBContext db = new DBContext();
        ArrayList<Pets> oList = new ArrayList<>();
        String sql = "Select * from Pets";
        try {
            Connection con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                int petID = rs.getInt(1);
                String petName = rs.getString(2);
                String petType = rs.getString(3);
                String healthStatus = rs.getString(4);
                Date lastCheckedDate = rs.getDate(5);
                int employeeID = rs.getInt(6);
                String avatar_name = rs.getString(7);
                byte[] avatar_img = rs.getBytes(8);
                Pets p = new Pets(petID, petName, petType, healthStatus, lastCheckedDate, employeeID, avatar_name, avatar_img);
                oList.add(p);
            }
            db.close(con, statement, rs);
        } catch (Exception ex) {
            Logger.getLogger(PetsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return oList;
    }

    public static void getAllPet() {
        DBContext db = new DBContext();
        ArrayList<Pets> oList = new ArrayList<>();
        String sql = "Select * from Pets";
        try {
            Connection con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                int petID = rs.getInt(1);
                String petName = rs.getString(2);
                String petType = rs.getString(3);
                String healthStatus = rs.getString(4);
                Date lastCheckedDate = rs.getDate(5);
                int employeeID = rs.getInt(6);
                String avatar_name = rs.getString(7);
                byte[] avatar_img = rs.getBytes(8);
                Pets p = new Pets(petID, petName, petType, healthStatus, lastCheckedDate, employeeID, avatar_name, avatar_img);
                oList.add(p);
            }
            db.close(con, statement, rs);
        } catch (Exception ex) {
            Logger.getLogger(PetsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateImage(Pets p) {
        String sql = " UPDATE Pets\n" + "SET AvatarName = ?, Avatar_Img=?\n" + "WHERE PetID = ?";
        DBContext db = new DBContext();
        try {
            Connection con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, p.getAvatar_name());
            statement.setBytes(2, p.getAvatar_img());
            statement.setInt(3, p.getPetID());
            statement.execute();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(PetsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static String getImage(int petID) {
        String sql = "SELECT Avatar_Img FROM Pets WHERE id = ?";
        DBContext db = new DBContext();
        try {
            Connection con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, petID);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                byte[] imageBytes = resultSet.getBytes("Avatar_Img");
                if (imageBytes != null) {
                    return Base64.getEncoder().encodeToString(imageBytes);
                }
            }
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(Pets.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void addPet(Pets p) {
        String sql = "INSERT INTO Pets (PetID"
                + "           ,PetName"
                + "           ,PetType"
                + "           ,HealthStatus"
                + "           ,LastCheckedDate"
                + "           ,EmployeeID"
                + "           ,AvatarName"
                + "           ,Avatar_Img) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
        DBContext db = new DBContext();

        Connection con;

        try {
            con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, p.getPetID());
            statement.setString(2, p.getPetName());
            statement.setString(3, p.getPetType());
            statement.setString(4, p.getHealthStatus());
            statement.setDate(5, Date.valueOf(p.getLastCheckedDate()));
            statement.setInt(6, p.getEmployeeID());
            statement.setString(7, p.getAvatar_name());
            statement.setBytes(8, p.getAvatar_img());
            statement.execute();
            db.close(con, statement, null);
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updatePet(Pets e) {
        String sql = " UPDATE Pets\n" + "SET PetName = ?, PetType = ?, HealthStatus = ?, LastCheckedDate = ?, EmployeeID = ?, AvatarName = ?, Avatar_Img = ?\n" + "WHERE PetID = ?";
        DBContext db = new DBContext();
        try {
            Connection con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, e.getPetName());
            statement.setString(2, e.getPetType());
            statement.setString(3, e.getHealthStatus());
            statement.setDate(4, Date.valueOf(e.getLastCheckedDate()));
            statement.setInt(5, e.getEmployeeID());
            statement.setString(6, e.getAvatar_name());
            statement.setBytes(7, e.getAvatar_img());
            statement.setInt(8, e.getEmployeeID());
            statement.execute();
            new DBContext().close(con, statement, null);
        } catch (Exception ex) {
            Logger.getLogger(PetsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deletePet(int id) {
        String sql = "DELETE FROM Pets WHERE PetID=?";

        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();

            ps.close();
            conn.close();

        } catch (Exception e) {
            Logger.getLogger(Pets.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public ArrayList<Pets> getAllPet(int currentPage, int recordsPerPage) {
        DBContext db = new DBContext();
        ArrayList<Pets> list = new ArrayList<>();
        try {
            Connection con = db.getConnection();

            int start = currentPage * recordsPerPage - recordsPerPage;
            int end = recordsPerPage * currentPage;
            String sql = "With prod AS\n"
                    + "( SELECT *,\n"
                    + "ROW_NUMBER() OVER (order by petID) as RowNumber \n"
                    + "FROM Pets )\n"
                    + "select *\n"
                    + "from prod\n"
                    + "Where RowNumber Between ? and ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, start);
            ps.setInt(2, end);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Pets p = new Pets(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6), rs.getInt(7), rs.getString(8), rs.getBytes(9));
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
            String sql = "SELECT * FROM Pets";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                numOfRows++;
            }
        } catch (Exception ex) {
            Logger.getLogger(PetsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return numOfRows;
    }
    
    
    public Pets checkExist(int id) {
        String query = "select * from Pets\n"
                + "where PetID = ?\n";
        Pets e = null;
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                e = new Pets(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6), rs.getInt(7), rs.getString(8), rs.getBytes(9));
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception ex) {
            Logger.getLogger(PetsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return e;
    }
}
