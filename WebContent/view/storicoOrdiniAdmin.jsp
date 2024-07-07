<%@ page import="java.util.List"%>
<%@ page import="model.OrdineBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Visualizza Ordini - Admin</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style_cart.css">
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #ffffff;
	margin: 0;
	padding: 0;
}

h1 {
	text-align: center;
	color: #333;
	margin-bottom: 20px;
}

.container {
	display: grid;
	grid-template-columns: 1fr 3fr;
	gap: 20px;
	max-width: 95%;
	margin: 80px auto;
	padding: 20px;
}

.sidebar {
	background: #f9f9f9;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.sidebar h3 {
	text-align: center;
	font-size: 1.4em;
	margin-bottom: 15px;
	color: #333;
}

.sidebar form {
	display: flex;
	flex-direction: column;
}

.sidebar form label {
	margin-bottom: 8px;
	color: #666;
	font-weight: bold;
}

.sidebar form input[type="number"], .sidebar form input[type="text"] {
	width: 90%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-bottom: 10px;
	font-size: 1em;
	color: #333;
}

.sidebar form input[type="submit"] {
	padding: 12px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	font-size: 1em;
	cursor: pointer;
	transition: background-color 0.3s ease, box-shadow 0.3s ease;
}

.sidebar form input[type="submit"]:hover {
	background-color: #0056b3;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.main-content {
	background: #ffffff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	background-color: #ffffff;
}

th, td {
	padding: 15px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #f2f2f2;
	font-weight: bold;
	color: #333;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

tr:nth-child(odd) {
	background-color: #ffffff;
}

.empty-message {
	text-align: center;
	font-style: italic;
	color: #999;
}

/* Media query per schermi più piccoli */
@media screen and (max-width: 768px) {
	.container {
		grid-template-columns: 1fr;
	}
	.sidebar {
		margin-bottom: 20px;
	}
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="container">
		<aside class="sidebar">
			<h3>Ricerca per</h3>
			<form action="${pageContext.request.contextPath}/storicoOrdiniAdmin" method="GET">

				<label for="startDate">Data Inizio:</label> 
					<input type="date" id="startDate" name="startDate"> 
				<label for="endDate">Data Fine:</label> 
					<input type="date" id="endDate" name="endDate"> 
				<label for="clientId">ID Cliente:</label> 
					<input type="text" id="clientId" name="clientId" placeholder="ID Cliente"> 
					<input type="submit" value="Cerca">
			</form>
		</aside>

		<div class="main-content">
			<h1>Storico Ordini - Admin</h1>
			<table class="cart-table">
				<thead>
					<tr>
						<th>ID Ordine</th>
						<th>Totale</th>
						<th>Data Ordine</th>
						<th>Numero Carta</th>
						<th>ID Utente</th>
						<th>Dettagli Ordine</th>
					</tr>
				</thead>
				<tbody>
					<%
					List<OrdineBean> ordini = (List<OrdineBean>) request.getAttribute("ordini");
					if (ordini != null && !ordini.isEmpty()) {
						for (OrdineBean ordine : ordini) {
					%>
					<tr>
						<td><%=ordine.getId_ordine()%></td>
						<td><%=ordine.getTotale()%> &euro;</td>
						<td><%=ordine.getData_ordine()%></td>
						<td><%=ordine.getNumero_carta()%></td>
						<td><%=ordine.getId_utente()%></td>
						<td><a href="dettagliOrdine?id=<%=ordine.getId_ordine()%>">Dettagli</a></td>
						<!-- Link per dettagli ordine -->
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="7" class="empty-message">Nessun ordine trovato.</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>
