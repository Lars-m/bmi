package business.dao;

import business.services.Info;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class InfoMapper {

    public static List<Info> getAllInfos() throws DataAccessException {
        List<Info> infoList = new ArrayList<>();
        try {
            Connection con = Connector.connection();
            String SQL = "SELECT * FROM info";
            PreparedStatement ps = con.prepareStatement(SQL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                infoList.add(new Info(id, name));
            }
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
            throw new DataAccessException(ex.getMessage());
        }
        return infoList;
    }

    public static List<Info> getInfosForBmiEntry(int bmi_id) throws DataAccessException {
        List<Info> infoList = new ArrayList<>();
        try {
            Connection con = Connector.connection();
            String SQL = "SELECT i.* FROM bmi.link_bmi_info link INNER JOIN info i ON link.info_id = i.id where link.bmi_id=?";
            PreparedStatement ps = con.prepareStatement(SQL);
            ps.setInt(1, bmi_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                infoList.add(new Info(id, name));
            }
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
            throw new DataAccessException(ex.getMessage());
        }
        return infoList;
    }
}