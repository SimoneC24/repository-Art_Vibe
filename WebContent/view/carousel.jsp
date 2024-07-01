<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;700&display=swap">

<style type="text/css">
.item {
	width: 98%;
	height: 350px;
	margin: auto;
	margin-top: 85px;
	background-size: cover;
	background-repeat: no-repeat;
	position: relative;
}

.item .carousel-caption {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: white;
	font-size: 50px;
	text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.7);
	font-family: 'Dancing Script', cursive;
}

.owl-carousel {
	background: #00292d;;
}
</style>


<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('.owl-carousel').owlCarousel({
			loop : true,
			margin : 10,
			nav : true,
			autoplay : true,
			autoplayTimeout : 3000,
			responsive : {
				0 : {
					items : 1
				},
				600 : {
					items : 1
				},
				1000 : {
					items : 1
				}
			}
		});
	});
</script>
</head>

<body>

	<div class="owl-carousel owl-theme">
		<div class="item"
			style="background-image: url(${pageContext.request.contextPath}/img/carousel2.jpg)">
			<div class="carousel-caption">Acquista qui la tua opera</div>
		</div>
		<div class="item"
			style="background-image: url(${pageContext.request.contextPath}/img/carousel1.jpg)">
			<div class="carousel-caption">Qui puoi trovare il tuo quadro preferito</div>
		</div>
		<div class="item"
			style="background-image: url(${pageContext.request.contextPath}/img/carousel3.jpg)">
			<div class="carousel-caption">Cerca e trova la tua scultura</div>
		</div>
	</div>

</body>
</html>