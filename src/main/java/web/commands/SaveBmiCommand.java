package web.commands;

import business.dao.DataAccessException;
import business.services.BmiFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SaveBmiCommand  extends PageCommand{
    public SaveBmiCommand(String pageToShow) {
        super(pageToShow);
    }

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse response) {
        try {
            double height = Double.parseDouble(req.getParameter("height"));
            double weight = Double.parseDouble(req.getParameter("weight"));
            String gender = req.getParameter("gender");
            int sport =  Integer.parseInt(req.getParameter("sport"));
            int userId = Integer.parseInt(req.getSession().getAttribute("userId").toString());
            String info_ids = req.getParameter("info_ids");
            //Empty string means no items selected
            String[] infoIds = info_ids.equals("")? null : req.getParameter("info_ids").split(",");
            BmiFacade.insertBmiItem(height,weight,gender,sport,userId,infoIds);

        }catch (DataAccessException e){
            req.setAttribute("problem", "Error while communicating with the database (developers should check logfiles)");
            return "errorpage";
        }
        return pageToShow;
    }
}
