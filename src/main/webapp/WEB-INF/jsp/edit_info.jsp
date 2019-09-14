

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User page</title>
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
            <div class="contact_form">
                <div class="container">
                    <div class="row" >
                        <div class="col-lg-10 offset-lg-1" style="text-align: center">
                            <h2> <a style="text-decoration: none;" href="${pageContext.request.getContextPath()}/edit_info">Update Info</a></h2>
                        </div>
                    </div>
                    <div class="row" >
                        <div class="col-lg-9 offset-lg-3">
                            <div class="contact_form_container" >
                                <f:form action="${pageContext.request.getContextPath()}/update_info_result" method="post" modelAttribute="guests" class="form-horizontal">
                                    <input name="id" value="${guests.id}" hidden/>
                                    <div class="form-group">
                                        <label  class="col-lg-8 control-label">Full Name<span style="color: red;">*</span></label>
                                        <div class="col-lg-8 ">
                                            <input name="fullName" type="text" value="${guests.fullName}" required class="form-control"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label  class="col-lg-8 control-label">Phone Number <span style="color: red;">*</span></label>
                                        <div class="col-lg-8 ">
                                            <input name="phoneNumber" type="text" value="${guests.phoneNumber}" required class="form-control"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label  class="col-lg-8 control-label">Address <span style="color: red;">*</span></label>
                                        <div class="col-lg-8 ">
                                            <input name="address" value="${guests.address}"  class="form-control" type="text"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label  class="col-lg-8 control-label">Email<span style="color: red;">*</span></label>
                                        <div class="col-lg-8 ">
                                            <input name="email" value="${guests.email}"  class="form-control" type="text"/>
                                        </div>
                                    </div>
                                        <div class="form-group">
                                        <label  class="col-lg-8 control-label">BirthDate<span style="color: red;">*</span></label>
                                        <div class="col-lg-8 ">
                                            <input name="birthDate" value="${guests.birthDate}"  class="form-control" type="date"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-8">
                                            <input type="submit" class="btn btn-primary" value="Update Info" />
                                        </div>
                                    </div>
                                </f:form>

                            </div>
                        </div>
                    </div>
                </div>   

            </div>
            <!-- Footer -->
            <jsp:include page="include/footer.jsp"/>
        </div>
    </div>
</body>
</html>
