

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="<c:url value="/webjars/bootstrap/3.4.1/css/bootstrap.min.css"/>" 
              type="text/css" rel="stylesheet"/>
        <style>
            .ui-error{
                color: red;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-12" style="text-align: center">
                    <h2>Product Form</h2>
                </div>
            </div>

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
                </div>
            </c:if>

            <div class="row">
                <div class="col-sm-12">
                    <form:form action="${pageContext.request.contextPath}/${action}" method="post" 
                               modelAttribute="productEntity" class="form-horizontal">
                                                <c:if test="${action=='update-product'}">
                            <input name="id" value="${productEntity.id}" hidden />
                            <input name="productEntity.id" 
                                   value="${productEntity.id}" hidden />
                        </c:if>

                       

                        <div class="form-group">
                            <label class="control-label col-sm-2">ProName
                                <span class="ui-error">(*)</span></label>
                            <div class="col-sm-8">
                                <input name="proName" class="form-control" required
                                       value="${productEntity.proName}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-2">
                                Price </label>
                            <div class="col-sm-8">
                                <input type="number" name="unitPrice" 
                                       class="form-control" value="${productEntity.price}"/>
                            </div>
                        </div>

                       
                        <div class="form-group">
                            <label class="control-label col-sm-2">
                                Description</label>
                            <div class="col-sm-8">
                                <textarea name="description" 
                                          class="form-control">${productEntity.description}</textarea>
                            </div>
                        </div>
                    
                            
                            
                            
                            
                        <div class="form-group" style="text-align: center">
                            <button class="btn btn-primary" 
                                    type="submit">Submit</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </body>
</html>
