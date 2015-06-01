<%--
  Created by IntelliJ IDEA.
  User: safayat
  Date: 4/28/14
  Time: 4:22 PM
  To change this template use File | Settings | File Templates.

--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="icon" href="http://getbootstrap.com/favicon.ico">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <jsp:include page="/WEB-INF/pages/common/head.jsp"/>
    <script type="text/javascript">
        var app = angular.module('myApp', []);
    </script>
</head>
<section id="main-wrapper" class="theme-default">
    <jsp:include page="/WEB-INF/pages/common/header.jsp?v=2"/>
    <jsp:include page="/WEB-INF/pages/common/menu.jsp?v=2"/>

    <!--main content start-->
    <section class="main-content-wrapper">
        <div class="pageheader">
            <h1>User Info</h1>
        </div>
        <section id="main-content" class="animated fadeInUp">
            <div class="row" data-ng-app="myApp">
                <div class="col-md-12">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Profile</h3>
                        </div>
                        <div class="panel-body">
                            <table class="table tab-bottom table-bordered">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>Vacation Name</th>
                                        <th>From</th>
                                        <th>To</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${vacationList}" var="vacation" varStatus="status">
                                        <tr>
                                            <td>${status.count}</td>
                                            <td>${vacation.vacationName}</td>
                                            <td>${vacation.startDate}</td>
                                            <td>${vacation.endDate}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </section>
</section>