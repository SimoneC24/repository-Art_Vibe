<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registrazione Art Vibe</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style-login-responsive.css">
    <script type= "text/javascript" src= "${ pageContext.request.contextPath }/js/validationForm.js"></script>
</head>
<body>
    <%@include file="navbar.jsp" %>
    <section class="registrazione-section">
        <div class="container">
            <div class="text-center">
                <img src="${pageContext.request.contextPath}/img/logo.png" style="width: 185px;" alt="logo">
                <h4>We are The Art Vibe Team</h4>
            </div>

            <form action="${pageContext.request.contextPath}/registrazione" method="post" onsubmit="return validate(this)">
                <div class="nome-cognome">
                    <div class="nome-cognome-intern">
                        <input type="text" name="nome" placeholder="Inserisci il tuo nome" required />
                        <label>Nome</label>
                    </div>
                    <div class="nome-cognome-intern">
                        <input type="text" name="cognome" placeholder="Inserisci il tuo cognome" required />
                        <label>Cognome</label>
                    </div>
                </div>
                
                <div class="nome-cognome">
                    <div class="nome-cognome-intern">
                        <input type="text" name="cf" placeholder="Inserisci il tuo codice fiscale" required />
                        <label>Codice Fiscale</label>
                    </div>
                </div>
                
                <div class="nome-cognome">
                    <div class="nome-cognome-intern">
                        <input type="text" name="indirizzo" placeholder="Inserisci il tuo indirizzo di spedizione" required />
                        <label>Indirizzo</label>
                    </div>
                </div>

                <div class="nome-cognome">
                    <div class="nome-cognome-intern">
                        <input type="email" name="email" placeholder="Inserisci la tua e-mail" required />
                        <label>E-mail</label>
                    </div>
                </div>

                <div class="nome-cognome">
                    <div class="nome-cognome-intern">
                        <input type="password" name="password" placeholder="Password" required />
                        <label>Password</label>
                        <div id="password-feedback"></div>
                    </div>
                </div>

                <div class="button-registrati">
                    <input type="submit" value="Registrati" class="button">
                </div>

            </form>
        </div>
    </section>
    <%@include file="footer.jsp" %>
</body>
</html>
