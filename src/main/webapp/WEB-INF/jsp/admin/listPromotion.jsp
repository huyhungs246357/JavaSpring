

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Promotion</title>
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
                        <h2> <a style="text-decoration: none;" href="${pageContext.request.getContextPath()}/admin/listPromotion">List Promotion</a></h2>
                    </div>
                </div>
                <div class="row" >
                    <div class="col-sm-6" style="padding-bottom: 10px">
                                        <button class="btn btn-primary"
                                                onclick="location.href = '<c:url value="/admin/add-form-promotion"/>'">
                                            Add New</button>
                                    </div>
                </div>
                <div class="row" >
                    <div class="col-sm-6" style="padding-bottom: 10px;">
                    <form action="${pageContext.request.contextPath}/admin/search1" 
                          method="post" class="form-inline">
                        <div class="form-group">
                            <input name="searchTxt1" class="form-control"/>
                            <input  style="margin-left: 5px;"class="btn btn-info" type="submit" value="search" />
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
                    <div class="col-lg-12" >
                        <div class="table-resposive">
                            <table class="table table-bordered">
                                <tr>
                                    <th>Id</th>
                                    <th>Name</th>
                                    <th>DisCount</th>
                                    <th>Start Date</th>
                                    <th>End Date </th>
                                    <th>Status </th>
                                    <th>Action</th>
                                </tr>

                                <c:if test="${promotion!=null && fn:length(promotion)>0}">
                                    <c:forEach var="p2" items="${promotion}">
                                        <tr>
                                            <td>${p2.id}</td>
                                            <td>${p2.name}</td>
                                            <td>${p2.discount}</td>
                                    
                                            <td>${p2.startDate}</td>

                                            <td>${p2.endDate}</td>
                                            <td>${p2.status}</td>
                                            
                                   
                                            <td>
                                                <button style="margin-bottom: 10px; " class="btn btn-block" onclick="location.href = '${pageContext.request.getContextPath()}/admin/edit_promotion/${p2.id}'">Edit</button>
                                                
                                                
                                            </td>

                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${promotion==null || fn:length(promotion)<=0}">
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