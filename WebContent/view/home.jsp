<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home Page</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style_home.css">
</head>

<body>

	<%@ include file="navbar.jsp"%>

	<%@ include file="carousel.jsp"%>

	<!-- Main Content Section -->
	<div class="main-content">
	
		<!-- Sidebar -->
		<aside class="sidebar">

    <h3>Ricerca per</h3>
    <ul>
        <li>
            <a href="#">Stile</a>
            <select>
            	<option value="nessuno">nessuno</option>
                <option value="arte-preistorica">Arte Preistorica</option>
                <option value="arte-egizia">Arte Egizia</option>
                <option value="arte-greca">Arte Greca</option>
                <option value="arte-romana">Arte Romana</option>
                <option value="arte-bizantina">Arte Bizantina</option>
                <option value="arte-romanica">Arte Romanica</option>
                <option value="arte-gotica">Arte Gotica</option>
                <option value="umanesimo">Umanesimo</option>
                <option value="manierismo">Manierismo</option>
                <option value="barocco">Barocco</option>
                <option value="rococo">Rococò</option>
            </select>
        </li>
        <li>
            <a href="#">Artista</a>
            <select>
            	<option value="nessuno">nessuno</option>
                <option value="picasso">Picasso</option>
                <option value="van-gogh">Van Gogh</option>
                <option value="leonardo">Leonardo</option>
                <option value="leonardo-da-vinci">Leonardo da Vinci</option>
                <option value="raffaello">Raffaello</option>
            </select>
        </li>
        <li>
            <a href="#">Prezzo</a>
            <select>
            	<option value="nessuno">nessuno</option>
                <option value="100-1000">100-1000</option>
                <option value="1001-2000">1001-2000</option>
                <option value="2001-3000">2001-3000</option>
                <option value="3001-4000">3001-4000</option>
                <option value="4001-6000">4001-6000</option>
            </select>
        </li>
    </ul>
</aside>

		
		<!-- Artworks Display -->
		<section class="artworks">
			<div class="artwork">
				<img src="${pageContext.request.contextPath}/img/notte-stellata.jpg" width="400px" alt="Opera 1">
				<h3>La notte stellata</h3>
				<p>Van Gogh</p>
				<h3>1600,00</h3>
				<form action="aggiungi_al_carrello.jsp" method="post">
					<input type="hidden" name="opera" value="La notte stellata">
					<input type="hidden" name="artista" value="Van Gogh">
					<input type="hidden" name="prezzo" value="1600,00">
					<button type="submit"  class="button">Aggiungi al carrello</button>
				</form>
			</div>
			<div class="artwork">
				<img src="${pageContext.request.contextPath}/img/gioconda.jpg" width="400px" alt="Opera 2">
				<h3>Gioconda</h3>
				<p>Van Gogh</p>
				<h3>3100,99</h3>
				<form action="aggiungi_al_carrello.jsp" method="post">
					<input type="hidden" name="opera" value="La notte stellata">
					<input type="hidden" name="artista" value="Van Gogh">
					<input type="hidden" name="prezzo" value="1600,00">
					<button type="submit"  class="button">Aggiungi al carrello</button>
				</form>
			</div>
			<div class="artwork">
				<img src="${pageContext.request.contextPath}/img/l'ultima-cena.jpg" width="400px" alt="Opera 3">
				<h3>l'ultima cena</h3>
				<p>Van Gogh</p>
				<h3>2300,50</h3>
				<form action="aggiungi_al_carrello.jsp" method="post">
					<input type="hidden" name="opera" value="La notte stellata">
					<input type="hidden" name="artista" value="Van Gogh">
					<input type="hidden" name="prezzo" value="1600,00">
					<button type="submit"  class="button">Aggiungi al carrello</button>
				</form>
			</div>
			<!-- Aggiungi altre opere d'arte qui -->
		</section>
	</div>

	<%@ include file="footer.jsp"%>

</body>
</html>
