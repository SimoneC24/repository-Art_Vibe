<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Art Vibe</title>
    <link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/style_login.css">
    <!-- Include Font Awesome for the icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-k6RqeWeci5ZR/Lv4MR0sA0FfDOMgI7mU5IEUVqC8ZQo6S9e4cHsmqXG1jO4kXqjM" crossorigin="anonymous">
</head>

<body>
    <%@include file="navbar.jsp" %>
    <section class="section">
        <div class="left-container">
            <div class="text-center">
                <img src="${ pageContext.request.contextPath }/img/logo.png" style="width: 185px;" alt="logo">
                <h4>We are The Art Vibe Team</h4>
            </div>

            <!-- Div per visualizzare il messaggio di errore -->
            <div id="error-message" class="error-message">
                <i class="fa fa-exclamation-circle" aria-hidden="true"></i>
            </div>

            <form id="login-form" class="form" method="POST" action="${ pageContext.request.contextPath }/login">
                <p>Please login to your account</p>
                <div>
                    <input type="email" name="email" placeholder="Inserisci la tua e-mail" />
                    <label>E-mail</label>
                </div>
                <div>
                    <input type="password" name="pwd" placeholder="Inserisci la tua password" />
                    <label>Password</label>
                </div>
                <div class="button-margin">
                    <input type="submit" value="Login" class="button">
                </div>
                <div>
                    <p>Don't have an account?</p>
                </div>
                <div class="button-margin">
					<a href="${ pageContext.request.contextPath }/view/registrazione.jsp" class="button">Create new</a>
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

    <%@ include file="footer.jsp" %>

    <!-- Script per visualizzare messaggi di errore -->
    <script>
        window.onload = function() {
            var errorMessage = '<%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>';
            if (errorMessage) {
                var errorDiv = document.getElementById("error-message");
                errorDiv.innerText = errorMessage;
                errorDiv.classList.add("show"); // Aggiungi la classe per mostrare il messaggio
            }
        };
    </script>
</body>
</html>
