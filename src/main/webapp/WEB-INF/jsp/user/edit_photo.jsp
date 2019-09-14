

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Photo</title>
        <link href="${pageContext.request.getContextPath()}/webjars/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>

    </head>
         <body style=" background-repeat: no-repeat; background-attachment: fixed; background-position: center; background-image: url(<c:url value="/resources/images/br4.jpg)"/>"; >

           <div class="container">
            <div class="row">
                <div class="col-lg-12 " style="text-align: center">
                 <h2> <a style="text-decoration: none;" href="${pageContext.request.getContextPath()}/user/list_product">Product's Photos</a></h2>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12" >
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <tr>
                            
                                <th>Product_name</th>
                                <th>Image_name</th>
                                <th style="width: 100px;">Image_photo</th>

                            </tr>
                            <c:if test="${images!=null && fn:length(images)>0}">
                                <c:forEach items="${images}" var="im">
                                    <tr>
                                        
                                        <td>${im.product.proName}</td> 
                                        <td>${im.name}</td>   
                                        <td><img style="width: 100px;"  src="<c:url value="/resources/images/${im.name}"/>" alt=""></td>   
                                    </tr>
                                </c:forEach>
                            </c:if>
                            <c:if test="${images==null && fn:length(images)<=0}">
                                <tr>
                                    <td style="color: red; text-align: center" colspan="5">Not Found!</td>
                                </tr>
                            </c:if>
                        </table>

                    </div>

                </div>


            </div>
        </div>
    </body>
</html>
