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
    position: fixed;
    top: 0;
    width: 100%;
    z-index: 1000;
    box-sizing: border-box;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Aggiunge un'ombra sottile */
    transition: background-color 0.3s ease; /* Transizione per il cambio di colore */
}

/* Stile del logo */
.logo {
    padding: 2px;
    transition: transform 0.3s ease; /* Effetto di transizione */
}

.logo:hover {
    transform: scale(1.20); /* Ingrandisce leggermente il logo al passaggio del mouse */
}

/* Stile della barra di ricerca */
.search-bar {
    flex: 1;
    display: flex;
    margin: 0 50px 0 10px;
    background-color: #fff; /* Sfondo leggermente trasparente */
    border-radius: 20px;
    padding: 5px;
}

.search-bar input[type="text"] {
    flex: 1;
    padding: 10px;
    border: none;
    border-radius: 20px;
    font-size: 16px;
    background: none;
    color: #000;
    transition: background-color 0.3s ease, border-color 0.3s ease; /* Transizioni per gli effetti */
}

.search-bar input[type="submit"] {
    padding: 10px 20px;
    background-color: #8100f4;
    border: none;
    border-radius: 20px;
    color: #fff;
    cursor: pointer;
    transition: background-color 0.3s ease; /* Transizione per il cambio di colore */
}

.search-bar input[type="text"]:focus {
    background-color: rgba(255, 255, 255, 0.1); /* Effetto di highlight al focus */
}

/* Stile dei link */
.links a {
    color: #fff;
    text-decoration: none;
    padding: 10px 15px;
    transition: color 0.3s ease, border-color 0.3s ease; /* Transizioni per il cambio di colore */
    position: relative; /* Aggiungi posizione relativa per l'effetto */
}

.links a:hover {
    color: #f0f0f0;
    border-color: #fff;
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3); /* Ombra sottile al passaggio del mouse */
}

/* Effetto per il tooltip */
.links a::before {
    content: '';
    position: absolute;
    bottom: -5px;
    left: 50%;
    transform: translateX(-50%);
    width: 0;
    height: 2px;
    background-color: #fff;
    transition: width 0.3s ease; /* Transizione per l'animazione */
}

.links a:hover::before {
    width: 100%; /* Estendi la linea sotto il link al passaggio del mouse */
}
}
</style>

<script>
function searchArtwork() {
    const query = document.getElementById("search-input").value;
    window.location.href = `<%= request.getContextPath() %>/home?search=` + encodeURIComponent(query);
}
</script>


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
            <a href="<%=homeUrl%>"> <img
                src="<%=request.getContextPath()%>/img/logo2.png" alt="Logo"
                style="width: 40px">
            </a>
        </div>
        <div class="search-bar">
            <input type="text" placeholder="Cerca il nome di un'opera..." id="search-input" onkeyup="showSuggestions(this.value)">
            <div id="suggestions" class="suggestions-box"></div>
            <input type="submit" value="Cerca" onclick="searchArtwork()">
        </div>
        <div class="links">
            <a href="<%=request.getContextPath()%>/view/login.jsp" id="login">Login</a>
            <a href="<%=request.getContextPath()%>/view/registrazione.jsp" id="registrazione">Registrati</a> 
            <% if (role != null && role.equals("admin")) { %>
                <!-- Se l'utente è admin, non mostrare questi link -->
            <% } else { %>
                <a href="<%=request.getContextPath()%>/storicoOrdini" id="ordini">Ordini</a>
                <a href="<%=request.getContextPath()%>/view/carrello.jsp" id="carrello">
                    <img src="<%=request.getContextPath()%>/img/carrello.png"
                    alt="Carrello" style="width: 25px">
                </a>
            <% } %>
        </div>
    </nav>

</body>
</html>
