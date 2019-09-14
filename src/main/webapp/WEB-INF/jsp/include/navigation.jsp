<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Main Navigation -->

<nav class="main_nav">
    <div class="container">
        <div class="row">
            <div class="col">

                <div class="main_nav_content d-flex flex-row">

                    <!-- Categories Menu -->

                    <div class="cat_menu_container">
                        <div class="cat_menu_title d-flex flex-row align-items-center justify-content-start">
                            <div class="cat_burger"><span></span><span></span><span></span></div>
                            <div class="cat_menu_text">categories</div>
                        </div>

                        <ul class="cat_menu">
                            <c:forEach var="c" items="${categories}">
                                <li><a href="${pageContext.request.getContextPath()}/search_product/${c.id}">${c.name} <i class="fas fa-chevron-right ml-auto"></i></a></li>
                                    </c:forEach>

                        </ul>
                    </div>

                    <!-- Main Nav Menu -->

                    <div class="main_nav_menu ml-auto">
                        <ul class="standard_dropdown main_nav_dropdown">
                            <li><a href="<c:url value="/home"/>">Home&#32;&hearts;<i class="fas fa-chevron-down"></i></a></li>
                            <li >
                                <a href="#">Super Sale<i class="fas fa-chevron-down"></i></a>
                                <ul>
                                    <li>
                                        <a href="#">Event<i class="fas fa-chevron-down"></i></a>
                                        <ul>
                                            <li><a href="#">Menu Item<i class="fas fa-chevron-down"></i></a></li>
                                            <li><a href="#">Menu Item<i class="fas fa-chevron-down"></i></a></li>
                                            <li><a href="#">Menu Item<i class="fas fa-chevron-down"></i></a></li>
                                        </ul>
                                    </li>
                                    <li><a href="#">Menu Item<i class="fas fa-chevron-down"></i></a></li>
                                    <li><a href="#">Menu Item<i class="fas fa-chevron-down"></i></a></li>
                                    <li><a href="#">Menu Item<i class="fas fa-chevron-down"></i></a></li>
                                </ul>
                            </li>
                            <li >
                                <a href="${pageContext.request.getContextPath()}/news">Technology News<i class="fas fa-chevron-down"></i></a>

                            </li>
                            <li >
                                <a href="#">Warranty Policy<i class="fas fa-chevron-down"></i></a>
                                <ul>
                                    <li><a href="shop.html">Shop<i class="fas fa-chevron-down"></i></a></li>
                                    <li><a href="product.html">Product<i class="fas fa-chevron-down"></i></a></li>
                                    <li><a href="blog.html">Blog<i class="fas fa-chevron-down"></i></a></li>
                                    <li><a href="blog_single.html">Blog Post<i class="fas fa-chevron-down"></i></a></li>
                                    <li><a href="regular.html">Regular Post<i class="fas fa-chevron-down"></i></a></li>
                                    <li><a href="cart.html">Cart<i class="fas fa-chevron-down"></i></a></li>
                                    <li><a href="contact.html">Contact<i class="fas fa-chevron-down"></i></a></li>
                                </ul>
                            </li>
                            <li><a href="blog.html">About Us<i class="fas fa-chevron-down"></i></a></li>
                            <li><a href="${pageContext.request.getContextPath()}/contact">Contact<i class="fas fa-chevron-down"></i></a></li>
                        </ul>
                    </div>

                    <!-- Menu Trigger -->

                    <div class="menu_trigger_container ml-auto">
                        <div class="menu_trigger d-flex flex-row align-items-center justify-content-end">
                            <div class="menu_burger">
                                <div class="menu_trigger_text">menu</div>
                                <div class="cat_burger menu_burger_inner"><span></span><span></span><span></span></div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</nav>

<!-- Menu -->

<div class="page_menu">
    <div class="container">
        <div class="row">
            <div class="col">

                <div class="page_menu_content">

                    <div class="page_menu_search">
                        <form action="${pageContext.request.getContextPath()}/search" method="post" class="header_search_form clearfix">
                            <input type="search" name="searchText"  class="page_menu_search_input" placeholder="Search for products...">
                            <button type="submit" class="header_search_button trans_300" value="Submit"><img src="<c:url value="/resources/images/search.png"/>" alt=""></button>
                        </form>

                    </div>
                    <ul class="page_menu_nav">
                        <li class="page_menu_item has-children">
                            <a href="#">Language<i class="fa fa-angle-down"></i></a>
                            <ul class="page_menu_selection">
                                <li><a href="#">English<i class="fa fa-angle-down"></i></a></li>
                                <li><a href="#">Vietnamese<i class="fa fa-angle-down"></i></a></li>

                            </ul>
                        </li>
                        <li class="page_menu_item has-children">
                            <a href="#">Super Deals<i class="fa fa-angle-down"></i></a>
                            <ul class="page_menu_selection">
                                <li><a href="#">US Dollar<i class="fa fa-angle-down"></i></a></li>
                                <li><a href="#">EUR Euro<i class="fa fa-angle-down"></i></a></li>
                                <li><a href="#">GBP British Pound<i class="fa fa-angle-down"></i></a></li>
                                <li><a href="#">JPY Japanese Yen<i class="fa fa-angle-down"></i></a></li>
                            </ul>
                        </li>
                        <li class="page_menu_item">
                            <a href="#">Warranty Policy<i class="fa fa-angle-down"></i></a>
                        </li>
                        <li class="page_menu_item has-children">
                            <a href="#">Technology News<i class="fa fa-angle-down"></i></a>
                            <ul class="page_menu_selection">
                                <li><a href="#">Super Deals<i class="fa fa-angle-down"></i></a></li>
                                <li class="page_menu_item has-children">
                                    <a href="#">Menu Item<i class="fa fa-angle-down"></i></a>
                                    <ul class="page_menu_selection">
                                        <li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
                                        <li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
                                        <li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
                                        <li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
                                <li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
                                <li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
                            </ul>
                        </li>

                        <li class="page_menu_item"><a href="blog.html">blog<i class="fa fa-angle-down"></i></a></li>
                        <li class="page_menu_item"><a href="contact.html">contact<i class="fa fa-angle-down"></i></a></li>
                    </ul>

                    <div class="menu_contact">
                        <div class="menu_contact_item"><div class="menu_contact_icon"><img src="<c:url value="/resources/images/phone_white.png"/>" alt=""></div>0708 143873</div>
                        <div class="menu_contact_item"><div class="menu_contact_icon"><img src="<c:url value="/resources/images/mail_white.png"/>" alt=""></div><a href="huyhungs246357@gmail.com">huyhungs246357@gmail.com</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>