<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dettagli Ordine</title>
</head>
<body>
    <h1>Dettagli Ordine</h1>
    <p>ID Ordine: ${ordine.id_ordine}</p>
    <p>Totale: ${ordine.totale}</p>
    <p>Data Ordine: ${ordine.data_ordine}</p>
    <h2>Opere Acquistate</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Nome Opera</th>
                <th>Prezzo</th>
                <th>Quantità</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="opera" items="${opereAcquistate}">
                <tr>
                    <td>${opera.nome_opera}</td>
                    <td>${opera.prezzo_opera}</td>
                    <td>${opera.quantita_opera}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="storicoOrdini.jsp">Torna Indietro</a>
</body>
</html>
