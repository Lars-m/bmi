<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Register as new User
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <div style="margin-top: 5em;">
            <form name="login" action="register" method="POST">
                <div class="row mb-3">
                    <label class="col-sm-1 col-form-label" for="email">Email</label>
                    <div class="col-sm-4">
                        <input class="form-control" type="text" id="email" name="email" value="${param.email}" placeholder="Enter a valid email">
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-1 col-form-label" for="password1">Password</label>
                    <div class="col-sm-4">
                        <input class="form-control" type="password" id="password1" name="password1"  value="${param.password1}"  placeholder="Enter your password">
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-1 col-form-label" for="password2">Password</label>
                    <div class="col-sm-4">
                        <input class="form-control" type="password" name="password2"  id="password2" value="${param.password2}"  placeholder="Repeat the password">
                    </div>
                </div>

                <input class="btn btn-primary" type="submit" type="submit" value="Submit">
            </form>

            <c:if test="${requestScope.userinputerror != null }">
                <p style="color:red">
                        ${requestScope.userinputerror}
                </p>
            </c:if>
        </div>
    </jsp:body>
</t:genericpage>


