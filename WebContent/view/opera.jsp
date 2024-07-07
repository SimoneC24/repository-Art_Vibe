<%@ page import="model.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Base64"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dettagli Opera</title>

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

.main-content {
	display: flex;
	flex-direction: column;
	flex: 1;
	justify-content: center;
	align-items: center;
}

.opera-details {
	display: flex;
	max-width: 100%;
	width: 90%;
	margin: auto;
	margin-top: 100px;
	margin-bottom: 50px;
	padding: 20px;
	background-color: #fdf5e6;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
	border-radius: 8px;
}

.opera-image {
	flex: 1;
	text-align: center;
	margin: auto;
	margin-right: 20px;
}

.opera-image img {
	max-width: 100%;
	height: 350px;
	border-radius: 8px;
}

.opera-info {
	flex: 1;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.opera-info h2 {
	font-size: 28px;
	margin-bottom: 10px;
	color: #333;
}

.opera-info p {
	margin-bottom: 10px;
	color: #555;
}

.opera-info strong {
	font-weight: bold;
	color: #000;
}

.button {
	display: inline-block;
	/* Rende il pulsante solo largo quanto necessario */
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	text-decoration: none;
	text-align: center;
	white-space: nowrap;
	padding: 10px 20px;
	background-color: #8100f4;
	margin-top: 20px;
	transition: background-color 0.3s ease, color 0.3s ease;
	max-width: 200px; /* Imposta la larghezza massima del pulsante */
	width: auto; /* Rende il pulsante largo solo quanto necessario */
	margin-left: auto;
	margin-right: auto;
}

.button:hover {
	color: black;
	background-color: white;
}

footer {
	background-color: #333;
	color: #fff;
	text-align: center;
	padding: 10px 0;
	width: 100%;
	position: relative;
	bottom: 0;
}

@media screen and (max-width: 768px) {
	.opera-details {
		flex-direction: column; /* Colonna invece di riga */
		align-items: center;
	}
	.opera-image {
		margin: 0 0 20px 0;
		/* Margine inferiore per distanziare dall'opera-info */
	}
	.opera-image img {
		width: 100%; /* Occupa l'intera larghezza del contenitore */
		max-width: none; /* Rimuove la larghezza massima fissa */
	}
	.opera-info {
		align-items: center; /* Centra il contenuto */
		text-align: center; /* Centra il testo */
	}
}
</style>
</head>


<body>

	<%@ include file="navbar.jsp"%>

	<%
OperaBean opera = (OperaBean) request.getAttribute("opera");
if (opera != null) {
%>
    <div class="main-content">
        <div class="opera-details">
            <div class="opera-image">
                <img
                    src="data:image/jpeg;base64, <%=Base64.getEncoder().encodeToString(opera.getImmagine())%>"
                    alt="<%=opera.getNome()%>">
            </div>
            <div class="opera-info">
                <h2><%=opera.getNome()%></h2>
                <p>
                    <strong>Artista:</strong>
                    <%=opera.getArtista()%></p>
                <p>
                    <strong>Stile:</strong>
                    <%=opera.getStile()%></p>
                <p>
                    <strong>Data Creazione:</strong>
                    <%=formatDate(opera.getDataCreazione())%></p>
                <p>
                    <strong>Prezzo:</strong>
                    <%=opera.getPrezzo()%>
                    &euro;
                </p>
                <p>
                    <strong>Descrizione:</strong>
                    <%=opera.getDescrizione()%></p>
                <form method="POST"
                    action="${ pageContext.request.contextPath }/cartServlet?action=aggiungi&id=<%= opera.getId()%>">
                    <input type="submit" class="button" value="Aggiungi al Carrello">
                </form>
            </div>
        </div>
    </div>
<%
} else {
%>
    <div class="main-content">
        <div class="opera-details">
            <p>L'opera non è disponibile o non esiste.</p>
        </div>
    </div>
<%
}
%>

	<%@ include file="footer.jsp"%>
</body>
</html>

<%!private String formatDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		return sdf.format(date);
	}%>
