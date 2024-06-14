<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aggiungi Opera</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/style-login-responsive.css">

<style>
/* Include the above CSS styles here */
select {
	width: 100%;
	padding: 10px;
	border-radius: 4px;
	border: 1px solid #ccc;
	background-color: #f9f9f9;
	color: #333;
	font-size: 16px;
	appearance: none;
	-webkit-appearance: none;
	-moz-appearance: none;
	background-image: url('data:image/svg+xml;charset=US-ASCII,%3Csvg xmlns%3D%22http://www.w3.org/2000/svg%22 viewBox%3D%220 0 4 5%22%3E%3Cpath fill%3D%22%23333%22 d%3D%22M2 0L0 2h4z%22/%3E%3C/svg%3E');
	background-repeat: no-repeat;
	background-position: right 10px center;
	background-size: 10px;
	margin-bottom: 5px;
	box-sizing: border-box;
}

select:focus {
	border-color: #007a8e;
	outline: none;
	box-shadow: 0 0 5px rgba(0, 122, 142, 0.5);
}

select option {
	padding: 10px;
}

</style>

<script type="text/javascript"
	src="${ pageContext.request.contextPath }/js/validationForm.js"></script>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<section class="registrazione-section">
		<div class="container">
			<div class="text-center">
				<img src="${pageContext.request.contextPath}/img/logo.png"
					style="width: 185px;" alt="logo">
				<h4>We are The Art Vibe Team</h4>
			</div>

			<form action="${pageContext.request.contextPath}/registrazione"
				method="post" onsubmit="return validate(this)">

				<div class="nome-cognome">
					<div class="nome-cognome-intern">
						<input type="text" name="nome"
							placeholder="Inserisci il titolo dell'opera" required /> <label>Nome</label>
					</div>
				</div>

				<div class="nome-cognome">
					<div class="nome-cognome-intern">
						<input type="number" name="prezzo" placeholder="Inserisci il prezzo dell'opera" step="1" required />
						<label>Prezzo</label>
					</div>
				</div>


				<div class="nome-cognome">
					<div class="nome-cognome-intern" id="selezione">
						<select name="cf" required>
							<option value="classico">Classico</option>
							<option value="rinascimentale">Rinascimentale</option>
							<option value="barocco">Barocco</option>
							<option value="neoclassico">Neoclassico</option>
							<option value="romantico">Romantico</option>
							<option value="impressionista">Impressionista</option>
							<option value="modernista">Modernista</option>
							<option value="contemporaneo">Contemporaneo</option>
						</select> <label>Stile</label>
					</div>
				</div>

				<div class="nome-cognome">
					<div class="nome-cognome-intern">
						<select name="artist" required>
							<option value="" disabled selected>Seleziona l'artista</option>
							<option value="leonardo-da-vinci">Leonardo da Vinci</option>
							<option value="michelangelo">Michelangelo</option>
							<option value="vincent-van-gogh">Vincent van Gogh</option>
							<option value="pablo-picasso">Pablo Picasso</option>
							<option value="claude-monet">Claude Monet</option>
							<option value="frida-kahlo">Frida Kahlo</option>
							<option value="salvador-dali">Salvador Dalí</option>
						</select> <label>Artista</label>
					</div>
				</div>

				<div class="nome-cognome">
					<div class="nome-cognome-intern">
						<input type="date" name="data" required /> <label>Data</label>
					</div>
				</div>

				<div class="nome-cognome">
					<div class="nome-cognome-intern">
						<input type="file" name="immagine" accept="image/*" required /> <label>Carica
							Immagine</label>
					</div>
				</div>

				<div class="nome-cognome">
					<div class="nome-cognome-intern">
						<textarea name="descrizione" placeholder="Inserisci la descrizione dell'opera (max 500 caratteri)" maxlength="500" required></textarea>
						<label>Descrizione</label>
					</div>
				</div>

				<div class="button-registrati">
					<input type="submit" value="Inserisci opera" class="button">
				</div>

			</form>
		</div>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>