<%@ page import="java.util.List" %>
<%@ page import="model.OrdineBean" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Visualizza Ordini</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style_cart.css">
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
}

h1 {
    text-align: center;
    color: #333;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    margin-bottom: 100px;
}

th, td {
    padding: 10px;
    text-align: left;
    border: 1px solid #ccc;
}

th {
    background-color: #f2f2f2;
    font-weight: bold;
}

tr:nth-child(even) {
    background-color: #fff;
}

tr:nth-child(odd) {
    background-color: #f2f2f2;
}

.empty-message {
    text-align: center;
    font-style: italic;
    color: #999;
}
</style>
</head>
<body>
    <%@ include file="navbar.jsp"%>
    <div class="main-content">
        <h1>Ordini Effettuati</h1>

        <table class="cart-table">
            <thead>
                <tr>
                    <th>ID Ordine</th>
                    <th>Totale</th>
                    <th>Data Ordine</th>
                    <th>Numero Carta</th>
                    <th>Data Scadenza Carta</th>
                    <th>Dettagli Ordini</th>
                </tr>
            </thead>
            <tbody>
                <%
                List<OrdineBean> ordini = (List<OrdineBean>) request.getAttribute("ordini");
                if (ordini != null && !ordini.isEmpty()) {
                    for (OrdineBean ordine : ordini) {
                %>
                <tr>
                    <td><%= ordine.getId_ordine() %></td>
                    <td><%= ordine.getTotale() %> &euro;</td>
                    <td><%= ordine.getData_ordine() %></td>
                    <td><%= ordine.getNumero_carta() %></td>
                    <td><%= ordine.getData_scadenza_carta() %></td>
                    <td><a href="dettagliOrdine?id=<%= ordine.getId_ordine() %>">Dettagli</a></td> <!-- Link per dettagli ordine -->
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="6" class="empty-message">Nessun ordine trovato.</td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </div>
    
    <%@ include file="footer.jsp"%>
</body>
</html>
