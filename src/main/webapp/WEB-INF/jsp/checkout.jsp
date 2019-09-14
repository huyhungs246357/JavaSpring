

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<!DOCTYPE html>
<html lang="en">
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="include/header.jsp"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/contact_styles.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/contact_responsive.css"/>">
        <title>Cart</title>
    </head>

    <body>
        <div class="super_container">
            <!-- Header -->
            <header class="header">
                <!-- Top Bar -->
                <jsp:include page="include/top.jsp"/>
                <jsp:include page="include/navigation.jsp"/>
            </header>

            <div class="contact_form">
                <div class="container">
                   
                       <!-- Contact Form -->


                    <div class="row">
                        <div class="col-lg-10 offset-lg-1">
                            <div class="contact_form_container">
                                <div class="contact_form_title" style="margin-bottom: 1%;" >Fill Information</div>
                                <f:form action="${pageContext.request.getContextPath()}/cart/success" method="post" modelAttribute="shipping" class="form-horizontal">
                                    <div class="form-group">
                                        <label  class="col-lg-8 control-label">Receipt's Name<span style="color: red;">*</span></label>
                                        <div class="col-lg-8">
                                            <input name="fullName" value="${guestEntity.fullName}" type="text" required class="form-control"/>

                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label  class="col-lg-8 control-label">Receipt's Email<span style="color: red;">*</span></label>
                                        <div class="col-lg-8 ">
                                            <input name="email" value="${guestEntity.email}" type="email" required class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label  class="col-lg-8 control-label">Address <span style="color: red;">*</span></label>
                                        <div class="col-lg-8">
                                            <input name="address" value="${guestEntity.address}" type="text" required class="form-control"/>

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label  class="col-lg-8 control-label">Phone number <span style="color: red;">*</span></label>
                                        <div class="col-lg-8">
                                            <input name="phoneNumber" value="${guestEntity.phoneNumber}" type="text" required class="form-control"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-8">
                                            <button type="submit" class="btn btn-primary btn-large">Checkout</button>
                                        </div>
                                    </div>
                                </f:form>
                            </div>
                        </div>
                    </div>    
                    <div class="row">
                        <div class="col-lg-10 offset-lg-1" >
                            <div class="contact_form_title" style="margin-bottom: 1%;">Your order</div>
                            <div class="table-resposive">
                                <table class="table table-bordered" style="text-align: center;">
                                    <tr style="background-color: #6895f4;color: white;">
                                        <th>Product</th>
                                        <th>Name</th>
                                        <th>Color</th>
                                        <th>Quantity</th>
                                        <th>Unit Price </th>
                                    </tr>
                                    <c:forEach var="orderDetail" items="${order.orderDetails}">
                                        <tr >
                                            <td style="width: 15%;"> 
                                                <c:forEach var="image" items="${orderDetail.product.images}" begin="0" end="0">

                                                    <img style="width: 100%;"  src="<c:url value="/resources/images/${image.name}"/>" alt="">

                                                </c:forEach>
                                            </td>
                                            <td>${orderDetail.product.proName }</td>
                                            <td> <div style="margin: auto;width: 40%;background-color: ${orderDetail.color}">&nbsp</div></td>
                                            <td>${orderDetail.quantity}</td>
                                            <td><fmt:formatNumber value="${orderDetail.product.unitPrice-orderDetail.product.discount}"/></td>
                                        </tr>
                                    </c:forEach>

                                </table>
                                <table class="table table-bordered" style="font-size: large;text-align: center;">
                                    <tr >
                                        <th> Total Price: <fmt:formatNumber value="${order.totalPrice} " /> VNĐ</th> 
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>

           
                </div>
            </div>    
        </div>
        <!-- Footer -->
        <jsp:include page="include/footer.jsp"/>
    </div>
</body>

</html>

<script src="<c:url value="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"/>"></script>
<script src="<c:url value="/resources/js/contact_custom.js"/>"></script>