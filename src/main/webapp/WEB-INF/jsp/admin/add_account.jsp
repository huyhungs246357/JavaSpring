


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add account</title>
        <jsp:include page="../admin/header.jsp"/>
    </head>
    <body>

        <div id="wrapper">
            <jsp:include page="../admin/topmenu.jsp" />
            <div id="page-wrapper">

                <div class="row">
                    <!-- Page Header -->
                    <div class="col-lg-12">
                        <h1 class="page-header">Dashboard</h1>
                    </div>
                    <!--End Page Header -->
                </div>

                <div class="row">
                    <!-- Welcome -->
                    <div class="col-lg-12">
                        <div class="alert alert-info">
                            <i class="fa fa-folder-open"></i><b>&nbsp;Hello ! </b>Welcome Back <b>Jonny Deen </b>
                            <i class="fa  fa-pencil"></i><b>&nbsp;2,000 </b>Support Tickets Pending to Answere. nbsp;
                        </div>
                    </div>
                    <!--end  Welcome -->
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12" style="text-align: center">
                            <h2> <a style="text-decoration: none;" href="${pageContext.request.getContextPath()}/admin/addaccount">Add Accounts</a></h2>
                        </div>
                    </div>
                    <div class="container">
                        <div class="col-xs-12 col-sm-12" style="text-align: center">
                            <c:if test="${message!=null && message!=''}">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <c:if test="${status!=null && status=='success'}">
                                            <div class="alert alert-success">
                                                ${message}
                                            </div>
                                        </c:if>
                                        <c:if test="${status!=null && status=='fail'}">
                                            <div class="alert alert-danger">
                                                ${message}
                                            </div>
                                        </c:if>
                                    </div>
                                </c:if>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12 col-sm-12" style="text-align: center">


                                <div class="contact_form_container" >
                                    <form:form action="${pageContext.request.getContextPath()}/admin/addaccount_success" method="post" modelAttribute="account" class="form-horizontal" enctype="multipart/form-data">


                                         <div class="form-group">
                                        <label  class="control-label col-sm-2">Username<span style="color: red;">*</span></label>
                                        <div class="col-lg-8">
                                            <input name="username" type="text" required class="form-control"/>

                                        </div>
                                    </div>






                                        <div class="form-group">
                                            <label  class="control-label col-sm-2">Password <span style="color: red;">*</span></label>
                                            <div class="col-lg-8 ">
                                                <input name="password"   class="form-control" type="text"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label  class="control-label col-sm-2">Role<span style="color: red;">*</span></label>
                                            <div class="col-lg-8">
                                                <select style="margin-left: auto" name="userRole" class="form-control">
                                                    <c:forEach var="r" items="${roles}">

                                                        <option  value="${r.id}" >${r.role}</option>

                                                    </c:forEach>

                                                </select>   

                                            </div>
                                        </div>




                                        <div class="form-group">
                                            <div class="col-lg-8">
                                                <input type="submit" class="btn btn-primary" value="Save Account" />
                                            </div>
                                        </div>
                                    </form:form>
                                </div>    
                            </div>    
                        </div>
                    </div> 
                </div>
            </div>

        </div>
        <jsp:include page ="../admin/footer.jsp"></jsp:include>
    </body>

</html>

