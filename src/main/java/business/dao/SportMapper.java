package business.dao;

import business.services.Sport;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SportMapper {
    public static List<Sport> getAllSports() throws DataAccessException {
        List<Sport> sportList = new ArrayList<>();
        try {
            Connection con = Connector.connection();
            String SQL = "SELECT * FROM Sport";
            PreparedStatement ps = con.prepareStatement(SQL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                sportList.add(new Sport(id, name));
            }
            return sportList;
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
            throw new DataAccessException(ex.getMessage());
        }
    }

    public static Sport addSport(String name) throws DataAccessException {
        try {
            Connection con = Connector.connection();
            String SQL = "INSERT INTO sport(name) VALUES (?)";
            PreparedStatement ps = con.prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, name);
            int count = ps.executeUpdate();
            ResultSet keys = ps.getGeneratedKeys();
            keys.next();
            int id = keys.getInt(1);
            return new Sport(id,name);
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
            throw new DataAccessException(ex.getMessage());
        }
    }

    public static void editSport(int id, String name) throws DataAccessException {
        try {
            Connection con = Connector.connection();
            String SQL = "UPDATE sport SET name = ? WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(SQL);
            ps.setString(1, name);
            ps.setInt(2,id);
            int count = ps.executeUpdate();

        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
            throw new DataAccessException(ex.getMessage());
        }
    }

    public static void deleteSport(int id) throws DataAccessException {
        try{
            Connection con = Connector.connection();
            String SQL = "DELETE FROM sport WHERE id = ?";
            PreparedStatement  ps = con.prepareStatement(SQL);
            ps.setInt(1,id);
            int count = ps.executeUpdate();
        }catch (ClassNotFoundException | SQLException ex){
            ex.printStackTrace();
            throw new DataAccessException(ex.getMessage());
        }
    }
}
