<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<nav class="navbar">
        <div class="logo">
            <a href="home.html">
                <img src="${ pageContext.request.contextPath }\img\logo2.png" alt="Logo" style="width: 40px">
            </a>
        </div>
        <div class="search-bar">
            <input type="text" placeholder="Cerca...">
            <button type="submit">Cerca</button>
        </div>
        <div class="links">
        	<a href="login.jsp">Login</a>
            <a href="registrazione.jsp">Registrati</a>
            <a href="favorites.html"> <img src="${ pageContext.request.contextPath }\img\preferiti.png" alt="Logo" style="width: 22px"></a>
            <a href="cart.html"> <img src="${ pageContext.request.contextPath }\img\carrello.png" alt="Logo" style="width: 22px"></a>         
        </div>
    </nav>

</body>
</html>