

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="include/header.jsp"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/blog_single_styles.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/blog_single_responsive.css"/>">
        <title>Cart</title>
    </head>

    <body>
        <div class="super_container">
            <!-- Header -->
            <header class="header">
                <!-- Top Bar -->
                <jsp:include page="include/top.jsp"/>
                <jsp:include page="include/navigation.jsp"/>
            </header>

            <div class="home">
                
                <div class="home_background parallax-window" ><img  src="<c:url value="/resources/images/blog_single_background.jpg"/>"  alt=""></div>
            </div>

            <!-- Single Blog Post -->

            <div class="single_post">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <div class="single_post_title">Vivamus sed nunc in arcu cursus mollis quis et orci. Interdum et malesuada</div>
                            <div class="single_post_text">
                                <p>Mauris viverra cursus ante laoreet eleifend. Donec vel fringilla ante. Aenean finibus velit id urna vehicula, nec maximus est sollicitudin. Praesent at tempus lectus, eleifend blandit felis. Fusce augue arcu, consequat a nisl aliquet, consectetur elementum turpis. Donec iaculis lobortis nisl, et viverra risus imperdiet eu. Etiam mollis posuere elit non sagittis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc quis arcu a magna sodales venenatis. Integer non diam sit amet magna luctus mollis ac eu nisi. In accumsan tellus ut dapibus blandit.</p>

                                <div class="single_post_quote text-center">
                                    <div class="quote_image"><img src="<c:url value="/resources/images/quote.png"/>" alt=""></div>
                                    <div class="quote_text">Quisque sagittis non ex eget vestibulum. Sed nec ultrices dui. Cras et sagittis erat. Maecenas pulvinar, turpis in dictum tincidunt, dolor nibh lacinia lacus.</div>
                                    <div class="quote_name">Liam Neeson</div>
                                </div>

                                <p>Praesent ac magna sed massa euismod congue vitae vitae risus. Nulla lorem augue, mollis non est et, eleifend elementum ante. Nunc id pharetra magna.  Praesent vel orci ornare, blandit mi sed, aliquet nisi. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. </p>
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

<script src="<c:url value="/resources/js/blog_single_custom.js"/>"></script>