<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registrazione Art Vibe</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style_form.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/validationForm.js"></script>
</head>
<body>
    <%@include file="navbar.jsp" %>
    
    <section class="registrazione-section">
        <div class="container">
            <div class="text-center">
                <img src="${pageContext.request.contextPath}/img/logo.png" style="width: 185px;" alt="logo">
                <h4>We are The Art Vibe Team</h4>
            </div>

            <!-- Error message container -->
            <div id="error-message" class="error-message">
                <p id="error-message-text"></p>
            </div>

            <form id="registrationForm" action="${pageContext.request.contextPath}/registrazione" method="post" onsubmit="return validate(this)">
                <div class="nome-cognome">
                    <div class="nome-cognome-intern">
                        <input type="text" name="nome" placeholder="Inserisci il tuo nome" required />
                        <label>Nome</label>
                        <div class="error-message-field" id="error-nome"></div>
                    </div>
                    <div class="nome-cognome-intern">
                        <input type="text" name="cognome" placeholder="Inserisci il tuo cognome" required />
                        <label>Cognome</label>
                        <div class="error-message-field" id="error-cognome"></div>
                    </div>
                </div>

                <div class="nome-cognome">
                    <div class="nome-cognome-intern">
                        <input type="text" name="cf" placeholder="Inserisci il tuo codice fiscale" required />
                        <label>Codice Fiscale</label>
                        <div class="error-message-field" id="error-cf"></div>
                    </div>
                </div>

                <div class="nome-cognome">
                    <div class="nome-cognome-intern">
                        <input type="text" name="indirizzo" placeholder="Inserisci il tuo indirizzo di spedizione" required />
                        <label>Indirizzo</label>
                        <div class="error-message-field" id="error-indirizzo"></div>
                    </div>
                </div>

                <div class="nome-cognome">
                    <div class="nome-cognome-intern">
                        <input type="email" name="email" placeholder="Inserisci la tua e-mail" required />
                        <label>E-mail</label>
                        <div class="error-message-field" id="error-email"></div>
                    </div>
                </div>

                <div class="nome-cognome">
                    <div class="nome-cognome-intern">
                        <input type="password" name="password" placeholder="Password" required />
                        <label>Password</label>
                        <div class="error-message-field" id="error-password"></div>
                    </div>
                </div>

                <div class="button-registrati">
                    <input type="submit" value="Registrati" class="button">
                </div>
            </form>
        </div>
    </section>
    <%@include file="footer.jsp" %>

    <script>
        window.onload = function() {
            var errorMessage = '<%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>';
            if (errorMessage) {
                var errorMessageText = document.getElementById("error-message-text");
                errorMessageText.innerText = errorMessage;
                var errorDiv = document.getElementById("error-message");
                errorDiv.classList.add("active");
            }
        };
    </script>
</body>
</html>
