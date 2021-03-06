

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Promotion</title>
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
                        <div class="col-sm-12" style="text-align: center">
                            <h2>Add Form Promotion</h2>
                        </div>
                    </div>

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
                        </div>
                    </c:if>

                    <div class="row">
                        <div class="col-sm-12">
                           <form:form action="${pageContext.request.getContextPath()}/admin/add-form-promotion" method="post" modelAttribute="promotion" class="form-horizontal" enctype="multipart/form-data">
                                <c:if test="${action=='update-promotion'}">
                                    <input name="id" value="${promotion.id}" hidden />

                                </c:if>

                                <div class="form-group">
                                    <label class="control-label col-sm-2">Name
                                        <span class="ui-error">(*)</span></label>
                                    <div class="col-sm-8">
                                        <input name="name" class="form-control" required
                                               value="${promotion.name}"/>
                                    </div>
                                </div>

                                
                                <div class="form-group">
                                    <label class="control-label col-sm-2">
                                        Discount </label>
                                    <div class="col-sm-8">
                                        <input type="number" name="discount" 
                                               class="form-control" value="${promotion.discount}"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-sm-2">
                                        Start Date</label>
                                    <div class="col-sm-8">
                                        <input type="date" name="startDate" 
                                               class="form-control" value="${promotion.startDate}"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-sm-2">
                                        End Date</label>
                                    <div class="col-sm-8">
                                        <input type="date" name="endDate" 
                                               class="form-control" value="${promotion.endDate}"/>
                                    </div>
                                </div>
                                

                                <div class="form-group" style="text-align: center">
                                    <button class="btn btn-primary" 
                                            type="submit">Submit</button>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page ="../admin/footer.jsp"></jsp:include>
    </body>
</html>
