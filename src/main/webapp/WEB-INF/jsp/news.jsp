

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="include/header.jsp"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/blog_styles.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/styles/blog_responsive.css"/>">
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

         	<!-- Blog -->

	<div class="blog">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="blog_posts d-flex flex-row align-items-start justify-content-between">
						
						<!-- Blog post -->
						<div class="blog_post">
							<div class="blog_image" style="background-image:url(<c:url value="/resources/images/blog_1.jpg)"/>"></div>
							<div class="blog_text">Vivamus sed nunc in arcu cursus mollis quis et orci. Interdum et malesuada.</div>
							<div class="blog_button"><a href="${pageContext.request.getContextPath()}/news1">Continue Reading</a></div>
						</div>

						<!-- Blog post -->
						<div class="blog_post">
							<div class="blog_image" style="background-image:url(<c:url value="/resources/images/blog_2.jpg)"/>"></div>
							<div class="blog_text">Cras lobortis nisl nec libero pulvinar lacinia. Nunc sed ullamcorper massa.</div>
							<div class="blog_button"><a href="blog_single.html">Continue Reading</a></div>
						</div>

						<!-- Blog post -->
						<div class="blog_post">
							<div class="blog_image" style="background-image:url(<c:url value="/resources/images/blog_3.jpg)"/>"></div>
							<div class="blog_text">Fusce tincidunt nulla magna, ac euismod quam viverra id. Fusce eget metus feugiat</div>
							<div class="blog_button"><a href="blog_single.html">Continue Reading</a></div>
						</div>

						<!-- Blog post -->
						<div class="blog_post">
							<div class="blog_image" style="background-image:url(<c:url value="/resources/images/blog_4.jpg)"/>"></div>
							<div class="blog_text">Etiam leo nibh, consectetur nec orci et, tempus tempus ex</div>
							<div class="blog_button"><a href="blog_single.html">Continue Reading</a></div>
						</div>

						<!-- Blog post -->
						<div class="blog_post">
							<div class="blog_image" style="background-image:url(<c:url value="/resources/images/blog_5.jpg)"/>"></div>
							<div class="blog_text">Sed viverra pellentesque dictum. Aenean ligula justo, viverra in lacus porttitor</div>
							<div class="blog_button"><a href="blog_single.html">Continue Reading</a></div>
						</div>

						<!-- Blog post -->
						<div class="blog_post">
							<div class="blog_image" style="background-image:url(<c:url value="/resources/images/blog_6.jpg)"/>"></div>
							<div class="blog_text">In nisl tortor, tempus nec ex vitae, bibendum rutrum mi. Integer tempus nisi</div>
							<div class="blog_button"><a href="blog_single.html">Continue Reading</a></div>
						</div>

						<!-- Blog post -->
						<div class="blog_post">
							<div class="blog_image" style="background-image:url(<c:url value="/resources/images/blog_7.jpg)"/>"></div>
							<div class="blog_text">Make Life Easier on Yourself by Accepting “Good Enough.” Don’t Pursue Perfection.</div>
							<div class="blog_button"><a href="blog_single.html">Continue Reading</a></div>
						</div>

						<!-- Blog post -->
						<div class="blog_post">
							<div class="blog_image" style="background-image:url(<c:url value="/resources/images/blog_8.jpg)"/>"></div>
							<div class="blog_text">13 Reasons You Are Failing At Life And Becoming A Bum</div>
							<div class="blog_button"><a href="blog_single.html">Continue Reading</a></div>
						</div>

						<!-- Blog post -->
						<div class="blog_post">
							<div class="blog_image" style="background-image:url(<c:url value="/resources/images/blog_9.jpg)"/>"></div>
							<div class="blog_text">4 Steps to Getting Anything You Want In Life</div>
							<div class="blog_button"><a href="blog_single.html">Continue Reading</a></div>
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

<script src="<c:url value="/resources/js/blog_custom.js"/>"></script>