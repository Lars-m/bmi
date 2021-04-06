package web.commands;

import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//abstract class Command {
public abstract class Command {

    //Return a token string from the execute method to make a client side redirect, instead of a server side (forward) redirect
    public final static String REDIRECT = "###REDIRECT###";
    public final static String REDIRECT_TO_HOME ="REDIRECT_TO_HOME";
    public final static String NOT_FOUND_COMMAND ="404_NOT_FOUND";

    private static HashMap<String, Command> commands;

    private static void initCommands() {
        commands = new HashMap<>();
        commands.put("login", new LoginCommand(Command.REDIRECT_TO_HOME));
        commands.put("register", new RegisterCommand(REDIRECT +"loginpage"));
        commands.put("logout", new LogoutCommand(Command.REDIRECT_TO_HOME));
        commands.put("loginpage", new PageCommand("loginpage"));
        commands.put("registerpage", new PageCommand("registerpage"));
        //commands.put("edit_sports_page", new ProtectedPageCommand("edit_sports_page", "admin"));
        commands.put("bmi_inputs", new PageCommand("bmi_inputs"));
        commands.put("bmi_result", new BmiCalculatorCommand("bmi_result"));
        commands.put("save_bmi", new SaveBmiCommand(Command.REDIRECT_TO_HOME));
        commands.put("bmi_results_for_user", new BmiResultsForUserCommand("bmi_results_for_user","user"));
        commands.put("edit_sports_page",new SportCommand("edit_sports_page","admin"));
    }


    public static Command fromPath(HttpServletRequest request) {

        String targetName = request.getPathInfo().replaceAll("^/+", "");
        System.out.println("--> " + targetName);
        if (commands == null) {
            initCommands();
        }
        return commands.getOrDefault(targetName, new UnknownCommand(targetName));
    }

    public abstract String execute(HttpServletRequest request, HttpServletResponse response) throws Exception;//, ServletException;


}
