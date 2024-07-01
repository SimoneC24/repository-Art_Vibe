<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@ page import="model.OperaBean"%>
<%@ page import="model.OperaDAO"%>
<%@ page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modifica Opera</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style-login-responsive.css">
<style>
.nome-cognome-intern input[type="number"], .nome-cognome-intern textarea
	{
	width: 100%;
	padding: 10px;
	border-radius: 4px;
	border: 1px solid #ccc;
	background-color: #f9f9f9;
	color: #333;
	font-size: 16px;
	margin-bottom: 5px;
	box-sizing: border-box;
}

.nome-cognome-intern input[type="number"]:focus, .nome-cognome-intern textarea:focus
	{
	border-color: #007a8e;
	outline: none;
	box-shadow: 0 0 5px rgba(0, 122, 142, 0.5);
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<section class="registrazione-section">
		<div class="container">
			<div class="text-center">
				<img src="${pageContext.request.contextPath}/img/logo.png"
					style="width: 185px;" alt="logo">
				<h4>We are The Art Vibe Team</h4>
			</div>

			<%
			String operaId = request.getParameter("id");
			OperaBean opera = null;
			if (operaId != null && !operaId.isEmpty()) {
				try {
					int id = Integer.parseInt(operaId);
					OperaDAO operaDAO = new OperaDAO();
					opera = operaDAO.doRetrieveByKey(id);
				} catch (SQLException | NumberFormatException e) {
					e.printStackTrace();
				}
			}
			if (opera != null) {
			%>

			<!-- Form per la modifica dell'opera -->
			<form
				action="${pageContext.request.contextPath}/modificaOperaServlet"
				method="post">
				<input type="hidden" name="id" value="<%=opera.getId()%>">
				<div class="nome-cognome">
					<div class="nome-cognome-intern">
						<input type="number" name="prezzo" value="<%=opera.getPrezzo()%>" placeholder="Inserisci il prezzo dell'opera" step="0.01" /> <label>Prezzo</label>
					</div>
				</div>
				<div class="nome-cognome">
					<div class="nome-cognome-intern">
						<textarea name="descrizione" maxlength="500" placeholder="Descrizione dell'opera"><%=opera.getDescrizione()%>
            </textarea>
						<label>Descrizione</label>
					</div>
				</div>
				<div class="button-registrati">
					<input type="submit" value="Modifica opera" class="button">
				</div>
			</form>

			<%
			} else {
			%>
			<div>
				<p>Opera non trovata o non esistente.</p>
			</div>
			<%
			}
			%>
		</div>
	</section>

	<%@ include file="footer.jsp"%>
</body>
</html>