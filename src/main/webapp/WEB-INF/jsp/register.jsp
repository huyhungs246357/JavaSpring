

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
        <title>Register</title>
    </head>

    <body style=" background-repeat: no-repeat; background-attachment: fixed; background-position: center; background-image: url(<c:url value="/resources/images/banner_background.jpg)"/>"; >
        <div class="super_container">
            <!-- Header -->
            <header class="header">
                <!-- Top Bar -->
                <jsp:include page="include/top.jsp"/>
            
            </header>

            <div class="contact_form">
                <div class="container">
                    <div class="col-lg-8 offset-lg-4"  >
                        <div class="row">
                            <div class="contact_form_title" style="color: blue; margin-top: -5%"> Please fill your information</div>
                        </div>
                    </div>

                    <!-- Contact Form -->


                    <div class="row" >
                        <div class="col-lg-9 offset-lg-3">
                            <div class="contact_form_container" >
<!--                                 <div  class="contact_form_title" style="margin-bottom: 1%;margin-left: 1.5%;" >Please fill your information</div>-->
                                <f:form action="${pageContext.request.getContextPath()}/register_success" method="post" modelAttribute="user" class="form-horizontal">
                                    <div class="form-group">
                                        <label  class="col-lg-8 control-label">Username<span style="color: red;">*</span></label>
                                        <div class="col-lg-8">
                                            <input name="username" type="text" required class="form-control"/>

                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label  class="col-lg-8 control-label">Password<span style="color: red;">*</span></label>
                                        <div class="col-lg-8 ">
                                            <input name="password" type="password" required class="form-control"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label  class="col-lg-8 control-label">Email<span style="color: red;">*</span></label>
                                        <div class="col-lg-8 ">
                                            <input name="guest.email" type="email" required class="form-control"/>
                                        </div>
                                    </div>
                                    
                                   
                                    <div class="form-group">
                                        <label  class="col-lg-8 control-label">Full Name<span style="color: red;">*</span></label>
                                        <div class="col-lg-8 ">
                                            <input name="guest.fullName" type="text" required class="form-control"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label  class="col-lg-8 control-label">Address<span style="color: red;">*</span></label>
                                        <div class="col-lg-8 ">
                                            <input name="guest.address" type="text" required class="form-control"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label  class="col-lg-8 control-label">Phone Number<span style="color: red;">*</span></label>
                                        <div class="col-lg-8 ">
                                            <input name="guest.phoneNumber" type="text" required class="form-control"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label  class="col-lg-8 control-label">Birth Date <span style="color: red;">*</span></label>
                                        <div class="col-lg-8 ">
                                            <input name="guest.birthDate" type="date" required class="form-control"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-8">
                                            <button type="submit" class="btn btn-primary btn-large">Submit</button>
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
        <jsp:include page="include/footer.jsp"/>
    </div>
</body>

</html>

<script src="<c:url value="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"/>"></script>
<script src="<c:url value="/resources/js/contact_custom.js"/>"></script>