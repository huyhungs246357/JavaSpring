<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="top_bar">
    <div class="container">
        <div class="row">
            <div class="col d-flex flex-row">
                <div class="top_bar_contact_item"><div class="top_bar_icon"><img src="<c:url value="/resources/images/phone.png"/>" alt=""></div>1900 1221</div>
                <div class="top_bar_contact_item"><div class="top_bar_icon"><img src="<c:url value="/resources/images/mail.png"/>" alt=""></div><a href="huyhungs246357@gmail.com">huyhungs246357@gmail.com</a></div>
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
                              
                                    <a href="<c:url value="/user/viewUser"/>"><sec:authentication property="principal.username" /></a>
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
            <div class="col-lg-3 col-sm-3 col-3 order-1">
                <div class="logo_container">
                    <div class="logo">
                        <a href="<c:url value="/user/home"/>">&nbsp;&nbsp;&nbsp;&nbsp;HK&hearts;Shop</a>
                    </div>
                </div>

            </div> 
        </div>
    </div>
</div>