<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<!-- login not yet -->
<sec:authorize access="!isAuthenticated()">
  
    <a href="<c:url value="/login"/>">Login</a>
</sec:authorize>
<!-- login -->
<sec:authorize access="isAuthenticated()">
    <p>
        <sec:authentication property="principal.username" />
        <a href="<c:url value="/logout"/>">Logout</a><br/>
    </p>
</sec:authorize>