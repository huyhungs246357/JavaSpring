
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Promotion</title>
        <jsp:include page="../include/header.jsp"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/main_styles.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/responsive.css"/>">
    </head>

    <body style=" background-repeat: no-repeat; background-attachment: fixed; background-position: center; background-image: url(<c:url value="/resources/images/br5.jpg)"/>"; >
        <div class="super_container">
            <!-- Header -->
            <header class="header">
                <!-- Top Bar -->
                <jsp:include page="../include/top_1.jsp"/>

            </header>

            <div class="contact_form">
                <div class="container">
                    <div class="row" >
                        <div class="col-lg-10 offset-lg-1" style="text-align: center">
                            <h2> <a style="text-decoration: none;" href="${pageContext.request.getContextPath()}/admin/list_product">Edit Promotion</a></h2>
                        </div>
                    </div>
                    <div class="row" >
                        <div class="col-lg-9 offset-lg-3">
                            <div class="contact_form_container" >
                                <f:form action="${pageContext.request.getContextPath()}/admin/update-promotion" method="post" modelAttribute="promotion" class="form-horizontal">
                                    <input name="id" value="${promotion.id}" hidden/>
                                    

                                    <div class="form-group">
                                    <label class="control-label col-sm-2">Name
                                        <span class="ui-error">(*)</span></label>
                                    <div class="col-sm-8">
                                        <input name="name" class="form-control" required
                                               value="${promotion.name}"/>
                                    </div>
                                </div>

                                
                                <div class="form-group">
                                    <label class="control-label col-sm-2">
                                        Discount </label>
                                    <div class="col-sm-8">
                                        <input type="number" name="discount" 
                                               class="form-control" value="${promotion.discount}"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-sm-2">
                                        Start Date</label>
                                    <div class="col-sm-8">
                                        <input type="date" name="startDate" 
                                               class="form-control" value="${promotion.startDate}"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-sm-2">
                                        End Date</label>
                                    <div class="col-sm-8">
                                        <input type="date" name="endDate" 
                                               class="form-control" value="${promotion.endDate}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2">
                                        Status</label>
                                    <div class="col-sm-8">
                                        <textarea type="text" name="status" 
                                                  class="form-control">${promotion.status}</textarea>
                                    </div>
                                </div>

                                            <div class="form-group">
                                                <div class="col-lg-8">
                                                    <input type="submit" class="btn btn-primary" value="Update Product" />
                                                </div>
                                            </div>
                                        </f:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>   

                </div>
                <!-- Footer -->
                <jsp:include page="../include/footer.jsp"/>
            </div>
    </body>
</html>

