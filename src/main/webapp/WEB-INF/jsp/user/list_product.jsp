

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
                        <h2> <a style="text-decoration: none;" href="${pageContext.request.getContextPath()}/user/list_product">List Product</a></h2>
                    </div>
                </div>
                <div class="row" >
                    <div class="col-lg-3 " style="padding-bottom: 10px;" >
                        <button class="btn btn-info" 
                                onclick="location.href = '${pageContext.request.getContextPath()}/user/addproduct-form3'">Add New</button>
                    </div> 
                </div>
                <div class="row" >
                    <div class="col-sm-6" style="padding-bottom: 10px;">
                    <form action="${pageContext.request.contextPath}/user/search" 
                          method="post" class="form-inline">
                        <div class="form-group">
                            <input name="searchTxt" class="form-control"/>
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
                                    <th>Category</th>
                                    <th>Price</th>
                                    <th>Description </th>
                                    <th>Publish Date</th>
                                    <th>Code</th>
                                    <th>Available</th>
                                    <th>Quantity</th>
                                    <th>Discout</th>
                                    <th>Action</th>
                                </tr>

                                <c:if test="${products!=null && fn:length(products)>0}">
                                    <c:forEach var="p" items="${products}">
                                        <tr>
                                            <td>${p.id}</td>
                                            <td>${p.proName}</td>
                                            <td>${p.category.name}</td>
                                            <td><fmt:formatNumber value="${p.unitPrice}"/></td>
                                            <td>${p.description}</td>
                                            <td>${p.publishDate}</td>
                                            <td>${p.code}</td>

                                            <td>${p.available}</td>
                                            <td>${p.quantityInStore}</td>
                                            <td><fmt:formatNumber value="${p.discount}"/></td>
                                            <td>
                                                <button style="margin-bottom: 10px; " class="btn btn-block" onclick="location.href = '${pageContext.request.getContextPath()}/user/edit_product/${p.id}'">Edit</button>
                                                <button style="margin-bottom: 10px; " class="btn btn-block" onclick="location.href = '${pageContext.request.getContextPath()}/user/edit_photo/${p.id}'">Photo </button>
                                                <button style="margin-bottom: 10px; " class="btn btn-danger" onclick="location.href = '${pageContext.request.getContextPath()}/user/delete_product/${p.id}'">Delete </button>
                                            </td>

                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${products==null || fn:length(products)<=0}">
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