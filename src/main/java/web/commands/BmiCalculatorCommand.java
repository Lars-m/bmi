package web.commands;

import business.services.BmiEntry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

//public class BmiCalculatorCommand extends ProtectedPageCommand{
public class BmiCalculatorCommand extends PageCommand{
    public BmiCalculatorCommand(String pageToShow) {
        super(pageToShow);
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String heightStr = request.getParameter("height");
        String weightStr = request.getParameter("weight");
        String gender = request.getParameter("gender");
        String[] sportAll = request.getParameter("sport").split("#-#");
        String sportId = sportAll[0];
        String sportStr = sportAll[1];
        System.out.println("----> "+sportId+", "+sportStr);
        String[] infoAlls = request.getParameterValues("info");
        List<String> infoIds = new ArrayList<>();
        List<String> infoStrings = new ArrayList<>();
        if(infoAlls != null && infoAlls.length>0) {
            for (String infoAll : infoAlls) {
                String[] parts = infoAll.split("#-#");
                infoIds.add(parts[0]);
                infoStrings.add(parts[1]);
            }
        }
        try{
            double height = Double.parseDouble(heightStr);
            double weight = Double.parseDouble(weightStr);
            double bmi = weight * 100*100 / (height * height);
            request.setAttribute("height",height);
            request.setAttribute("weight",weight);
            request.setAttribute("bmi",bmi);
            request.setAttribute("gender",gender);
            request.setAttribute("sport_id",sportId);
            request.setAttribute("sport_name",sportStr);
            request.setAttribute("info_ids",infoIds.toArray());
            request.setAttribute("info_strings",infoStrings.toArray());

            if(gender==null){
                throw new IllegalArgumentException("Value for gender must be selected");
            }
            String category = BmiEntry.getCategory(bmi);
            request.setAttribute("category",category);
            return pageToShow;
        }catch (Exception e){
            request.setAttribute("userinputerror", e.getMessage());
            return "bmi_inputs";
        }
    }
}
