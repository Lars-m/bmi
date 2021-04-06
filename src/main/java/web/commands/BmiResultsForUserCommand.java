package web.commands;

import business.services.BmiEntry;
import business.services.BmiFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class BmiResultsForUserCommand extends ProtectedPageCommand{
    public BmiResultsForUserCommand(String pageToShow, String role) {
        super(pageToShow, role);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        try {
            int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
            List<BmiEntry> entries = BmiFacade.getBmiEntries(userId);
            request.setAttribute("bmiEntries",entries);
            return  pageToShow;
        } catch (Exception e){
            request.setAttribute("problem", "Error while communicating with the database (developers should check logfiles)");
            return "errorpage";
        }
    }
}
