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


                    <!-- Contact Form -->
                    <div class="row" >
                        <div class="col-lg-9 offset-lg-3">
                            <div class="contact_form_container" >
                                <form action="${pageContext.request.getContextPath()}/user/add_product_result" method="post" modelAttribute="product" class="form-horizontal" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label  class="col-lg-8 control-label">Category_Name<span style="color: red;">*</span></label>
                                        <div class="col-lg-8">
                                            <select style="margin-left: auto" name="category.id" class="form-control">
                                                <c:forEach var="category" items="${categories}">
                                                    <c:if test="${product.category.id!=category.id}">
                                                        <option  value="${category.id}" >${category.name}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>

                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label  class="col-lg-8 control-label">Product Name<span style="color: red;">*</span></label>
                                        <div class="col-lg-8 ">
                                            <input  name="proName" type="text" required class="form-control"/>                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label  class="col-lg-8 control-label">Product Code<span style="color: red;">*</span></label>
                                        <div class="col-lg-8 ">
                                            <input name="code" type="text" required class="form-control"/>
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label  class="col-lg-8 control-label">UnitPrice <span style="color: red;">*</span></label>
                                        <div class="col-lg-8 ">
                                            <input name="unitPrice"   class="form-control" type="text"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label  class="col-lg-8 control-label">Discount<span style="color: red;">*</span></label>
                                        <div class="col-lg-8 ">
                                            <input name="discount"  class="form-control" type="text"/>                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label  class="col-lg-8 control-label">Quantity <span style="color: red;">*</span></label>
                                        <div class="col-lg-8 ">
                                            <input name="quantity"   class="form-control" type="text"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label  class="col-lg-8 control-label">Available  <span style="color: red;">*</span></label>
                                        <div class="col-lg-8 ">
                                            <input name="available"   class="form-control" type="text"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label  class="col-lg-8 control-label">Description  <span style="color: red;">*</span></label>
                                        <div class="col-lg-8 ">
                                            <input name="description" type="text" required class="form-control"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label  class="col-lg-8 control-label">Publish Date  <span style="color: red;">*</span></label>
                                        <div class="col-lg-8 ">
                                            <input name="publishDate"   type="date" class="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label  class="col-lg-8 control-label">Image  <span style="color: red;">*</span></label>
                                        <div class="col-lg-8 ">
                                            <input type="file" name="file"><br /> 
                                            <input type="file" name="file"><br /> 
                                            <input type="file" name="file"><br />                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-8">
                                            <input type="submit" class="btn btn-primary" value="Save Product" />
                                        </div>
                                    </div>
                                </form>
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

<script src="<c:url value="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"/>"></script>
<script src="<c:url value="/resources/js/contact_custom.js"/>"></script>