package business.services;

import business.dao.DataAccessException;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

public class BmiEntry {

    public static double BMI_LOW = 18.5;
    public static final double BMI_NORMAL_LOWER = 18.5;
    public static final double BMI_NORMAL_UPPER = 25;
    public static final double BMI_OVERWEIGHT_LOWER = 25;
    public static final double BMI_OVERWEIGHT_UPPER = 30;

    int id;
    double height;
    double weight;
    String gender;
    Sport sport;
    User owner;
    Date created;
    List<Info> infos;

    public BmiEntry(int id, double height, double weight, String gender, Date created) {
        this.id = id;
        this.height = height;
        this.weight = weight;
        this.gender = gender;
        this.created =created ;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public double getWeight() {
        return weight;
    }

    public double getBmi() {
        return this.weight * 100*100 / (this.height * this.height);
    }

    public static String getCategory(double bmi) {
        String category = "";
        if(bmi < BMI_LOW) {
            category = "Below average";
        } else if(bmi >= BMI_NORMAL_LOWER && bmi < BMI_NORMAL_UPPER) {
            category = "Normal";
        }
        else if(bmi >= BMI_OVERWEIGHT_LOWER && bmi < BMI_OVERWEIGHT_UPPER) {
            category = "Overweight";
        }
        else{
            category = "Obesity";
        }
        return category;
    }

    public String getCategory() {
        double bmi = getBmi();
        return getCategory(bmi);
    }

    public Date getCreated() {
        String d = created.toString();
        return created;
    }

    /*
    This will lazy-fetch infos
     */
    public List<Info> getInfos() throws DataAccessException {
        if(this.infos == null){
            this.infos = BmiFacade.getInfosForBmiEntry(this.id);
        }
        return this.infos;
    }

    public String getInfosAsString() throws DataAccessException {
        List<Info> infos = getInfos();
        return infos.stream().map(info->info.getName()).collect(Collectors.joining("###"));
    }

    public String getDateAsStr() {
        return created.toString();
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Sport getSport() {
        return sport;
    }

    public void setSport(Sport sport) {
        this.sport = sport;
    }

    public User getOwner() {
        return owner;
    }

}
