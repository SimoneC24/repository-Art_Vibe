<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registrazione Art Vibe</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}\css\style-login-responsive.css">
</head>

<body>
	
	<%@include file = "navbar.jsp" %>
	
	<section class="registrazione-section">
		<div class="container">
			<div class="text-center">
				<img src="${ pageContext.request.contextPath }\img\logo.png" style="width: 185px;" alt="logo">
				<h4>We are The Art Vibe Team</h4>
			</div>

			<form>
				<div class="nome-cognome">
					<div class="nome-cognome-intern">
						<input type="text" placeholder="Inserisci il tuo nome" /> <label>Nome</label>
					</div>

					<div class="nome-cognome-intern">
						<input type="text" placeholder="Inserisci il tuo cognome" /> <label>Cognome</label>
					</div>
				</div>
				
				<div class="nome-cognome">
					<div class="nome-cognome-intern">
						<input type="text" pattern="[A-Z]{6}[0-9]{2}[A-Z][0-9]{2}[A-Z][0-9]{3}[A-Z]" placeholder="Inserisci il tuo codice fiscale"/>
						<label>Codice Fiscale</label>
					</div>
				</div>
				
				<div class="nome-cognome">
					<div class="nome-cognome-intern">
						<input type="text" placeholder="Inserisci il tuo indirizzo di spedizione"/><label>Indirizzo</label>
					</div>
				</div>

				<div class="nome-cognome">
					<div class="nome-cognome-intern">
						<input type="email" placeholder="Inserisci la tua e-mail" /><label>E-mail</label>
					</div>
				</div>

				<div class="nome-cognome">
					<div class="nome-cognome-intern">
						<input type="password" placeholder="Password" /> <label>Password</label>
					</div>
				</div>


				<div class="button-registrati">
					<a href="#" class="button">Registrati</a>
				</div>
				
				<div class="button-torna_login">
					<a href="Login-responsive.html" class="button-senza_sfondo">torna al Login</a>
				</div>

			</form>
		</div>
	</section>


	<%@include file="footer.jsp" %>
</body>
</html>
