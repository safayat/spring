<%--
  Created by IntelliJ IDEA.
  User: safayat
  Date: 4/24/14
  Time: 5:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/WEB-INF/pages/common/head.jsp"/>

<section class="container animated fadeInUp">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div id="login-wrapper">
                <header>
                    <div class="brand">
                        <a href="index.html" class="logo">
                            <i class="icon-layers"></i>
                            <span>School</span>Management
                        </a>
                    </div>
                </header>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            Sign In
                        </h3>
                    </div>
                    <div class="panel-body">
                        <p> Login to access your account.</p>
                        <form:form method="POST" commandName="login" action="/j_spring_security_check" cssClass="form-horizontal">

                            <div class="form-group">
                                <div class="col-md-12">
                                    <form:input path="username" cssClass="form-control" cssStyle="padding-left: 32px"/>
                                    <i class="fa fa-user"></i>
                                    <form:errors path="username" cssClass="has-error"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-12">
                                    <form:password path="password" cssClass="form-control"/>
                                    <i class="fa fa-lock"></i>
                                    <a href="javascript:void(0)" class="help-block">Forgot Your Password?</a>
                                    <form:errors path="password" cssClass="has-error"/>

                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-12">
                                    <button type="submit" class="btn btn-primary btn-block">Sign in</button>
                                </div>
                            </div>

                        </form:form>

                    </div>
                </div>
            </div>
        </div>
    </div>

</section>

