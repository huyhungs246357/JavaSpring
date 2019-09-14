

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Account</title>
        
    </head>
    <body style=" background-repeat: no-repeat; background-attachment: fixed; background-position: center; background-image: url(<c:url value="/resources/images/br2.jpg)"/>"; >
      
           
            <div class="container">
                <div class="row">
                    <div class="col-lg-12" style="text-align: center">
                        <h2> <a style="text-decoration: none;" href="${pageContext.request.getContextPath()}/admin/list_account">Edit Account</a></h2>
                    </div>
                </div>
                <div class="row" >
                    <div class="col-lg-8 offset-lg-4">
                        <form  style="text-align: center;" action="${pageContext.request.getContextPath()}/admin/update_account_result" method="post"  modelAttribute="user"  >
                            <input name="username" hidden value="${user.username}"  />
                            <input name="password" hidden value="${user.password}" />
                            <input name="id" value="${user.id}" hidden/>
                            <input name="guest.id" value="${user.guest.id}" hidden />
                            <input name="guest.fullName" hidden value="${user.guest.fullName}"  />
                            <input name="guest.birthDate" hidden value="${user.guest.birthDate}"  />
                            <input name="guest.address" hidden value="${user.guest.address}"  />
                            <input name="guest.email" hidden value="${user.guest.email}"  />
                            <input name="guest.phoneNumber" hidden value="${user.guest.phoneNumber}"  />
                            <div class="form-group">
                                <select  name="userRole" multiple="true" class="form-control" >
                                    <c:forEach var="r" items="${roles}">       
                                        <option  value="${r.id}"  >${r.role} </option>                                                                                            
                                    </c:forEach>   
                                </select> 
                            </div>
                            <input type="submit" class="btn btn-sm" value="Update"/>

                        </form>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
