package business.services;

import business.dao.DataAccessException;
import business.dao.*;
import business.exceptions.DAOException;


import java.util.List;

public class BmiFacade {

    public static User login(String email, String password ) throws DAOException, DataAccessException {
        return UserMapper.login( email, password );
    }

    public static User createUser( String email, String password ) throws DAOException {
        User user = new User(email, password);
        UserMapper.createUser( user );
        return user;
    }

    public static List<Sport> getAllSports() throws DataAccessException {
        return SportMapper.getAllSports();
    }

    public static List<Info> getAllInfos() throws DataAccessException {
        return InfoMapper.getAllInfos();
    }

    public static List<Info> getInfosForBmiEntry(int bmiId) throws DataAccessException {
        return InfoMapper.getInfosForBmiEntry(bmiId);
    }

    public static void insertBmiItem(double height, double weight,String gender, int sport_id,int userId, String[] infoIds) throws DataAccessException {
        BmiMapper.insertBmiItem(height, weight, gender, sport_id,userId,infoIds);
    }

    public static Sport addSport(String sport) throws DataAccessException {
        return SportMapper.addSport(sport);
    }
    public static void editSport(int id, String sport) throws DataAccessException {
        SportMapper.editSport(id,sport);
    }
    public static void deleteSport(int id) throws DataAccessException {
        SportMapper.deleteSport(id);
    }

    public static List<BmiEntry> getBmiEntries(int userId) throws DataAccessException {
        return BmiMapper.getBmiEntriesForUser(userId);
    }

}
