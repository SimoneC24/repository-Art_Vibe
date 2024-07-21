<%@ page import="java.util.Map"%>
<%@ page import="model.Cart"%>
<%@ page import="model.OperaBean"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.util.Base64"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Carrello</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style_cart.css">
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<div class="main-content">
		<h1>Il Tuo Carrello</h1>

		<table class="cart-table">
			<thead>
				<tr>
					<th>Immagine</th>
					<th>Nome</th>
					<th>Artista</th>
					<th>Prezzo</th>
					<th>Quantit&agrave;</th>
					<th>Totale</th>
					<th>Azioni</th>
				</tr>
			</thead>
			<tbody>
				<%
				Cart cart = (Cart) session.getAttribute("cart");
				double totale = 0;
				if (cart != null && !cart.getProducts().isEmpty()) {
					for (Map.Entry<OperaBean, Integer> entry : cart.getProducts().entrySet()) { //restituisce un insieme Set di tutte coppie chiave-valore dei prodotto e quantità
						OperaBean opera = entry.getKey();
						int quantity = entry.getValue();
						double subtotale = opera.getPrezzo() * quantity;
						totale += subtotale;
				%>
				<tr>
					<td><img
						src="data:image/jpeg;base64, <%=Base64.getEncoder().encodeToString(opera.getImmagine())%>"
						alt="Opera"></td>
					<td><%=opera.getNome()%></td>
					<td><%=opera.getArtista()%></td>
					<td><%=opera.getPrezzo()%> &euro;</td>
					<td class="quantity-controls">
						<form method="POST"
							action="${pageContext.request.contextPath}/cartServlet?action=incrementa&id=<%= opera.getId() %>"
							class="cart-actions">
							<button type="submit" class="quantity-button">+</button>
						</form> <span><%=quantity%></span>
						<form method="POST"
							action="${pageContext.request.contextPath}/cartServlet?action=decrementa&id=<%= opera.getId() %>"
							class="cart-actions">
							<button type="submit" class="quantity-button">-</button>
						</form>
					</td>
					<td><%=String.format("%.2f", subtotale)%> &euro;</td>
					<td>
						<form method="POST"
							action="${pageContext.request.contextPath}/cartServlet?action=rimuovi&id=<%= opera.getId() %>"
							class="cart-actions">
							<button type="submit" class="remove">Rimuovi</button>
						</form>
					</td>
				</tr>
				<%
				}
				} else {
				%>
				<tr>
					<td colspan="7">Il carrello e' vuoto</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>

		<div class="total">
			<p>
				Totale:
				<%=String.format("%.2f", totale)%>
				&euro;
			</p>
		</div>

		<%
		if (cart != null && !cart.getProducts().isEmpty()) {
		    if (role != null) {
		%>
		<form method="POST" action="${pageContext.request.contextPath}/checkout">
			<input type="hidden" name="totale" value="<%=totale%>">
			<button type="submit" class="checkout">Continua l'acquisto</button>
		</form>
		<%
		    } else {
		%>
		<p>Per continuare l'acquisto, <a href="${pageContext.request.contextPath}/view/login.jsp">accedi al tuo account</a>.</p>
		<%
		    }
		}
		%>

		<form method="POST"
			action="${pageContext.request.contextPath}/cartServlet?action=svuota"
			onsubmit="return confirm('Sei sicuro di voler svuotare il carrello?');"
			class="svuota-cart-form">
			<button type="submit" class="svuota-cart-button">Svuota Carrello</button>
		</form>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>
