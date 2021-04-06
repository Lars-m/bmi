<%@ page import="business.services.BmiFacade" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<t:genericpage>
    <jsp:attribute name="header">
         <h5>Add/Edit/Delete Sports</h5>
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <div style="margin-left: auto;margin-right: auto;width: 70%">
            <div class="border border-secondary rounded" style="padding: 20px 10px;">
                <form>
                    <div class="form-group row">

                        <label class="col-sm-3 col-form-label" for="sport">Add new sport</label>
                        <div class="col-sm-6">
                            <input type="test" class="form-control" id="sport" name="sport">
                        </div>
                        <div class="col-sm-3">
                            <button type="submit" class="btn btn-primary">Save sport</button>
                        </div>
                    </div>
                </form>
            </div>
            <br/>

            <p style="color:#ff0000"> ${param.error} </p>

            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Sport</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="sport" items="${requestScope.sportList}">
                    <tr>
                        <td>${sport.id}</td>
                        <td>
                            <div style="float:left;width: 80%">
                                <form>
                                    <div class="form-group row">
                                        <div class="col-md-10">
                                            <input class="form-control" type="text" name="sport"
                                                   value="${sport.name}">
                                        </div>
                                        <input type="hidden" name="id" value="${sport.id}">
                                        <div class="col-sm-2">
                                            <button type="submit" class="btn btn-primary btn-sm">Edit</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div style="float:left">
                                <form>
                                    <div class="form-group row">
                                        <div class="col-sm-8">
                                            <button type="submit" name="delete" class="btn btn-danger btn-sm">Delete
                                            </button>
                                        </div>
                                        <input type="hidden" name="id" value="${sport.id}">
                                    </div>
                                </form>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </jsp:body>
</t:genericpage>
