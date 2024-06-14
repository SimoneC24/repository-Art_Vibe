<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Collection"%>
<%@ page import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Home Page</title>
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

.admin-nav {
	background-color: #8100f4;
	color: white;
	padding: 15px;
	margin: auto;
	margin-top: 80px;
	margin-bottom: 20px;
	text-align: center;
	width: 98%;
}

.admin-nav a {
	color: white;
	text-decoration: none;
	font-weight: bold;
	padding: 8px;
	background: #350055;
	margin-top: 50px;
}

.admin-nav a:hover {
	color: black;
	background:#8100f4;
}
</style>

<body>
	<%@ include file="navbar.jsp"%>


	<!-- Admin Navigation Bar -->
	<div class="admin-nav">
		<a href="${pageContext.request.contextPath}/view/aggiungiOpera.jsp">Aggiungi Opera</a>
		<a href="${pageContext.request.contextPath}/view/visualizzaOrdini.jsp">Visualizza Ordini</a>
	</div>



	<!-- Main Content Section -->
	<div class="main-content">

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
				<h3><%=opera.getPrezzo()%> &euro;</h3>
				
					<input type="submit" class="button" value="Modifica">
					<input type="submit" class="button" value="Elimina">
			</div>
			<% } %>
		</section>

	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>
