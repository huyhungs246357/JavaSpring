

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
    <head> 


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="include/header.jsp"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/plugins/jquery-ui-1.12.1.custom/jquery-ui.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/shop_styles.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/shop_responsive.css"/>">
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


<!--            <div class="home">
                <div class="home_background parallax-window" data-parallax="scroll" data-image-src="<c:url value="/resources/images/shop_background.jpg"/>"></div>
                <div class="home_overlay"></div>
                <div class="home_content d-flex flex-column align-items-center justify-content-center">
                    <h2 class="home_title">Smartphones</h2>
                </div>
            </div>-->

            <div class="shop">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-2 offset-lg-1">

                            <!-- Shop Sidebar -->
                            <div class="shop_sidebar">
                                <div class="sidebar_section">
                                    <div class="sidebar_title">Brand</div>
                                    <ul class="sidebar_categories">
                                        <c:forEach var="c" items="${categories}">
                                            <li><a href="${pageContext.request.getContextPath()}/search_product/${c.id}">${c.name} </a></li>
                                            </c:forEach>

                                    </ul>
                                </div>
<!--                                <div class="sidebar_section filter_by_section">
                                    <div class="sidebar_title">Filter By</div>
                                    <div class="sidebar_subtitle">Price</div>
                                    <div class="filter_price">
                                        <div id="slider-range" class="slider_range"></div>
                                        <p>Range: </p>
                                        <p><input type="text" id="amount" class="amount" readonly style="border:0; font-weight:bold;"></p>
                                    </div>
                                </div>-->

                            </div>

                        </div>

                        <div class="col-lg-9">

                            <!-- Shop Content -->

                            <div class="shop_content">
                                <div class="shop_bar clearfix">
                                    <div class="shop_product_count"><span></span> Products found</div>
                                    <div class="shop_sorting">
                                        <span>Sort by:</span>
                                        <ul>
                                            <li>
                                                <span class="sorting_text">name<i class="fas fa-chevron-down"></span></i>
                                                <ul>
                                                    <!--<li class="shop_sorting_button" data-isotope-option='{ "sortBy": "original-order" }'>highest rated</li>-->
                                                    <li class="shop_sorting_button" data-isotope-option='{ "sortBy": "name" }'>name</li>
                                                    <li class="shop_sorting_button"data-isotope-option='{ "sortBy": "price" }'>price</li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="product_grid">
                                    <div class="product_grid_border"></div>

                                    <!-- Product Item -->

                                    <!-- Product Item -->
                                    <c:forEach var="b" items="${products}">
                                        <div class="product_item discount">
                                            <div class="product_border"></div>
                                            <c:forEach var="image" items="${b.images}" begin="0" end="0">
                                                <div class="product_image d-flex flex-column align-items-center justify-content-center" style="width: 90%;"><a href="${pageContext.request.getContextPath()}/detail-product/${b.id}"><img src="<c:url value="/resources/images/${image.name}"/>" alt=""></a></div>
                                                    </c:forEach>
                                            <div class="product_content">
                                                <div class="product_price" style="margin-top: 19%;"><fmt:formatNumber value="${b.unitPrice-(b.discount)}"/> VNĐ</div>
                                                <div class="product_name"><div><a href="${pageContext.request.getContextPath()}/detail-product/${b.id}">${b.proName }</a></div></div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>

                                <!-- Shop Page Navigation -->

<!--                                <div class="shop_page_nav d-flex flex-row">
                                    <div class="page_prev d-flex flex-column align-items-center justify-content-center"><i class="fas fa-chevron-left"></i></div>
                                    <ul class="page_nav d-flex flex-row">
                                        <li><a href="#">1</a></li>
                                        <li><a href="#">2</a></li>
                                        <li><a href="#">3</a></li>
                                        <li><a href="#">...</a></li>
                                        <li><a href="#">21</a></li>
                                    </ul>
                                    <div class="page_next d-flex flex-column align-items-center justify-content-center"><i class="fas fa-chevron-right"></i></div>
                                </div>-->

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
<script src="<c:url value="/resources/plugins/Isotope/isotope.pkgd.min.js"/>"></script>
<script src="<c:url value="/resources/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"/>"></script>
<script src="<c:url value="/resources/plugins/parallax-js-master/parallax.min.js"/>"></script>
<script src="<c:url value="/resources/js/shop_custom.js"/>"></script>
