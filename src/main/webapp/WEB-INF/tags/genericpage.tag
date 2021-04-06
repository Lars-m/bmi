<%@tag description="Overall Page template" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/styles/styles.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
  <head>

<body>

<!--
This header is inspired by this bootstrap example: https://getbootstrap.com/docs/5.0/examples/pricing/
-->
<header class="d-flex flex-column flex-md-row align-items-center p-3 pb-0 px-md-4 mb-4 bg-white border-bottom shadow-sm" >
    <div class="h5 my-0 me-md-auto fw-normal" >
        <p>BMI Calculator</p>
        <p style="font-size: larger">
            <jsp:invoke fragment="header"/>
        </p>
    </div>
    <nav class="my-2 my-md-0 me-md-3"></nav>
    <c:if test="${sessionScope.user != null }">
        <p style="margin-right: 3em;">Logged in as: ${sessionScope.user.email}</p>
    </c:if>
    <c:set var="thisPage" value="${pageContext.request.servletPath}"/>
    <c:set var="isNotLoginPage" value="${!fn:endsWith(thisPage,'loginpage.jsp')}"/>
    <c:set var="isNotRegisterPage" value="${!fn:endsWith(thisPage,'registerpage.jsp')}"/>
    <c:if test="${isNotLoginPage && isNotRegisterPage}">
        <div>
            <c:if test="${sessionScope.user != null }">
                <p><a type="button" class="btn btn-outline-secondary"
                      href="${pageContext.request.contextPath}/fc/logout">logout</a></p>
            </c:if>
            <c:if test="${sessionScope.user == null }">
            <p><a type="button" class="btn btn-sm  btn-outline-secondary"
                  href="${pageContext.request.contextPath}/fc/loginpage">Login</a> &nbsp;&nbsp; or
                &nbsp;&nbsp;
                <a type="button" class="btn btn-sm btn-outline-secondary"
                   href="${pageContext.request.contextPath}/fc/registerpage">Register as new
                    user</a>
                </c:if>
        </div>
    </c:if>
</header>

<div id="body" class="container" style="min-height: 20vh;">
    <jsp:doBody/>
</div>

<!-- Footer -->
<div class="container">
    <br>
    <hr>
    <br>
    <jsp:invoke fragment="footer"/>
    <c:if test="${addHomeButton == null }">
        <a type="button" class="btn btn-dark" href="<%=request.getContextPath()%>/index.jsp">Home</a>
    </c:if>
</div>
</body>
</html>

