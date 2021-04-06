<%@ page import="business.services.BmiFacade" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<t:genericpage>
    <jsp:attribute name="header">
         BMI Result
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <div style="margin-left: auto;margin-right: auto;width:50%;font-size: larger">
            <p>Height: ${height}</p>
            <p>Weight: ${weight}</p>
            <p>BMI: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${bmi}"/></p>
            <p>Category: ${category}</p>
            <p>Gender: ${gender}</p>
            <p>Sport: ${sport_name}</p>
            <h4>Additional Info</h4>
            <ul>
            <c:forEach var="info" items="${info_strings}">
                <li>${info}</li>
            </c:forEach>
            </ul>

            <c:set var="ids_comma_separated" value="${fn:join(info_ids,',')}"/>
            <div>
                <c:if test="${sessionScope.user != null }">
                    <p><a type="button" class="btn btn-secondary"
                          href="save_bmi?height=${height}&weight=${weight}&gender=${gender}&sport=${sport_id}&info_ids=${ids_comma_separated}">Save BMI Result</a></p>
                </c:if>
                <c:if test="${sessionScope.user == null }">
                    <div class="alert alert-primary" role="alert">
                        Login to save your result, and see previous results
                    </div>

                </c:if>
            </div>
        </div>

    </jsp:body>
</t:genericpage>

