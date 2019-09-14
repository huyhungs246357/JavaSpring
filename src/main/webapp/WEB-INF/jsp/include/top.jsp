<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="top_bar">
    <div class="container">
        <div class="row">
            <div class="col d-flex flex-row">
                <div class="top_bar_contact_item"><div class="top_bar_icon"><img src="<c:url value="/resources/images/phone.png"/>" alt=""></div>0708 143873</div>
                <div class="top_bar_contact_item"><div class="top_bar_icon"><img src="<c:url value="/resources/images/mail.png"/>" alt=""></div><a href="mailto:huyhungs246357@gmail.com">huyhungs246357@gmail.com</a></div>
                <div class="top_bar_content ml-auto">

                    <div class="top_bar_user">
                        <div>
                            <sec:authorize access="!isAuthenticated()">

                                <div class="user_icon"><img src="<c:url value="/resources/images/user.svg"/>" alt=""></div>
                                <div><a href="${pageContext.request.getContextPath()}/register">Register</a></div>
                                <a href="<c:url value="/login"/>">Login</a>
                            </sec:authorize>
                            <!-- login -->
                            <sec:authorize access="isAuthenticated()">
                                <div>
                                
                                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                                        <a href="<c:url value="/admin/home"/>">Manage Page I</a>
                                    </sec:authorize>

                                    <a href="<c:url value="/viewUser"/>"><sec:authentication property="principal.username" /></a>
                                    <a href="<c:url value="/logout"/>">I Logout</a><br/>
                                </div>
                            </sec:authorize>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>		
</div>
<!-- Header Main -->

<div class="header_main">
    <div class="container">
        <div class="row">

            <!-- Logo -->
            <div class="col-lg-4 col-sm-3 col-3 order-1">
                <div class="logo_container">
                    <div class="logo">
                        <a href="<c:url value="/home"/>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;HK&hearts;Shop</a>
                       
                    </div>
                </div>

            </div>

            <!-- Search -->
            <div class="col-lg-6 col-12 order-lg-2 order-3 text-lg-left text-right" >
                <div class="header_search">
                    <div class="header_search_content">
                        <div class="header_search_form_container">
                            <form action="${pageContext.request.getContextPath()}/search" method="post" class="header_search_form clearfix">
                                <input type="search" name="searchText"    class="header_search_input" placeholder="Search for products...">
                                <div class="custom_dropdown_placeholder" >
                                    <div class="custom_dropdown_list">
                                        <span class="custom_dropdown_placeholder clc"></span>
                                        <!--<i class="fas fa-chevron-down"></i>-->
                                        <ul class="custom_list clc" >

                                        </ul>
                                    </div>
                                </div>
                                <button type="submit" class="header_search_button trans_300" value="Submit"><img src="<c:url value="/resources/images/search.png"/>" alt=""></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Wishlist -->
            <div class="col-lg-2 col-9 order-lg-3 order-2 text-lg-left text-right">
                <div class="wishlist_cart d-flex flex-row align-items-center justify-content-end">
                    <!-- Cart -->
                    <div class="cart">
                        <div class="cart_container d-flex flex-row align-items-center justify-content-end">
                            <div class="cart_icon">
                                <img src="<c:url value="/resources/images/cart.png"/>" alt="">

                                <div class="cart_count"><span>${sessionScope.order.getOrderDetails().size()}</span></div>
                            </div>
                            <div class="cart_content">
                                <div class="cart_text"><a href="${pageContext.request.getContextPath()}/cart/view-cart">Cart</a></div>
                                <div class="cart_price"><fmt:formatNumber value="${sessionScope.order.getTotalPrice()}"/> </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>