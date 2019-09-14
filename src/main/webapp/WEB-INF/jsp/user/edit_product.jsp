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
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add product</title>
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
                            <h2> <a style="text-decoration: none;" href="${pageContext.request.getContextPath()}/user/list_product">Edit Product</a></h2>
                        </div>
                    </div>
                    <div class="row" >
                        <div class="col-lg-9 offset-lg-3">
                            <div class="contact_form_container" >
                                <f:form action="${pageContext.request.getContextPath()}/user/update-product" method="post" modelAttribute="product" class="form-horizontal">
                                    <input name="id" value="${product.id}" hidden/>
                                    <div class="form-group">
                                        <label  class="col-lg-8 control-label">Category_Name<span style="color: red;">*</span></label>
                                        <div class="col-lg-8">
                                            <select style="margin-left: auto" name="category.id" class="form-control">
                                                <c:forEach var="category" items="${categories}">
                                                    <c:if test="${product.category.id==category.id}">
                                                        <option value="${category.id}" selected>${category.name}</option>
                                                    </c:if>
                                                    <c:if test="${product.category.id!=category.id}">
                                                        <option value="${category.id}" >${category.name}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>

                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label  class="col-lg-8 control-label">Product Name<span style="color: red;">*</span></label>
                                        <div class="col-lg-8 ">
                                            <input name="proName" type="text" value="${product.proName}" required class="form-control"/>
                                        </div>

                                        <div class="form-group">
                                            <label  class="col-lg-8 control-label">Product Code<span style="color: red;">*</span></label>
                                            <div class="col-lg-8 ">
                                                <input name="code" type="text" value="${product.code}" required class="form-control"/>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <label  class="col-lg-8 control-label">UnitPrice <span style="color: red;">*</span></label>
                                            <div class="col-lg-8 ">
                                                <input name="unitPrice" value="${product.unitPrice}"  class="form-control" type="number"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label  class="col-lg-8 control-label">Discount<span style="color: red;">*</span></label>
                                            <div class="col-lg-8 ">
                                                <input name="discount" value="${product.discount}"  class="form-control" type="text"/>
                                            </div>
                                            <div class="form-group">
                                                <label  class="col-lg-8 control-label">Quantity <span style="color: red;">*</span></label>
                                                <div class="col-lg-8 ">
                                                    <input name="quantityInStore" value="${product.quantityInStore}"  class="form-control" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label  class="col-lg-8 control-label">Available  <span style="color: red;">*</span></label>
                                                <div class="col-lg-8 ">
                                                    <input name="available" value="${product.available}"  class="form-control" type="text"/>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label  class="col-lg-8 control-label">Description  <span style="color: red;">*</span></label>
                                                <div class="col-lg-8 ">
                                                    <input name="description" value="${product.description}" type="text" required class="form-control"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label  class="col-lg-8 control-label">Publish Date  <span style="color: red;">*</span></label>
                                                <div class="col-lg-8 ">
                                                    <input name="publishDate" value="${product.publishDate}"  type="date" class="form-control" />
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

