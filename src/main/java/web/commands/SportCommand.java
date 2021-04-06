package web.commands;

import business.dao.DataAccessException;
import business.services.BmiFacade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SportCommand extends ProtectedPageCommand {
    public SportCommand(String pageToShow, String role) {
        super(pageToShow, role);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String redirect = Command.REDIRECT; //Necessary to clear the Query string after a ADD/EDIT/DELETE
        try {
            String sportName = request.getParameter("sport");
            String id = request.getParameter("id");
            String delete = request.getParameter("delete");
            if (delete != null) {
                BmiFacade.deleteSport(Integer.parseInt(id));
            } else if (sportName != null & id == null) {
                BmiFacade.addSport(sportName);

            } else if (sportName != null & id != null) {
                BmiFacade.editSport(Integer.parseInt(id), sportName);
            } else {
                redirect = "";
            }
        } catch (DataAccessException e) {
            if (e.getMessage().startsWith("Cannot delete or update a parent row")) {
                return redirect+pageToShow+"?error=Sport's already used  Bmi-entries cannot be deleted";
            } else {
                request.setAttribute("problem", "Error while communicating with the database (developers should check logfiles)");
                return "errorpage";
            }
        }
        request.setAttribute("sportList", BmiFacade.getAllSports());
        return redirect+pageToShow;
    }
}
