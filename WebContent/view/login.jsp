<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta charset="UTF-8">
<title>Login Art Vibe</title>
<link rel="stylesheet" type="text/css" href="style-login-responsive.css">
</head>

<body>

	<section class="login-section">

		<div class="left-container">
			<div class="text-center">
				<img src="${ pageContext.request.contextPath }\img\Logo_ArtVibe.png" style="width: 185px;" alt="logo">
				<h4>We are The Art Vibe Team</h4>
			</div>

			<form method="POST" action="${ pageContext.request.contextPath }/login">
				<p>Please login to your account</p>
				<div>
					<input type="email" name="username" placeholder="Phone number or email address" />
					<label>Username</label>
				</div>

				<div>
					<input type="password" name="pwd" placeholder="Password" /> <label>Password</label>
				</div>

				<div class="button-margin">
					<input type="submit" value="Login" class="button">
				</div>

				<div>
					<p>Don't have an account?</p>
				</div>

				<div class="button-margin">
					<a href="registrazione-responsive.html" class="button">Create new</a>
				</div>

			</form>
		</div>

		<div class="right-container">
			<div class="intern-right-container">
				<h3>Molto più di una galleria d'arte</h3>
				<p>Siamo impegnati a celebrare l'estetica e l'espressione
					creativa attraverso le opere d'arte più straordinarie. Ogni pezzo
					che presentiamo incarna la passione e la visione dei talentuosi
					artisti che collaborano con noi. Le opere d'arte che offriamo sono
					un viaggio attraverso l'animo umano, catturando emozioni,
					raccontando storie e ispirando riflessioni profonde. Con un impegno
					verso l'eccellenza e l'autenticità, ci sforziamo di offrire
					un'esperienza unica nel mondo dell'arte, dove ogni visita al nostro
					sito è un invito a esplorare il meraviglioso e variegato universo
					dell'espressione artistica.</p>
			</div>
		</div>
	</section>

	<footer class="footer">
		<div class="footer-section">
			<div class="footer-section-intern">
				<h3>Altro</h3>
				<ul>
					<li><a href="#">Chi siamo</a></li>
					<li><a href="#">Lavora con noi</a></li>
					<li><a href="#">Termini e condizioni</a></li>
					<li><a href="#">Privacy Policy</a></li>
				</ul>
			</div>

			<div class="footer-section-intern">
				<h3>Seguici su</h3>
				<ul>
					<li><a href="https://www.instagram.com/cava_simone/">Instagram</a></li>
					<li><a
						href="https://www.linkedin.com/in/simone-cava-347100279/">LinkedIn</a></li>
				</ul>
			</div>
		</div>

		<p id="footer">&copy; 2024 Art Vibe. Tutti i diritti riservati.
			Realizzato con passione da Simone Cava</p>
	</footer>
</body>
</html>