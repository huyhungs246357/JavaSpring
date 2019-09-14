
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Products</title>
        <jsp:include page="../include/header.jsp"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/main_styles.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/responsive.css"/>">

    </head>
    <body style=" background-repeat: no-repeat; background-attachment: fixed; background-position: center; background-image: url(<c:url value="/resources/images/br2.jpg)"/>"; >

        <div class="super_container">
            <!-- Header -->
            <header class="header">
                <!-- Top Bar -->
                <jsp:include page="../include/top_1.jsp"/>

            </header>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 " style="text-align: center">
                        <h2> <a style="text-decoration: none;" href="${pageContext.request.getContextPath()}/admin/home">Manager User</a></h2>
                    </div>
                </div>
              
                <div class="row" >
                    <div class="col-lg-6 " style="padding-bottom: 10px; " >
                        <form action="search_account" method="post" class="form-inline">
                            <div class="form-group" >
                                <input  name="searchText" class="form-control" type="text" />
                                <input  style="margin-left: 5px;"class="btn btn-info" type="submit" value="Search" />
                            </div>
                        </form>
                    </div> 
                </div>

                <c:if test="${message!=null && message!=''}">
                    <div class="row">
                        <div class="col-lg-12" style="padding-bottom: 10px;" >
                            <div class="alert alert-info">
                                ${message}
                            </div>
                        </div> 
                    </div>
                </c:if>

                <div class="row">
                            <div class="col-xs-12 col-sm-12" >
                                <div class="table-resposive">
                                    <table class="table table-bordered">
                                        <tr>
                                            <th>Id</th>
                                            <th>Email</th>
                                            <th>Password</th>
                                            <th>Role</th>
                                            <th>Update Role</th>
                                        </tr>

                                        <c:if test="${account!=null && fn:length(account)>0}">
                                            <c:forEach var="c" items="${account}">
                                                <tr>
                                                    <td>${c.id}</td>
                                                    <td>${c.username}</td>
                                                    <td>${c.password}</td>
                                                    <td>
                                                        <c:forEach items="${c.userRole}" var="cc">
                                                            <div>${cc.role}</div>
                                                        </c:forEach>
                                                    </td>
                                                    <td>
                                                        <button style="margin-bottom: 10px; " class="btn btn-primary" onclick="location.href = '${pageContext.request.getContextPath()}/admin/edit_account/${c.id}'">UpdateRole</button>
                                                 
                                                    </td>


                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${account==null || fn:length(account)<=0}">
                                            <tr>
                                                <td colspan="12" style="color: red; font-size: 30px; text-align: center">Not Found</td>
                                            </tr>
                                        </c:if>
                                    </table>
                                </div>
                            </div>
                        </div>
            </div>
        </div>
    </body>
</html>
<script src="<c:url value="/resources/js/contact_custom.js"/>"></script>

