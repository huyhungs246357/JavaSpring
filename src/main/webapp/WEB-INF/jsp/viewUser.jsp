

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12" style="text-align: center">
                        <h2> User Details</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-12" >
                        <div class="table-resposive">
                            <table class="table table-bordered">
                                <tr>
                                    <th>Guest_Name</th>
                                    <th>Phone</th>
                                    <th>Address</th> 
                                    <th>Email</th>
                                    <th>BirthDate</th>
                                    <th>Action</th>
                                </tr>
                                <tr>
                                    <td>${guests.fullName}</td>
                                    <td>${guests.phoneNumber}</td>
                                    <td>${guests.address}</td>
                                    <td>${guests.email}</td>
                                    <td>${guests.birthDate}</td>
                                    <td>
                                        <button style="margin-bottom: 10px; " class="btn btn-info" onclick="location.href = '${pageContext.request.getContextPath()}/edit_info'">Update-Info</button>
                                        <button style="margin-bottom: 10px; " class="btn btn-info" onclick="location.href = '${pageContext.request.getContextPath()}/change_password'">Change-Password</button>

                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12 col-sm-12" style="text-align: center">
                        <h2> History Orders</h2>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12 col-sm-12" >
                        <div class="table-resposive">
                            <table class="table table-bordered">
                                <tr>
                                    <th>Date Order</th>
                                    <th>TotalPrice</th>
                                    <th>Name</th>
                                    <th>Phone</th>
                                    <th>Address</th>
                                    <th>Status</th>
                                    <th>View Details</th>
                                </tr>

                                <c:forEach var="oh" items="${orderh}">
                                    <tr>
                                        <td>${oh.orderDate}</td>    
                                        <td><fmt:formatNumber value="${oh.totalPrice}"/></td>    
                                        <td>${oh.shipping.fullName}</td> 
                                        <td>${oh.shipping.phoneNumber}</td> 
                                        <td>${oh.shipping.address}</td> 
                                        <td>${oh.status}</td>    

                                        <td>
                                            <button style="margin-bottom: 10px; " class="btn btn-info" onclick="location.href = '${pageContext.request.getContextPath()}/view_orderdetail/${oh.id}'">View Detail</button>
                                        </td>
                                    </tr>
                                </c:forEach>


                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
