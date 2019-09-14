

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
                <jsp:include page="include/top.jsp"/>

            </header>
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12" style="text-align: center">
                        <h2> <a style="text-decoration: none;" href="${pageContext.request.getContextPath()}/viewUser">Order Detail</a></h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-12" >
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <tr>
                                    <th>Product</th>
                                    <th>Quantity</th>
                                    <th>Pice</th>

                                </tr>
                                <c:if test="${orderdetail!=null && fn:length(orderdetail)>0}">
                                    <c:forEach items="${orderdetail}" var="ordt">
                                        <tr>
                                            <td>${ordt.product.proName}</td> 
                                            <td>${ordt.quantity}</td> 
                                            <td><fmt:formatNumber value="${ordt.product.unitPrice-ordt.product.discount}"/></td> 

                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${orderdetail==null && fn:length(orderdetail)<=0}">
                                    <tr>
                                        <td style="color: red; text-align: center" colspan="5">Not Found!</td>
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
