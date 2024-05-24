<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Collection"%>
<%@ page import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home Page</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style_home.css">
</head>

<style>
.artwork img {
	transition: transform 0.3s ease, box-shadow 0.3s ease, opacity 0.3s ease;
}

.artwork a:hover img {
	transform: scale(1.05);
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
	opacity: 0.9;
}
</style>


<body>
	<%@ include file="navbar.jsp"%>

	<%@ include file="carousel.jsp"%>

	<!-- Main Content Section -->
	<div class="main-content">

		<!-- Sidebar -->
		<aside class="sidebar">

			<h3>Ricerca per</h3>
			<ul>
				<li><a href="#">Tipo</a> <select>
						<option value="nessuno">nessuno</option>
						<option value="arte-preistorica">Arte Preistorica</option>
						<option value="arte-egizia">Arte Egizia</option>
						<option value="arte-greca">Arte Greca</option>
						<option value="arte-romana">Arte Romana</option>
						<option value="arte-bizantina">Arte Bizantina</option>
						<option value="arte-romanica">Arte Romanica</option>
						<option value="arte-gotica">Arte Gotica</option>
						<option value="umanesimo">Umanesimo</option>
						<option value="manierismo">Manierismo</option>
						<option value="barocco">Barocco</option>
						<option value="rococo">Rococò</option>
				</select></li>
				<li><a href="#">Artista</a> <select>
						<option value="nessuno">nessuno</option>
						<option value="picasso">Picasso</option>
						<option value="van-gogh">Van Gogh</option>
						<option value="leonardo">Leonardo</option>
						<option value="leonardo-da-vinci">Leonardo da Vinci</option>
						<option value="raffaello">Raffaello</option>
				</select></li>
			</ul>
		</aside>



		<section class="artworks">
			<%
			Collection<OperaBean> opere = (Collection<OperaBean>) request.getAttribute("opere");
			for (OperaBean opera : opere) {
			%>
			<div class="artwork">
				<a
					href="${pageContext.request.contextPath}/operaServlet?id=<%= opera.getId()%>">
					<img src="${pageContext.request.contextPath}/img/<%= opera.getImmagine()%>"height="250px" alt="Opera 1">
				</a>
				
				<h3><%=opera.getNome()%></h3>
				<p><%=opera.getArtista()%></p>
				<h3><%=opera.getPrezzo()%></h3>
				<button type="submit" class="button">Aggiungi al carrello</button>
			</div>
			<% } %>
		</section>

	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>
