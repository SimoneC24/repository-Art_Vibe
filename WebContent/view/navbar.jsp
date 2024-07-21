<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Art Vibe</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_navbar.css">

<script>
function showSuggestions(query) {
    const suggestionsBox = document.getElementById("suggestions");
    if (query.length === 0) {
        suggestionsBox.innerHTML = "";
        suggestionsBox.style.display = "none";
        return;
    }
    
    fetch('<%=request.getContextPath()%>/autocomplete?query=' + encodeURIComponent(query))
        .then(response => response.json())
        .then(data => {
            suggestionsBox.innerHTML = "";
            
            if (data.length > 0) {
                data.forEach(item => {
                    const suggestionItem = document.createElement("div");
                    suggestionItem.className = "suggestion-item";
                    suggestionItem.innerText = item.nome;
                    suggestionItem.onclick = function() {
                        document.getElementById("search-input").value = item.nome;
                        suggestionsBox.innerHTML = "";
                        suggestionsBox.style.display = "none";
                        searchArtwork(); // Avvia la ricerca quando un suggerimento viene selezionato
                    };
                    suggestionsBox.appendChild(suggestionItem);
                });
                suggestionsBox.style.display = "block";
            } else {
                suggestionsBox.style.display = "none";
            }
        })
        .catch(error => console.error('Error fetching suggestions:', error));
}

    function searchArtwork() {
        const query = document.getElementById("search-input").value;
        window.location.href = '<%=request.getContextPath()%>/home?search=' + encodeURIComponent(query);
    }

    function logout() {
        window.location.href = '<%=request.getContextPath()%>/logout';
    }
</script>

</head>
<body>

	<nav class="navbar">
		<div class="logo">
			<%
			String role = (String) session.getAttribute("role");
			String homeUrl = request.getContextPath();
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
			<input type="text" placeholder="Cerca il nome di un'opera..."
				id="search-input" onkeyup="showSuggestions(this.value)"
				aria-label="Search Artwork">
			<div id="suggestions" class="suggestions-box"></div>
			<input type="submit" value="Cerca" onclick="searchArtwork()">
		</div>

		<div class="links">
			<a href="<%=request.getContextPath()%>/view/login.jsp" id="login">Login</a>
			<a href="<%=request.getContextPath()%>/view/registrazione.jsp"
				id="registrazione">Registrati</a>
			<%
			if (role == null || !role.equals("admin")) {
			%>
			<a href="<%=request.getContextPath()%>/storicoOrdini" id="ordini">Ordini</a>
			<a href="<%=request.getContextPath()%>/view/carrello.jsp"
				id="carrello"> <img
				src="<%=request.getContextPath()%>/img/carrello.png" alt="Carrello"
				style="width: 25px">
			</a>
			<%
			}
			%>
			<input type="button" class="logout-btn" value="Logout"
				onclick="logout()">
		</div>
	</nav>

</body>
</html>
