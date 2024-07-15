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
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        transition: background-color 0.3s ease;
    }

    .logo {
        padding: 2px;
        transition: transform 0.3s ease;
    }

    .logo:hover {
        transform: scale(1.20);
    }

    .search-bar {
        display: flex;
        flex: 1;
        margin: 0 50px;
        background-color: #fff;
        border-radius: 20px;
        padding: 5px;
        align-items: center;
    }

    .search-bar input[type="text"] {
        flex: 1;
        padding: 10px;
        border: none;
        border-radius: 20px;
        font-size: 16px;
        background: none;
        color: #000;
        transition: background-color 0.3s ease, border-color 0.3s ease;
    }

    .search-bar input[type="text"]:focus {
        background-color: rgba(255, 255, 255, 0.1);
    }

    .search-bar input[type="submit"] {
        padding: 10px 20px;
        border: none;
        border-radius: 20px;
        color: #fff;
        cursor: pointer;
        background-color: #8100f4;
        transition: background-color 0.3s ease;
    }

    .links {
        display: flex;
        align-items: center;
    }

    .links a, .links input[type="button"] {
        color: #fff;
        text-decoration: none;
        padding: 10px 15px;
        transition: color 0.3s ease, border-color 0.3s ease;
        position: relative;
    }

    .links a:hover, .links input[type="button"]:hover {
        color: #f0f0f0;
        border-color: #fff;
        text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
    }

    .links a::before {
        content: '';
        position: absolute;
        bottom: -5px;
        left: 50%;
        transform: translateX(-50%);
        width: 0;
        height: 2px;
        background-color: #fff;
        transition: width 0.3s ease;
    }

    .links a:hover::before {
        width: 100%;
    }

    .logout-btn {
        background-color: #f40000;
        border: none;
        border-radius: 20px;
        padding: 10px 20px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        margin-left: 10px;
    }

    .logout-btn:hover {
        background-color: #c00000;
    }

    @media (max-width: 768px) {
        .navbar {
            flex-direction: column;
        }

        .search-bar {
            margin: 10px 0;
        }

        .links {
            flex-direction: column;
        }

        .links a, .links input[type="button"] {
            padding: 5px 0;
        }
    }
</style>

<script>
    function searchArtwork() {
        const query = document.getElementById("search-input").value;
        window.location.href = `<%= request.getContextPath() %>/home?search=` + encodeURIComponent(query);
    }

    function logout() {
        window.location.href = `<%= request.getContextPath() %>/logout`;
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
        <a href="<%=homeUrl%>">
            <img src="<%=request.getContextPath()%>/img/logo2.png" alt="Logo" style="width: 40px">
        </a>
    </div>

    <div class="search-bar">
        <input type="text" placeholder="Cerca il nome di un'opera..." id="search-input" onkeyup="showSuggestions(this.value)" aria-label="Search Artwork">
        <div id="suggestions" class="suggestions-box"></div>
        <input type="submit" value="Cerca" onclick="searchArtwork()">
    </div>

    <div class="links">
        
        <a href="<%=request.getContextPath()%>/view/login.jsp" id="login">Login</a>
        <a href="<%=request.getContextPath()%>/view/registrazione.jsp" id="registrazione">Registrati</a> 
        <% if (role == null || !role.equals("admin")) { %>
            <a href="<%=request.getContextPath()%>/storicoOrdini" id="ordini">Ordini</a>
            <a href="<%=request.getContextPath()%>/view/carrello.jsp" id="carrello">
                <img src="<%=request.getContextPath()%>/img/carrello.png" alt="Carrello" style="width: 25px">
            </a>
        <% } %>
        <input type="button" class="logout-btn" value="Logout" onclick="logout()">
    </div>
</nav>

</body>
</html>
