<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Collection"%>
<%@ page import="java.util.*"%>
<%@ page import="model.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrello</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style_cart.css">
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
                    <th>Quantità</th>
                    <th>Totale</th>
                    <th>Azioni</th>
                </tr>
            </thead>
            <tbody>
                <%
                Cart cart = (Cart) session.getAttribute("cart");
                double totale = 0;
                if (cart != null && !cart.getProducts().isEmpty()) {
                    for (Map.Entry<OperaBean, Integer> entry : cart.getProducts().entrySet()) {
                        OperaBean opera = entry.getKey();
                        int quantity = entry.getValue();
                        double subtotale = opera.getPrezzo() * quantity;
                        totale += subtotale;
                %>
                <tr>
                    <td><img src="${pageContext.request.contextPath}/img/<%= opera.getImmagine() %>" alt="Opera"></td>
                    <td><%=opera.getNome()%></td>
                    <td><%=opera.getArtista()%></td>
                    <td><%=opera.getPrezzo()%> &euro;</td>
                    <td class="quantity-controls">
                        <form method="POST" action="${pageContext.request.contextPath}/cartServlet?action=incrementa&id=<%= opera.getId() %>" class="cart-actions">
                            <button type="submit" class="quantity-button">+</button>
                        </form>
                        <span><%=quantity%></span>
                        <form method="POST" action="${pageContext.request.contextPath}/cartServlet?action=decrementa&id=<%= opera.getId() %>" class="cart-actions">
                            <button type="submit" class="quantity-button">-</button>
                        </form>
                    </td>
                    <td><%=subtotale%> &euro;</td>
                    <td>
                        <form method="POST" action="${pageContext.request.contextPath}/cartServlet?action=rimuovi&id=<%= opera.getId() %>" class="cart-actions">
                            <button type="submit" class="remove">Rimuovi</button>
                        </form>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="7">Il carrello è vuoto</td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>

        <div class="total">
            <p>Totale: <%=totale%> &euro;</p>
        </div>

         <form method="POST" action="${pageContext.request.contextPath}/checkout">
            <input type="hidden" name="totale" value="<%=totale%>">
            <button type="submit" class="checkout">Continua l'acquisto</button>
        </form>
    </div>

    <%@ include file="footer.jsp"%>
</body>
</html>
