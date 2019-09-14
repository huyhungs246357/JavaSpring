

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Account</title>
        <jsp:include page="include/header.jsp"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/main_styles.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/responsive.css"/>">
    </head>
    <body style=" background-repeat: no-repeat; background-attachment: fixed; background-position: center; background-image: url(<c:url value="/resources/images/br4.jpg)"/>"; >
        <div class="super_container">
            <!-- Header -->
            <header class="header">
                <!-- Top Bar -->
                <jsp:include page="include/top_2.jsp"/>

            </header>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12" style="text-align: center">
                        <h2> Change Password</h2>
                    </div>
                </div>


                <c:if test="${message!=null && message!=''}">
                    <div class="row">
                        <div class="col-lg-8 offset-lg-4">
                               <div class="col-lg-8">
                            <div class="alert alert-danger" style="text-align: center">
                                ${message}
                            </div>
                               </div>
                        </div>
                    </div>
                </c:if>


                <div class="row" >
                    <div class="col-lg-8 offset-lg-4">
                        <form  action="${pageContext.request.getContextPath()}/update_password_result" method="post" class="form-horizontal" modelAttribute="user"  >

                            <div class="form-group">
                                <label class="col-lg-8">User Name</label>
                                <div class="col-lg-8">
                                    <input name="username" readonly="readonly" type="text" value="${user.username}" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-8">Old Password</label>
                                <div class="col-lg-8">
                                    <input name="password" type="password"  required class="form-control" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-8">New Password</label>
                                <div class="col-lg-8">
                                    <input  name="password1" type="password"  required class="form-control" />
                                </div>
                            </div>


                            <input name="id" value="${user.id}" hidden/>
                            <input name="guest.id" value="${user.guest.id}" hidden />
                            <input name="guest.fullName" hidden value="${user.guest.fullName}"  />
                            <input name="guest.birthDate" hidden value="${user.guest.birthDate}"  />
                            <input name="guest.address" hidden value="${user.guest.address}"  />
                            <input name="guest.email" hidden value="${user.guest.email}"  />
                            <input name="guest.phoneNumber" hidden value="${user.guest.phoneNumber}"  />
                            <div class="form-group">
                                <div class="col-lg-8">
                                    <input type="submit" class="btn btn-group-lg" value="Update" />
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
