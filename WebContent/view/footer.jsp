<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${ pageContext.request.contextPath }\css\style-login-responsive.css">
	
<style>

.footer {
	position: relative;
	background: linear-gradient(to bottom, #007a8e, black);
	color: white;
	padding: 20px 0;
	text-align: center;
	width: 100%; /* Larghezza della navbar su tutta la pagina */
	box-sizing: border-box;
}

.footer-content {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.footer-section {
	display: flex;
	margin-bottom: 50px;
}

.footer-section-intern {
	flex-direction: column;
	/* Imposta la direzione dei figli come colonna */
	flex: 1; /* Assicura che i div si espandano per riempire lo spazio */
}

.footer-section ul {
	list-style: none;
	padding: 0;
	margin: 0; /* Rimuovi il margine predefinito */
}

.footer-section ul li {
	margin-bottom: 5px;
}

.footer-section ul li a {
	text-decoration: none;
	color: white;
}

.footer-section ul li a:hover {
	color: #888888;
}

#footer {
	margin-top: 20px;
	font-size: 14px;
}
</style>

</head>
<body>

	<footer class="footer">
		<div class="footer-section">
			<div class="footer-section-intern">
				<h3>Altro</h3>
				<ul>
					<li><a href="#">Chi siamo</a></li>
					<li><a href="#">Lavora con noi</a></li>
					<li><a href="#">Termini e condizioni</a></li>
					<li><a href="#">Privacy Policy</a></li>
				</ul>
			</div>

			<div class="footer-section-intern">
				<h3>Seguici su</h3>
				<ul>
					<li><a href="https://www.instagram.com/cava_simone/">Instagram</a></li>
					<li><a
						href="https://www.linkedin.com/in/simone-cava-347100279/">LinkedIn</a></li>
				</ul>
			</div>
		</div>

		<p id="footer">&copy; 2024 Art Vibe. Tutti i diritti riservati.
			Realizzato con passione da Simone Cava</p>
	</footer>

</body>
</html>