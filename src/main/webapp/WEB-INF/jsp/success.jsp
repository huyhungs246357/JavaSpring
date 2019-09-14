<%-- 
    Document   : index
    Created on : Jan 4, 2019, 1:10:25 PM
    Author     : Administrator
--%>

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



            <!-- Contact Form -->

            <div class="contact_form">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-10 offset-lg-2">
                            <div class="contact_form_container">
                                <div class="contact_form_title">Thank you for your shopping!</div>

                                
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