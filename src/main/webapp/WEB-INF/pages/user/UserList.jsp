<%--
  Created by IntelliJ IDEA.
  User: safayat
  Date: 8/4/14
  Time: 3:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <link rel="icon" href="http://getbootstrap.com/favicon.ico">
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <jsp:include page="/WEB-INF/pages/common/head.jsp"/>
        <jsp:include page="/WEB-INF/pages/common/header.jsp"/>
    </head>
    <body>
        <c:set var="userList" value="${requestScope.userList}" />
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Username</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Mobile Address</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${userList}" var="user">
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </c:forEach>
            </tbody>

        </table>
    </body>
</html>
