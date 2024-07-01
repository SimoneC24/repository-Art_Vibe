<%@ page import="java.util.List" %>
<%@ page import="model.OpereAcquistate" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dettagli Ordine</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style_cart.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 20px;
        }

        .main-content {
            margin-bottom: 200px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
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

        .opera-image {
            max-width: 100px; /* Imposta la larghezza massima dell'immagine */
            max-height: 100px; /* Imposta l'altezza massima dell'immagine */
        }
    </style>
</head>
<body>
    <%@ include file="navbar.jsp"%>
    <div class="main-content">
        <h1>Dettagli Ordine</h1>

        <table class="cart-table">
            <thead>
                <tr>
                    <th>Nome Opera</th>
                    <th>Prezzo</th>
                    <th>Quantità</th>
                    <th>Immagine</th>
                </tr>
            </thead>
            <tbody>
                <%
                List<OpereAcquistate> opereAcquistate = (List<OpereAcquistate>) request.getAttribute("opereAcquistate");
                if (opereAcquistate != null && !opereAcquistate.isEmpty()) {
                    for (OpereAcquistate opera : opereAcquistate) {
                %>
                <tr>
                    <td><%=opera.getNome_opera()%></td>
                    <td><%=opera.getPrezzo_opera()%> &euro;</td>
                    <td><%=opera.getQuantita_opera()%></td>
                    <td><img src="data:image/jpeg;base64,<%=opera.getImmagineBase64()%>" class="opera-image" alt="Immagine Opera"></td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="5" class="empty-message">Nessuna opera trovata per questo ordine.</td>
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
