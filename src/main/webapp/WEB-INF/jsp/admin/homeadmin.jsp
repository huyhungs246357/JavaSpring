<%-- 
    Document   : home
    Created on : Jun 20, 2019, 7:47:58 PM
    Author     : AnhLe
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <jsp:include page="header.jsp" />
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="topmenu.jsp" />
            <jsp:include page="content.jsp" />
        </div>                
        <jsp:include page ="footer.jsp"></jsp:include>
    </body>
</html>
