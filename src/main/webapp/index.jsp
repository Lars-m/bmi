<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Home
    </jsp:attribute>

    <jsp:attribute name="footer">
        <c:set var="addHomeButton" value="${false}" scope="request"/>
    </jsp:attribute>

    <jsp:body>
        <div style="font-size: larger">
            <h2>BMI Calculator Site</h2>
            <div style="margin-top: 3em;">
                <c:if test="${sessionScope.role == 'admin' }">
                    <p style="font-size: larger">This is what you can do, since your are logged in as an admin</p>
                    <p><a href="fc/edit_sports_page">Edit Sports</a></p>
                </c:if>

                <c:if test="${sessionScope.role != 'admin' }">
                    <p><a href="fc/bmi_inputs">BMI Calculator</a>
                        <c:if test="${sessionScope.role != 'user' }">
                            <span>(You need to login to save your results)</span>
                        </c:if>
                    </p>
                </c:if>
                <c:if test="${sessionScope.role == 'user' }">
                    <p><a href="fc/bmi_results_for_user">See older BMI-entries</a></p>
                </c:if>


            </div>
        </div>
    </jsp:body>
</t:genericpage>