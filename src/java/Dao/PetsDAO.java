package Dao;

import ConnectDB.DBContext;
import Model.Pets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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
                int customerID = rs.getInt(4);
                Pets p = new Pets(petID, petName, petType, customerID);
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
                int customerID = rs.getInt(4);
                Pets p = new Pets(petID, petName, petType, customerID);
                oList.add(p);
            }
            db.close(con, statement, rs);
        } catch (Exception ex) {
            Logger.getLogger(PetsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addPet(Pets p) {
        String sql = "INSERT INTO Pets (PetName"
                + "           ,PetType"
                + "           ,customerID) VALUES (?, ?, ?);";

        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, p.getPetName());
            ps.setString(2, p.getPetType());
            ps.setInt(3, p.getCustomerID());
            ps.execute();
            new DBContext().close(conn, ps, null);
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        PetsDAO p = new PetsDAO();
        p.addPet(new Pets("cho", "meo", 1));
    }

    public void updatePet(Pets e) {
        String sql = " UPDATE Pets\n" + "SET PetName = ?, PetType = ?, CustomerID = ?\n" + "WHERE PetID = ?";
        DBContext db = new DBContext();
        try {
            Connection con = db.getConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, e.getPetName());
            statement.setString(2, e.getPetType());
            statement.setInt(3, e.getCustomerID());
            statement.setInt(4, e.getPetID());
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

            String sql = "select * from Pets ORDER BY PetID OFFSET ? Rows FETCH NEXT ? ROWS ONLY;\n";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, start);
            ps.setInt(2, end);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Pets p = new Pets(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
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
                e = new Pets(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception ex) {
            Logger.getLogger(PetsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return e;
    }

    public Pets checkExistByCusID(int id) {
        String query = "select * from Pets\n"
                + "where customerID = ?\n";
        Pets e = null;
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                e = new Pets(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
            }
            new DBContext().close(conn, ps, rs);
        } catch (Exception ex) {
            Logger.getLogger(PetsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return e;
    }
}