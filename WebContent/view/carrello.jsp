<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Collection"%>
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

        <table>
            <thead>
                <tr>
                    <th>Immagine</th>
                    <th>Nome</th>
                    <th>Artista</th>
                    <th>Prezzo</th>
                </tr>
            </thead>
            <tbody>
                <%
                Collection<OperaBean> carrello = (Collection<OperaBean>) session.getAttribute("carrello");
                double totale = 0;
                if (carrello != null && !carrello.isEmpty()) {
                    for (OperaBean opera : carrello) {
                        totale += opera.getPrezzo();
                %>
                <tr>
                    <td><img src="${pageContext.request.contextPath}/img/<%= opera.getImmagine()%>" height="100px" alt="Opera"></td>
                    <td><%= opera.getNome()%></td>
                    <td><%= opera.getArtista()%></td>
                    <td><%= opera.getPrezzo()%> &euro;</td>
                </tr>
                <% 
                    }
                } else {
                %>
                <tr>
                    <td colspan="4">Il carrello è vuoto</td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <div class="total">
            <p>Totale: <%= totale %> &euro;</p>
        </div>

        <form method="POST" action="${ pageContext.request.contextPath }/acquistoServlet">
            <input type="hidden" name="totale" value="<%= totale %>">
            <input type="submit" class="button" value="Acquista">
        </form>
    </div>

    <%@ include file="footer.jsp"%>
</body>
</html>
