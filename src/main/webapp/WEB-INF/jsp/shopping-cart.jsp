 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="include/header.jsp"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/cart_styles.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/cart_responsive.css"/>">
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

            <div class="cart_section">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-10 offset-lg-1">
                            <div class="cart_container" >
                                <div class="cart_title">Shopping Cart</div>
                                Order Date: <fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd" />
                                <div class="cart_items">
                                    <c:forEach var="orderDetail" items="${order.orderDetails}">
                                        <ul class="cart_list">

                                            <li class="cart_item clearfix">
                                                <div class="cart_item_image">
                                                    <c:forEach var="image" items="${orderDetail.product.images}" begin="0" end="0">
                                                        <img src="<c:url value="/resources/images/${image.name}"/>" alt=""></div>
                                                    </c:forEach>
                                                <div class="cart_item_info d-flex flex-md-row flex-column justify-content-between" >
                                                    <div class="cart_item_name cart_info_col">
                                                        <div class="cart_item_title">Name</div>
                                                        <div class="cart_item_text">${orderDetail.product.proName }</div>
                                                    </div>
                                                    <div class="cart_item_color cart_info_col">
                                                        <div class="cart_item_title" >Color</div>

                                                        <form action="${pageContext.request.getContextPath()}/cart/update-color/${orderDetail.product.id}" method="post" class="form-inline"  >
                                                            <div class="cart_item_text" >
                                                              
                                                                
                                                                     <select id="mySelect" name="color" class="form-control" onchange="selectColor()"
                                                        style="height: 30px;width: 50px; background-color: ${orderDetail.color}">
                                                    <c:forEach var="cls" items="${orderDetail.product.colors}" varStatus="status">
                                                        <c:if test="${status.index == 0}">
                                                            <option  style="background-color: ${cls.color}; height: 30px;width: 50px;"  value="${cls.color}" selected></option>    
                                                        </c:if>
                                                        <c:if test="${status.index != 0}">
                                                            <option  style="background-color: ${cls.color}; height: 30px;width: 50px;"  value="${cls.color}"></option>    
                                                        </c:if>
                                                    </c:forEach>   
                                                </select>
                                                                    
                                                                <input type="submit" class="btn btn-sm" value="Update"/>
                                                            </div>
                                                        </form>
<!--                                                        <div class="cart_item_text"><span style="background-color:${orderDetail.color}"></span></div>-->

                                                    </div>
                                                    <div class="cart_item_quantity cart_info_col"   >
                                                        <div class="cart_item_title">Quantity</div>
                                                        <form action="${pageContext.request.getContextPath()}/cart/update-quantity/${orderDetail.product.id}" method="post" class="form-inline" >
                                                            <div class="cart_item_text">
                                                                <input class="form-control" style="text-align: center; height: 32px;width: 60px;" type="number" name="quantity" value="${orderDetail.quantity}" />
                                                                <input type="submit" class="btn btn-sm" value="Update"/>
                                                            </div>
                                                        </form>
                                                    </div>
                                                    <div class="cart_item_quantity cart_info_col">
                                                        <div class="cart_item_title">Price</div>
                                                        <div class="cart_item_text"><fmt:formatNumber value="${orderDetail.product.unitPrice-orderDetail.product.discount}"/> </div>
                                                    </div>
                                                    <div class="cart_item_quantity cart_info_col" >
                                                        <div class="cart_item_title">Remove</div>
                                                        <div class="cart_item_text"><a style="color: red;"   href="${pageContext.request.contextPath}/cart/remove/${orderDetail.product.id}">&nbsp;&nbsp;&nbsp;&nbsp;X</a></div>
                                                    </div>
                                                </div>

                                            </li>

                                        </ul>
                                    </c:forEach>
                                </div>

                                <!-- Order Total -->
                                <div class="order_total">
                                    <div class="order_total_content text-md-right">
                                        <div class="order_total_title">Order Total:</div>
                                        <div class="order_total_amount"><fmt:formatNumber value="${order.totalPrice}"/> VNĐ</div>
                                    </div>
                                </div>



                                <div class="cart_buttons">
                                    <a href="${pageContext.request.getContextPath()}/home" class="btn btn-lg btn-outline-primary pull-right" > Continue Shopping</a>
                                    <a href="${pageContext.request.getContextPath()}/cart/checkout" class="btn btn-lg btn-primary pull-right" > Check out</a>
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
<script src="<c:url value="/resources/js/cart_custom.js"/>"></script>
<script>
                                                function selectColor() {
                                                    var x = document.getElementById("mySelect").value;
                                                    document.getElementById("mySelect").style.backgroundColor = x;
                                                }
</script>