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
            }
        } catch (DataAccessException e) {
            if (e.getMessage().startsWith("Cannot delete or update a parent row")) {
                return Command.REDIRECT+pageToShow+"?error=Sport's already used by Bmi-entries cannot be deleted";
            } else {
                request.setAttribute("problem", "Error while communicating with the database (developers should check logfiles)");
                return "errorpage";
            }
        }
        request.setAttribute("sportList", BmiFacade.getAllSports());
        return pageToShow;
    }
}
