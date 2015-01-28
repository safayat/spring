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
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <jsp:include page="/WEB-INF/pages/common/head.jsp" />

</head>
<body>
<div class="row">
    <div class="col-md-2">
    </div>
    <div class="col-md-8">
        <jsp:include page="/WEB-INF/pages/common/header.jsp"/>
        <div class="col-md-3">
            <jsp:include page="/WEB-INF/pages/common/menu.jsp"/>
        </div>
        <div class="col-md-9">
            <form:form method="POST" commandName="profile" action="/private/updateProfile.web" cssClass="form" cssStyle="width: 30%">

                <form:hidden path="profileId"/>
                <div class="form-group">
                    <label>First Name</label>
                    <form:input path="firstName" cssClass="form-control col-md-2"/>
                </div>

                <div class="form-group">
                    <label>Last Name</label>
                    <form:input path="lastName" cssClass="form-control"/>
                </div>

                <div class="form-group">
                    <label>Date Of Birth</label>
                    <form:input path="dateOfBirth" class="form-control"/>
                </div>

                <div class="form-group">
                    <label>Mobile No</label>
                    <form:input path="mobileNo" cssClass="form-control"/>
                </div>

                <button type="submit" class="btn btn-primary">Update Profile</button>

            </form:form>
        </div>
    </div>
    <div class="col-md-2">
    </div>


</div>
</body>
</html>
