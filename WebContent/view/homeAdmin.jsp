<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Collection"%>
<%@ page import="model.*"%>
<%@ page import="java.util.Base64"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Home Page</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style_home.css">
</head>

<style>
body {
	background-color: white;
}

.artwork img {
	transition: transform 0.3s ease, box-shadow 0.3s ease, opacity 0.3s ease;
}

.artwork a:hover img {
	transform: scale(1.05);
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
	opacity: 0.9;
}

.admin-nav {
	background: linear-gradient(to right, #8100f4, #350055);
	color: white;
	padding: 15px;
	text-align: center;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	border-radius: 8px;
	margin: 80px auto 0px auto;
	max-width: 90%;
}

.admin-nav a {
	color: white;
	text-decoration: none;
	font-weight: bold;
	padding: 10px 20px; /* Spaziatura interno */
	margin: 0 10px; /* Margine esterno */
	border-radius: 4px; /* Bordi arrotondati per i link */
	transition: background-color 0.3s ease, color 0.3s ease;
	/* Transizione colore */
}

.admin-nav a:hover {
	background-color: #fff; /* Cambio di colore al passaggio del mouse */
	color: #350055; /* Testo nero */
}

.button-delete {
	background-color: red; /* Imposta il colore di sfondo a rosso */
	color: white; /* Testo bianco per contrastare il rosso di sfondo */
	border: none; /* Rimuove il bordo */
	padding: 8px 16px; /* Padding per una migliore visualizzazione */
	border-radius: 4px; /* Arrotonda gli angoli */
	cursor: pointer; /* Cambia il cursore al passaggio del mouse */
	font-weight: bold; /* Rende il testo in grassetto */
}

/* Aggiunge un effetto al passaggio del mouse per il pulsante di eliminazione */
.button-delete:hover {
	background-color: darkred;
	opacity: 0.9; /* Leggera trasparenza per dare un effetto di click */
}

.artworks-admin {
	width: 98%;
	display: flex;
	flex-wrap: wrap;
}
</style>

<body>
	<%@ include file="navbar.jsp"%>

	<!-- Admin Navigation Bar -->
	<div class="admin-nav">
		<a href="${pageContext.request.contextPath}/view/aggiungiOpera.jsp">Aggiungi
			Opera</a> <a href="${pageContext.request.contextPath}/storicoOrdiniAdmin">Storico
			Ordini</a>
	</div>

	<!-- Main Content Section -->
	<div class="main-content">

		<section class="artworks-admin">
			<%
			Collection<OperaBean> opere = (Collection<OperaBean>) request.getAttribute("opere");
			for (OperaBean opera : opere) {
			%>
			<div class="artwork">
				<a
					href="${pageContext.request.contextPath}/operaServlet?id=<%= opera.getId()%>">
					<img
					src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString(opera.getImmagine())%>"
					height="250px" alt="Opera 1">
				</a>

				<h3><%=opera.getNome()%></h3>
				<p><%=opera.getArtista()%></p>
				<h3><%=opera.getPrezzo()%>&euro;
				</h3>

				<!-- Form per la modifica -->
				<form
					action="${pageContext.request.contextPath}/view/modificaOpera.jsp"
					method="get" style="display: inline;">
					<input type="hidden" name="id" value="<%=opera.getId()%>">
					<input type="submit" class="button" value="Modifica">
				</form>

				<!-- Form per l'eliminazione -->
				<form action="${pageContext.request.contextPath}/eliminaOpera"
					method="post" style="display: inline;">
					<input type="hidden" name="id" value="<%=opera.getId()%>">
					<input type="submit" class="button-delete" value="Elimina"
						onclick="return confirm('Sei sicuro di voler eliminare questa opera? (Questa azione è irreversibile)');">
				</form>
			</div>
			<%
			}
			%>
		</section>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>