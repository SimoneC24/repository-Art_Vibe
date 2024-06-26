<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Checkout</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style_checkout.css">
</head>

<body>
    <%@ include file="navbar.jsp"%>

    <div class="main-content">
        <h1>Completa il tuo acquisto</h1>

        <form method="POST" action="${pageContext.request.contextPath}/processPaymentServlet" class="checkout-form">
            <fieldset>
                <legend>Informazioni di Pagamento</legend>

                <label for="card-number">Numero di Carta:</label>
                <input type="text" id="card-number" name="cardNumber" required placeholder="1234 5678 9012 3456">

                <div class="card-details">
                    <div>
                        <label for="expiry-date">Data di Scadenza:</label>
                        <input type="text" id="expiry-date" name="expiryDate" required placeholder="MM/AA">
                    </div>
                    <div>
                        <label for="cvv">CVV:</label>
                        <input type="text" id="cvv" name="cvv" required placeholder="123">
                    </div>
                </div>
            </fieldset>


            <fieldset>
                <legend>Indirizzo di Spedizione</legend>

                <label for="full-name">Nome Completo:</label>
                <input type="text" id="full-name" name="fullName" required placeholder="Mario Rossi">

                <label for="address">Indirizzo:</label>
                <input type="text" id="address" name="address" required placeholder="Via Roma, 123">

                <label for="city">Città:</label>
                <input type="text" id="city" name="city" required placeholder="Roma">

                <label for="postal-code">CAP:</label>
                <input type="text" id="postal-code" name="postalCode" required placeholder="00100">

                <label for="country">Paese:</label>
                <input type="text" id="country" name="country" required placeholder="Italia">
            </fieldset>

            <div class="checkout-summary">
                <p>Totale da pagare: <strong>&euro; <%= session.getAttribute("totale") %></strong></p>
            </div>
            
            <div class="button-container">
                <button type="submit" class="button">Completa l'acquisto</button>
            </div>
        </form>
    </div>

    <%@ include file="footer.jsp"%>
</body>
</html>
