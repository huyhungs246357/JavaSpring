
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
    <head> 


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="include/header.jsp"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/plugins/slick-1.8.0/slick.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/main_styles.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/responsive.css"/>">
        <title>OneTech</title>
    </head>

    <body>
        <div class="super_container">
            <!-- Header -->
            <header class="header">
                <!-- Top Bar -->
                <jsp:include page="include/top.jsp"/>
                <jsp:include page="include/navigation.jsp"/>
            </header>


            <div class="banner" style="margin-top: -4%; ">
                <div class="banner_background" style="background-image:url(<c:url value="/resources/images/banner_background.jpg)"/>"></div>
                <div class="container fill_height">
                    <div class="row fill_height" >
                        <div class="banner_product_image" ><img  src="<c:url value="/resources/images/banner_product.png"/>"  alt=""></div>
                        <div class="col-lg-5 offset-lg-4 fill_height">
                            <div class="banner_content">
                                <br> 
                                <h1 class="banner_text">new era of smartphones</h1>
                                <div class="banner_price"><span>$530</span>$460</div>
                                <div class="banner_product_name">Apple Iphone 6s</div>
                                <div class="button banner_button"><a href="#">Shop Now</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <!-- Deals of the week -->

            <div class="deals_featured">
                <div class="container">
                    <div class="row">
                        <div class="col d-flex flex-lg-row flex-column align-items-center justify-content-start">
                            <div class="featured" style="width: 100%;">
                                <div class="tabbed_container">
                                    <div class="tabs">
                                        <ul class="clearfix">
                                            <li class="active">New</li>
                                            <li>Luxury</li>
                                        </ul>
                                        <div class="tabs_line"><span></span></div>
                                    </div>
                                    <!--                                     Product Panel -->
                                    <div class="product_panel panel active">
                                        <div class="featured_slider slider">
                                            <c:forEach var="b" items="${products}">
                                                <div class="featured_slider_item">
                                                    <div class="border_active"></div>
                                                    <div class="product_item discount d-flex flex-column align-items-center justify-content-center text-center" >
                                                        <c:forEach var="image" items="${b.images}" begin="0" end="0">
                                                            <div class="product_image d-flex flex-column align-items-center justify-content-center" style="width: 45%;"><a href="${pageContext.request.getContextPath()}/detail-product/${b.id}"><img src="<c:url value="/resources/images/${image.name}"/>" alt=""></a></div>
                                                                </c:forEach>
                                                        <div class="product_content" >
                                                            <div class="product_price" style="margin-top: 2%;font-size: inherit;text-decoration: line-through;"><fmt:formatNumber value="${b.unitPrice }"/> VNĐ</div>
                                                            <div class="product_price discount" style="margin-top: 0%"> <fmt:formatNumber value="${b.unitPrice-(b.discount)}"/> VNĐ</div>
                                                            <div class="product_name"><div><a href="${pageContext.request.getContextPath()}/detail-product/${b.id}">${b.proName }</a></div></div>

                                                            <div class="product_extras">

                                                                <a href="${pageContext.request.getContextPath()}/cart/add/${b.id }" type="submit"class="btn btn-large btn-primary pull-right" style="margin-top: 4%;margin-bottom: 5%"> Add to cart</a>
                                                                <!--<button class="product_cart_button">Add to Cart</button>-->
                                                            </div>
                                                        </div>
                                                        <ul class="product_marks">
                                                            <li class="product_mark product_discount">Hot</li>
                                                            <li class="product_mark product_new">new</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <div class="featured_slider_dots_cover"></div>
                                    </div>

                                    <div class="product_panel panel">
                                        <div class="featured_slider slider">
                                            <!--Slider Item--> 
                                            <c:forEach var="b2" items="${products2}">
                                                <div class="featured_slider_item">
                                                    <div class="border_active"></div>
                                                    <div class="product_item  is_new d-flex flex-column align-items-center justify-content-center text-center" >
                                                        <c:forEach var="image" items="${b2.images}" begin="0" end="0">
                                                            <div class="product_image d-flex flex-column align-items-center justify-content-center"  style="width: 45%;">
                                                                <a href="${pageContext.request.getContextPath()}/detail-product/${b2.id}"><img src="<c:url value="/resources/images/${image.name}"/>" alt=""/></a></div>
                                                                </c:forEach>
                                                        <div class="product_content">
                                                            <div class="product_price" style="margin-top: 2%;font-size: inherit;text-decoration: line-through;"><fmt:formatNumber value="${b2.unitPrice }"/> VNĐ</div>
                                                            <div class="product_price discount" style="margin-top: 0%"> <fmt:formatNumber value="${b2.unitPrice-(b2.discount)}"/> VNĐ</div>
                                                            <div class="product_name"><div ><a href="${pageContext.request.getContextPath()}/detail-product/${b2.id}">${b2.proName }</a></div></div>
                                                            <div class="product_extras">
                                                                <a href="${pageContext.request.getContextPath()}/cart/add/${b2.id }" type="submit"class="btn btn-large btn-primary pull-right" style="margin-top: 4%;margin-bottom: 5%"> Add to cart</a>

                                                            </div>
                                                        </div>
                                                        <!--<div class="product_fav"><i class="fas fa-heart"></i></div>-->
                                                        <ul class="product_marks">
                                                            <li class="product_mark product_discount"></li>
                                                            <li class="product_mark product_new" style="font-size: 75%">Luxury</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>

                                        <div class="featured_slider_dots_cover"></div>
                                    </div>
                                </div>
                            </div>
                            <!--<div class="featured_slider_dots_cover"></div>-->
                        </div>
                    </div>
                </div>
            </div>


            <div class="characteristics">
                <div class="container">
                    <div class="row">

                        <!-- Char. Item -->
                        <div class="col-lg-3 col-md-6 char_col">

                            <div class="char_item d-flex flex-row align-items-center justify-content-start">
                                <div class="char_icon"><img src="<c:url value="/resources/images/char_1.png"/>" alt=""></div>
                                <div class="char_content">
                                    <div class="char_title">Free Delivery</div>
                                    <!--                                    <div class="char_subtitle">from $50</div>-->
                                </div>
                            </div>
                        </div>

                        <!-- Char. Item -->
                        <div class="col-lg-3 col-md-6 char_col">

                            <div class="char_item d-flex flex-row align-items-center justify-content-start">
                                <div class="char_icon"><img src="<c:url value="/resources/images/char_2.png"/>" alt=""></div>
                                <div class="char_content">
                                    <div class="char_title">Free Exchange</div>
                                    <div class="char_subtitle">for 7 days</div>
                                </div>
                            </div>
                        </div>

                        <!-- Char. Item -->
                        <div class="col-lg-3 col-md-6 char_col">

                            <div class="char_item d-flex flex-row align-items-center justify-content-start">
                                <div class="char_icon"><img src="<c:url value="/resources/images/char_3.png"/>" alt=""></div>
                                <div class="char_content">
                                    <div class="char_title">Money back</div>
                                    <div class="char_subtitle">for 3 days</div>
                                </div>
                            </div>
                        </div>

                        <!-- Char. Item -->
                        <div class="col-lg-3 col-md-6 char_col">

                            <div class="char_item d-flex flex-row align-items-center justify-content-start">
                                <div class="char_icon"><img src="<c:url value="/resources/images/char_5.png"/>" alt=""></div>
                                <div class="char_content">
                                    <div class="char_title">Installment</div>
                                    <!--<div class="char_subtitle">from $50</div>-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="include/footer.jsp"/>
        </div>
    </body>

</html>
<script src="<c:url value="/resources/plugins/slick-1.8.0/slick.js"/>"></script>
<script src="<c:url value="/resources/js/custom.js"/>"></script>
