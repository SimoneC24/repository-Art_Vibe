<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.theme.default.min.css">
    
    <style type="text/css">
    	.item{ 
    		width:96%; 
    		height:400px;
    		margin: auto;
    		margin-top: 20px;
    		background-size: cover;
    		background-repeat: no-repeat;
    	}
    	
    	.owl-carousel{
    		background: linear-gradient(to bottom, black, #eee);
    	}
    	
    </style>

    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/owl.carousel.js"></script>
    
    <script type="text/javascript">
	    $( document ).ready(function() {
	    	$('.owl-carousel').owlCarousel({
	    	    loop:true,
	    	    margin:10,
	    	    nav:true,
	    	    responsive:{
	    	        0:{
	    	            items:1
	    	        },
	    	        600:{
	    	            items:1
	    	        },
	    	        1000:{
	    	            items:1
	    	        }
	    	    }
	    	})
	    });
    </script>
</head>

<body>

	<div class="owl-carousel owl-theme">
    	<div class="item" style="background-image: url(${pageContext.request.contextPath}/img/carousel1.png)" ></div>
    	<div class="item" style="background-image: url(${pageContext.request.contextPath}/img/carousel3.jpeg)" ></div>
	    <div class="item" style="background-image: url(${pageContext.request.contextPath}/img/carousel4.jpeg)" ></div>
	    <div class="item" style="background-image: url(${pageContext.request.contextPath}/img/carousel1.jpeg)" ></div>
	    <div class="item" style="background-image: url(${pageContext.request.contextPath}/img/carousel3.jpeg)" ></div>
	</div>

</body>
</html>