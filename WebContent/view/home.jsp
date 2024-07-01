<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Collection"%>
<%@ page import="model.*"%>
<%@ page import="java.util.Base64"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home Page</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style_home.css">
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
			<form action="${pageContext.request.contextPath}/home" method="GET">
				<label for="minPrice">Prezzo Minimo:</label> <input type="number"
					id="minPrice" name="minPrice" min="0" step="0.01" placeholder="Min">

				<label for="maxPrice">Prezzo Massimo:</label> <input type="number"
					id="maxPrice" name="maxPrice" min="0" step="0.01" placeholder="Max">

				<label for="artistName">Artista:</label> <input type="text"
					id="artistName" name="artistName" placeholder="Nome artista">

				<input type="submit" value="Cerca">
			</form>
		</aside>



		<section class="artworks">
			<%
			Collection<OperaBean> opere = (Collection<OperaBean>) request.getAttribute("opere");
			if (opere != null && !opere.isEmpty()) {
				for (OperaBean opera : opere) {
			%>
			<div class="artwork">
				<a
					href="${pageContext.request.contextPath}/operaServlet?id=<%= opera.getId() %>">
					<img
					src="data:image/jpeg;base64, <%=Base64.getEncoder().encodeToString(opera.getImmagine())%>"
					height="250px" alt="Opera">
				</a>
				<h3><%=opera.getNome()%></h3>
				<p><%=opera.getArtista()%></p>
				<h3><%=opera.getPrezzo()%>
					&euro;
				</h3>
				<form method="POST"
					action="${ pageContext.request.contextPath }/cartServlet?action=aggiungi&id=<%= opera.getId() %>">
					<input type="submit" class="button" value="Aggiungi al Carrello">
				</form>
			</div>
			<%
			}
			} else {
			%>
			<p id="no-result">Nessuna opera trovata.</p>
			<%
			}
			%>
		</section>

	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>
