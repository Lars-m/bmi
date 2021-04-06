<%@ page import="business.services.BmiFacade" %>
<%@ page import="business.services.Sport" %>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    //    if (request.getServletContext().getAttribute("sportList") == null) {
//        request.getServletContext().setAttribute("sportList", LoginFacade.getAllSports());
//
    //Allows changes directly on the database
    request.setAttribute("sportList", BmiFacade.getAllSports());
    request.setAttribute("infoList", BmiFacade.getAllInfos());
%>

<t:genericpage>
    <jsp:attribute name="header">
         BMI Calculator
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>

        <div style="margin-left: auto;margin-right: auto;width:400px;">
            <form action="bmi_result">
                <br/>

                <div class="form-group">
                    <label for="height">Enter your height</label>
                    <input type="number" class="form-control" id="height" name="height" aria-describedby="height-help"
                           placeholder="Enter your height">
                    <small id="height-help" class="form-text text-muted">Enter your height in centimeters</small>
                </div>
                <br/>
                <div class="form-group">
                    <label for="weight">weight</label>
                    <input type="number" class="form-control" id="weight" name="weight" placeholder="Your weight">
                </div>
                <br/>
                <div class="form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" id="gender-female" value="female">
                    <label class="form-check-label" for="gender-female">
                        Female
                    </label>
                </div>
                <div class="form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" id="gender-other" value="other">
                    <label class="form-check-label" for="gender-other">
                        Other
                    </label>
                </div>
                <div class="form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" id="gender-male" value="male">
                    <label class="form-check-label" for="gender-male">
                        Male
                    </label>
                </div>
                <br/>
                <br/>

                <div class="form-group">
                    <label for="sport">Primary sport</label>
                    <select class="form-control" id="sport" name="sport">
                            <%--                        <c:forEach var="sportsItem" items="${applicationScope.sportList}">--%>
                        <c:forEach var="sport" items="${requestScope.sportList}">
                            <option value="${sport.id}#-#${sport.name}">${sport.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <br/>
                <c:forEach var="info" items="${requestScope.infoList}">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="info" value="${info.id}#-#${info.name}"
                               id="${info.id}">
                        <label class="form-check-label" for="${info.id}"> ${info.name}</label>
                    </div>
                </c:forEach>

                <br/>
                <c:if test="${requestScope.userinputerror != null }">
                    <p style="color:red">
                        Input error: ${requestScope.userinputerror}
                    </p>
                </c:if>
                <br/>
                <button type="submit" class="btn btn-primary">Calculate BMI</button>

            </form>
        </div>
    </jsp:body>
</t:genericpage>

