

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order details</title>
        <jsp:include page="../admin/header.jsp"/>
    </head>
    <body style=" background-repeat: no-repeat; background-attachment: fixed; background-position: center; background-image: url(<c:url value="/resources/images/br4.jpg)"/>"; >
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



                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12" style="text-align: center">
                                <h2> <a style="text-decoration: none;" href="${pageContext.request.getContextPath()}/user/view_orderdetail">Order Detail</a></h2>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-12" >
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <tr>
                                            <th>Product</th>
                                            <th>Quantity</th>
                                            <th>Color</th>
                                            <th>Pice</th>

                                        </tr>
                                        <c:if test="${orderdetail!=null && fn:length(orderdetail)>0}">
                                            <c:forEach items="${orderdetail}" var="ordt">
                                                <tr>
                                                    <td>${ordt.product.proName}</td> 
                                                    <td>${ordt.quantity}</td> 
                                                    <td>${ordt.color}</td> 
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
            </d     iv>
        </div>
    </body>
</html>
