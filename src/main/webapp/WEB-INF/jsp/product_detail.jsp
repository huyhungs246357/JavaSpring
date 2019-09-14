
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="include/header.jsp"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/product_styles.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/product_responsive.css"/>">
        <title>Product</title>
    </head>

    <body>
        <div class="super_container">
            <!-- Header -->
            <header class="header">
                <!-- Top Bar -->
                <jsp:include page="include/top.jsp"/>
                <jsp:include page="include/navigation.jsp"/>
            </header>

            <div class="single_product">
                <div class="container">
                    <div class="row">

                        <!-- Images -->

                        <div class="col-lg-2 order-lg-1 order-2">
                            <ul class="image_list">
                                <c:forEach items="${images}" var="im">
                                    <li data-image="<c:url value="/resources/images/${im.name}"/>"><img src="<c:url value="/resources/images/${im.name}" />" alt=""></li>
                                    </c:forEach>
                            </ul>
                        </div>

                        <!--Selected Image--> 
                        <div class="col-lg-5 order-lg-2 order-1">
                            <c:set var="imageName" value="trends_background.jpg"/>
                            <c:forEach items="${images}" var="im" begin="0" end="0">
                                <c:set var="imageName" value="${im.name}"/>
                            </c:forEach>
                            <div class="image_selected"><img src="<c:url value="/resources/images/${imageName}"/>" alt=""></div>
                        </div>

                        <!-- Description -->
                        <div class="col-lg-5 order-3">
                            <input name="id" value="${product.id}" hidden/>
                            <div class="product_description">
                                <div class="product_category">   <td>${product.category.name}</td></div>
                                <div class="product_name">${product.proName}</div>
                                <div class="product_text">${product.description}</div>
                                <div class="order_info">
                                    <form action="${pageContext.request.getContextPath()}/cart/add/${product.id }" method="get">
                                        <div class="form-group row clearfix" style="z-index: 1000;">
                                            <label class="col-sm-2 col-form-label">Color</label>
                                            <div class="col-sm-10">
                                                <select id="mySelect" name="color" class="form-control" onchange="selectColor()"
                                                        style="height: 30px;width: 50px; background-color: ${product.colors[2].color}">
                                                    <c:forEach var="cls" items="${product.colors}" varStatus="status">
                                                        <c:if test="${status.index == 0}">
                                                            <option  style="background-color: ${cls.color}; height: 30px;width: 50px;"  value="${cls.color}" selected></option>    
                                                        </c:if>
                                                        <c:if test="${status.index != 0}">
                                                            <option  style="background-color: ${cls.color}; height: 30px;width: 50px;"  value="${cls.color}"></option>    
                                                        </c:if>
                                                    </c:forEach>   
                                                </select>
                                            </div>
                                        </div>
                                
                                       
                                       

                                        <div class="product_price" style="font-size: medium;text-decoration: line-through;"><fmt:formatNumber value="${product.unitPrice}"/> VNĐ</div><br>
                                        <div class="product_price" style="margin-top :0%;color: red;"><fmt:formatNumber value="${product.unitPrice-(product.discount)}"/> VNĐ</div>
                                        <div class="button_container">
                                            <button type="submit" class="button cart_button">Add to Cart</button>
                                            <!--<a href="${pageContext.request.getContextPath()}/cart/add/${product.id }" type="submit"class="btn btn-large btn-primary pull-right" style="margin-top: 4%;margin-bottom: 5%"> Add to cart</a>-->

                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


            <jsp:include page="include/footer.jsp"/>
        </div>
    </body>

<script src="<c:url value="/resources/js/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/resources/js/styles/bootstrap4/popper.js"/>"></script>
<script src="<c:url value="/resources/js/styles/bootstrap4/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/js/plugins/greensock/TweenMax.min.js"/>"></script>
<script src="<c:url value="/resources/js/plugins/greensock/TimelineMax.min.js"/>"></script>
<script src="<c:url value="/resources/js/plugins/scrollmagic/ScrollMagic.min.js"/>"></script>
<script src="<c:url value="/resources/js/plugins/greensock/animation.gsap.min.js"/>"></script>
<script src="<c:url value="/resources/js/plugins/greensock/ScrollToPlugin.min.js"/>"></script>
<script src="<c:url value="/resources/js/plugins/OwlCarousel2-2.2.1/owl.carousel.js"/>"></script>
<script src="<c:url value="/resources/js/plugins/easing/easing.js"/>"></script>
<script src="<c:url value="/resources/js/js/product_custom.js"/>"></script>
</html>

<script>
                                                function selectColor() {
                                                    var x = document.getElementById("mySelect").value;
                                                    document.getElementById("mySelect").style.backgroundColor = x;
                                                }
</script>