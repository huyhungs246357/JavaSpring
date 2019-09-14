


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add product</title>
        <jsp:include page="../admin/header.jsp"/>
    </head>
    <body>

        <div id="wrapper">
            <jsp:include page="../admin/topmenu.jsp" />
            <div id="page-wrapper">

                <div class="row">
                    <!-- Page Header -->
                    <div class="col-lg-12">
                        <h1 class="page-header">Dashboard</h1>
                    </div>
                    <!--End Page Header -->
                </div>

                <div class="row">
                    <!-- Welcome -->
                    <div class="col-lg-12">
                        <div class="alert alert-info">
                            <i class="fa fa-folder-open"></i><b>&nbsp;Hello ! </b>Welcome Back <b>Jonny Deen </b>
                            <i class="fa  fa-pencil"></i><b>&nbsp;2,000 </b>Support Tickets Pending to Answere. nbsp;
                        </div>
                    </div>
                    <!--end  Welcome -->
                </div>
                <div class="container">
                    <div class="col-xs-12 col-sm-12" style="text-align: center">
                        <c:if test="${message!=null && message!=''}">
                            <div class="row">
                                <div class="col-sm-12">
                                    <c:if test="${status!=null && status=='success'}">
                                        <div class="alert alert-success">
                                            ${message}
                                        </div>
                                    </c:if>
                                    <c:if test="${status!=null && status=='fail'}">
                                        <div class="alert alert-danger">
                                            ${message}
                                        </div>
                                    </c:if>
                                </div>
                            </c:if>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xs-12 col-sm-12" style="text-align: center">


                            <div class="contact_form_container" >
                                <form:form action="${pageContext.request.getContextPath()}/user/addproduct-form" method="post" modelAttribute="product" class="form-horizontal" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label  class="control-label col-sm-2">Category_Name<span style="color: red;">*</span></label>
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
                                        <label  class="control-label col-sm-2">Product Name<span style="color: red;">*</span></label>
                                        <div class="col-lg-8 ">
                                            <input  name="proName" type="text" required class="form-control" />                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label  class="control-label col-sm-2">Product Code<span style="color: red;">*</span></label>
                                        <div class="col-lg-8 ">
                                            <input name="code" type="text" required class="form-control"/>
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label  class="control-label col-sm-2">UnitPrice <span style="color: red;">*</span></label>
                                        <div class="col-lg-8 ">
                                            <input name="unitPrice"   class="form-control" type="text"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label  class="control-label col-sm-2">Discount<span style="color: red;">*</span></label>
                                        <div class="col-lg-8 ">
                                            <input name="discount"  class="form-control" type="text"/>                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label  class="control-label col-sm-2">Quantity <span style="color: red;">*</span></label>
                                        <div class="col-lg-8 ">
                                            <input name="quantity"   class="form-control" type="text"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label  class="control-label col-sm-2">Available  <span style="color: red;">*</span></label>
                                        <div class="col-lg-8 ">
                                            <input name="available"   class="form-control" type="text"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label  class="control-label col-sm-2">Description  <span style="color: red;">*</span></label>
                                        <div class="col-lg-8 ">
                                            <input name="description" type="text" required class="form-control"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label  class="control-label col-sm-2">Publish Date  <span style="color: red;">*</span></label>
                                        <div class="col-lg-8 ">
                                            <input name="publishDate"   type="date" class="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label  class="control-label col-sm-2"> File to upload:  <span style="color: red;"></span></label>
                                        <div class="col-lg-8 ">
                                            <input type="file" name="file"><br />
                                        </div>
                                    </div>
                                       <div class="form-group">
                                        <label  class="control-label col-sm-2"> File to upload:  <span style="color: red;"></span></label>
                                        <div class="col-lg-8 ">
                                            <input type="file" name="file"><br />
                                        </div>
                                    </div>
                                       <div class="form-group">
                                        <label  class="control-label col-sm-2"> File to upload:  <span style="color: red;"></span></label>
                                        <div class="col-lg-8 ">
                                            <input type="file" name="file"><br />
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <div class="col-lg-8">
                                            <input type="submit" class="btn btn-primary" value="Save Product" />
                                        </div>
                                    </div>
                                </form:form>
                            </div>    
                        </div>    
                    </div>
                </div> 
            </div>

        </div>
        <jsp:include page ="../admin/footer.jsp"></jsp:include>
    </body>

</html>

