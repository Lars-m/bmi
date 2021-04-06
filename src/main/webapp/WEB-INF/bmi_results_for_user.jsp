<%@page import="business.services.BmiFacade" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<t:genericpage>
    <jsp:attribute name="header">
         Your BMI Results
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <div style="margin-left: auto;margin-right: auto;width:70%;font-size: larger">

            <table class="table">
                <thead>
                <tr>
                    <th>Created</th>
                    <th>Height</th>
                    <th>Weight</th>
                    <th>BMI</th>
                    <th>Category</th>
                     <th>Info</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach var="bmi" items="${requestScope.bmiEntries}">
                    <tr>
                        <td>${bmi.created}</td>
                        <td>${bmi.height}</td>
                        <td>${bmi.weight}</td>
                        <td><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2"
                                              value="${bmi.bmi}"/></td>
                        <td>${bmi.category}</td>
                        <td>
                            <button type="button" class="btn btn-outline-info btn-sm" data-toggle="modal"
                                    data-target="#exampleModal"
                                    data-date="${bmi.created}"
                                    data-height="${bmi.height}"
                                    data-weight="${bmi.weight}"
                                    data-bmi=<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${bmi.bmi}"/>
                                    data-category="${bmi.category}"
                                    data-gender="${bmi.gender}"
                                    data-sport="${bmi.sport.name}"
                                    data-infos="${bmi.infosAsString}"
                            >
                                Details (${bmi.infos.size()})
                            </button>
                        </td>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="title">BMI (<span id="date"></span>)</h5>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-4">Height</div>
                                <div class="col-md-4" id="height"></div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">Weight</div><div class="col-md-4" id="weight"></div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">BMI</div><div class="col-md-4" id="bmi"></div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">Category</div><div class="col-md-4" id="category"></div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">Gender</div><div class="col-md-4" id="gender"></div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">Sport</div><div class="col-md-4" id="sport"></div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">Additional Info</div>
                                <div class="col-md-8" id="infos"><ul id="uls"></ul></div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $('#exampleModal').on('show.bs.modal', function (event) {
                const button = $(event.relatedTarget) // Button that triggered the modal
                const date = button.data('date')
                const infos = button.data("infos")
                const items =button.data('infos').split("###");
                const uls = items[0]==="" ? null : button.data('infos').split("###").map(item  =>"<li>"+item+"</li>").join("");
                const modal = $(this)
                modal.find('#date').text(date)
                modal.find('#height').text(button.data('height'))
                modal.find('#weight').text(button.data('weight'))
                modal.find('#bmi').text(button.data('bmi'))
                modal.find('#category').text(button.data('category'))
                modal.find('#gender').text(button.data('gender'))
                modal.find('#sport').text(button.data('sport'))
                if(uls) {
                    modal.find('#uls').html(uls)
                }
            })

        </script>

    </jsp:body>
</t:genericpage>

