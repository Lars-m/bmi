package business.dao;

//import FunctionLayer.Info;
//import FunctionLayer.LoginSampleException;
//import FunctionLayer.Sport;

import business.services.BmiEntry;
import business.services.Sport;

import java.sql.*;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

public class BmiMapper {

    public static void insertBmiItem(double height, double weight, String gender, int sport_id, int userId, String[] infoIds) throws DataAccessException {

        int newId = 0;
        try {
            Connection con = Connector.connection();
            String SQL = "INSERT INTO bmi_entry(height, weight, gender, sport_id,user_id) VALUES (?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS);
            ps.setDouble(1, height);
            ps.setDouble(2, weight);
            ps.setString(3, gender);
            ps.setInt(4, sport_id);
            ps.setInt(5, userId);
            int result = ps.executeUpdate();

            if (infoIds != null && infoIds.length > 0) {
                ResultSet idResultSet = ps.getGeneratedKeys();
                if (idResultSet.next()) {
                    newId = idResultSet.getInt(1);
                    SQL = "INSERT INTO link_bmi_info(bmi_id, info_id) VALUES (?,?)";
                    ps = con.prepareStatement(SQL);
                    for (String id : infoIds) {
                        ps.setInt(1, newId);
                        ps.setInt(2, Integer.parseInt(id));
                        ps.executeUpdate();
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
            throw new DataAccessException(ex.getMessage());
        }
    }

    public static List<BmiEntry> getBmiEntriesForUser(int userId) throws DataAccessException {
        List<BmiEntry> bmiEntries = new ArrayList<>();
        try {
            Connection con = Connector.connection();
            //String SQL = "SELECT * FROM Bmi_entry WHERE user_id=?";
            String SQL = "SELECT b.*, s.id as id_sport, s.name as sport_name  FROM bmi.Bmi_entry b INNER JOIN sport s ON b.sport_id = s.id WHERE user_id=?";
            PreparedStatement ps = con.prepareStatement(SQL);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int weight = rs.getInt("weight");
                int height = rs.getInt("height");
                String gender = rs.getString("gender");
                java.util.Date created = rs.getDate("created");
                int sportId = rs.getInt("id_sport");
                String sportName = rs.getString("sport_name");
                BmiEntry bmi = new BmiEntry(id, height, weight, gender, created);
                bmi.setSport(new Sport(sportId,sportName));
                bmiEntries.add(bmi);
            }
            return bmiEntries;
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
            throw new DataAccessException(ex.getMessage());
        }

    }

}
