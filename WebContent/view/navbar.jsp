<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Responsive Navbar</title>

<style>
	.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 20px;
    background: linear-gradient(to right, #007a8e, #00292d, black);
    color: #fff;
    position: fixed; /* Fissa la navbar in alto */
    top: 0; /* Allinea la navbar in cima */
    width: 100%; /* Larghezza della navbar su tutta la pagina */
    z-index: 1000; /* Porta la navbar in primo piano */
    box-sizing: border-box;
}

.search-bar {
    flex: 1;
    display: flex; /* Imposta la visualizzazione dei figli in linea */
    margin: 0 20px;
}

.search-bar input {
    flex: 1; /* Fai espandere l'input per occupare tutto lo spazio disponibile */
    padding: 8px;
    border: none;
    border-radius: 5px 0 0 5px; /* Angoli arrotondati solo a sinistra */
    font-size: 16px;
}

.search-bar button {
    padding: 8px 15px;
    background-color: #8100f4;
    border: none;
    border-radius: 0 5px 5px 0; /* Angoli arrotondati solo a destra */
    color: #fff;
    cursor: pointer;
}

.logo{
	padding: 2px;
}

.logo:hover {
    border: 1px solid #000000; /* Cambia il colore e la larghezza del bordo a tuo piacimento */
}

.links a {
    color: #fff;
    text-decoration: none;
    padding: 10px 5px 5px 5px;
}

.links a:hover {
     border: 1px solid #fff;
}
</style>

</head>
<body>

<nav class="navbar">
    <div class="logo">
        <%
            String role = (String) session.getAttribute("role");
            String homeUrl = request.getContextPath(); // Ottieni il contesto dell'applicazione
            if (role != null && role.equals("admin")) {
                homeUrl += "/homeAdmin";
            } else {
                homeUrl += "/home";
            }
        %>
        <a href="<%= homeUrl %>">
            <img src="<%= request.getContextPath() %>/img/logo2.png" alt="Logo" style="width: 40px">
        </a>
    </div>
    <div class="search-bar">
        <input type="text" placeholder="Cerca...">
        <button type="submit">Cerca</button>
    </div>
    <div class="links">
        <a href="<%= request.getContextPath() %>/view/login.jsp" id="login">Login</a>
        <a href="<%= request.getContextPath() %>/view/registrazione.jsp" id="registrazione">Registrati</a>
        <a href="<%= request.getContextPath() %>/cartServlet" id="carrello">
            <img src="<%= request.getContextPath() %>/img/carrello.png" alt="Carrello" style="width: 25px">
        </a>
    </div>
</nav>

</body>
</html>