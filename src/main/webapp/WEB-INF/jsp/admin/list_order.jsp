
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Order</title>
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
                        <h2> <a style="text-decoration: none;" href="${pageContext.request.getContextPath()}/admin/home">List Order</a></h2>
                    </div>
                </div>
               
               <div class="row" >
                                
                                <div class="col-xs-12 col-sm-12" style="padding-bottom: 10px; " >
                                    <form action="${pageContext.request.contextPath}/admin/search_order" method="post" class="form-inline">
                                        <div class="form-group" >
                                            <input name="startDate"   type="date" class="form-control" pattern="yyyy-mm-dd" />
                                            <input name="endDate"   type="date" class="form-control" pattern="yyyy-mm-dd"/>
                                             
                                            <input class="btn btn-info" style="margin-left: 5px;" type="submit" value="Search" />
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
                                    <div class="table-responsive-sm" >
                                        <table class="table table-bordered"  >
                                            <thead>
                                                <tr >
                                                    <th>Guest_Name</th>
                                                    <th>Phone</th>
                                                    <th>Address</th> 
                                                    <th >Email</th>
                                                    <th>Order_Id</th>
                                                    <th>OrderDate</th>
                                                    <th>TotalPrice</th>
                                                    <th>Status</th>
                                                    <th>Details</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:if test="${orders!=null && fn:length(orders)>0}">
                                                    <c:forEach var="ord" items="${orders}">
                                                        <tr>
                                                            <td>${ord.shipping.fullName}</td>
                                                            <td>${ord.shipping.phoneNumber}</td>
                                                            <td>${ord.shipping.address}</td>
                                                            <td>${ord.shipping.email}</td>
                                                            <td>${ord.id}</td>
                                                            <td>${ord.orderDate}</td>
                                                            <td><fmt:formatNumber value="${ord.totalPrice}"/></td>
                                                            <td style="text-align: center;" >
                                                                <form   action="${pageContext.request.getContextPath()}/admin/change_status/${ord.id}" method="post" class="form-inline"  >
                                                                    <select name="status" class="form-control" style="margin-bottom: 5%;">
                                                                        <c:forEach var="st" items="${status}">       
                                                                            <option  value="${st}" ${st==ord.status ? 'selected': ''} >${st} </option>                                                                                            
                                                                        </c:forEach>   
                                                                    </select> 
                                                                    <input style="margin:  auto;" type="submit" class="btn btn-sm" value="Update"/>
                                                                </form>
                                                            </td>
                                                            <td>
                                                                <button style="margin-bottom: 10px; " class="btn btn-sm" onclick="location.href = '${pageContext.request.getContextPath()}/admin/view_orderdetail/${ord.id}'">View Detail</button>

                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>

                                            </tbody>
                                            <c:if test="${orders==null || fn:length(orders)<=0}">
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

