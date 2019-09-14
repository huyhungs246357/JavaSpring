<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link type="text/css" rel="stylesheet" href="<c:url value="/webjars/bootstrap/3.4.1/css/bootstrap.min.css"/>"/>
        
       
    <body style=" background-repeat: no-repeat; background-attachment: fixed; background-position: center; background-image: url(<c:url value="/resources/images/br4.jpg)"/>"; >
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12" style="text-align: center">
                 
                    <h1>Login</h1>
                </div>
            </div>
            <c:if test="${message!=null && message!=''}">
                <div class="row">
                    <div class="col-xs-12 col-sm-12">
                        <div class="alert alert-danger" style="text-align: center">
                            ${message}
                        </div>
                    </div>
                </div>
            </c:if>
            <div class="row">
                <div class="col-xs-12 col-sm-12">
                    <form action="<c:url value="j_spring_security_check"/>" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 col-xs-4 control-label">User Name</label>
                            <div class="col-sm-8 col-xs-8">
                                <input name="username" type="text" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-xs-4 control-label">Password</label>
                            <div class="col-sm-8 col-xs-8">
                                <input name="password" type="password" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group" style="text-align: center">
                            <input type="submit" class="btn btn-primary" value="Login" />
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>