<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aggiungi Opera</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style_form.css">

<style>
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



</head>
<body>
    <%@include file="navbar.jsp"%>

    <section class="registrazione-section">
        <div class="container">
            <div class="text-center">
                <img src="${pageContext.request.contextPath}/img/logo.png" style="width: 185px;" alt="logo">
                <h4>We are The Art Vibe Team</h4>
            </div>

         
            <form action="${pageContext.request.contextPath}/aggiungiOpera" method="post" enctype="multipart/form-data">
                <div class="nome-cognome">
                    <div class="nome-cognome-intern">
                        <input type="text" name="nome" placeholder="Inserisci il titolo dell'opera" required /> 
                        <label>Nome</label>
                    </div>
                </div>

                <div class="nome-cognome">
                    <div class="nome-cognome-intern">
                        <input type="number" name="prezzo" placeholder="Inserisci il prezzo dell'opera" step="0.01" required />
                        <label>Prezzo</label>
                    </div>
                </div>

                <div class="nome-cognome">
                    <div class="nome-cognome-intern">
                        <select name="stile" required>
                            <option value="Arte Preistorica">Arte Preistorica</option>
                            <option value="Arte Egizia">Arte Egizia</option>
                            <option value="Arte Greca Classica">Arte Greca Classica</option>
                            <option value="Arte Romana">Arte Romana</option>
                            <option value="Arte Bizantina">Arte Bizantina</option>
                            <option value="Romanico">Romanico</option>
                            <option value="Gotico">Gotico</option>
                            <option value="Rinascimento">Rinascimento</option>
                            <option value="Modernismo">Modernismo</option>
                            <option value="Manierismo">Manierismo</option>
                            <option value="Barocco">Barocco</option>
                            <option value="Rococò">Rococò</option>
                            <option value="Neoclassicismo">Neoclassicismo</option>
                            <option value="Romanticismo">Romanticismo</option>
                            <option value="Realismo">Realismo</option>
                            <option value="Impressionismo">Impressionismo</option>
                            <option value="Post Impressionismo">Post-Impressionismo</option>
                            <option value="Simbolismo">Simbolismo</option>
                            <option value="Art Nouveau">Art Nouveau</option>
                            <option value="Fauvismo">Fauvismo</option>
                            <option value="Espressinismo">Espressionismo</option>
                            <option value="Cubismo">Cubismo</option>
                            <option value="Futurismo">Futurismo</option>
                            <option value="Dedaismo">Dadaismo</option>
                            <option value="Surrealismo">Surrealismo</option>
                            <option value="De Stijl">De Stijl</option>
                            <option value="Astrattismo">Astrattismo</option>
                            <option value="Arte Concettuale">Arte Concettuale</option>
                            <option value="Arte ellenistica">Arte ellenistica</option>
                            <option value="Minimalismo">Minimalismo</option>
                            <option value="Primitivismo Nordico">Primitivismo nordico</option>
                            <option value="Pop Art">Pop Art</option>
                            <option value="Arte Povera">Arte Povera</option>
                            <option value="Transavanguardia">Transavanguardia</option>
                            <option value="Street Art">Street Art</option>
                            <option value="Fotorealismo">Fotorealismo</option>
                            <option value="Arte Digitale">Arte Digitale</option>
                            <option value="Arte Interattiva">Arte Interattiva</option>
                            <option value="Ukiyo-e">Ukiyo-e</option>
                        </select>
                        <label>Stile</label>
                    </div>
                </div>

                <div class="nome-cognome">
                    <div class="nome-cognome-intern">
                        <input type="text" name="artista" placeholder="Inserisci l'auotore dell'opera" required /> 
                        <label>Artista</label>
                    </div>
                </div>

                <div class="nome-cognome">
                    <div class="nome-cognome-intern">
                        <input type="date" name="data" required /> 
                        <label>Data</label>
                    </div>
                </div>

                <div class="nome-cognome">
                    <div class="nome-cognome-intern">
                        <input type="file" name="immagine" accept="image/*" required /> 
                        <label>Carica Immagine</label>
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