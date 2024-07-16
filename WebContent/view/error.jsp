<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Errore</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            text-align: center;
            padding: 50px;
        }
        .error-container {
            max-width: 600px;
            margin: auto;
            background-color: #fff;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #e74c3c;
            font-size: 36px;
            margin-bottom: 20px;
        }
        p {
            font-size: 18px;
            color: #333;
            line-height: 1.6;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #3498db;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        a:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>Ops! Si è verificato un errore.</h1>
 
        <p>Messaggio di errore: <strong><%= request.getAttribute("message") %></strong></p>
        <a href="<%= request.getContextPath() %>/" class="button">Torna alla Home</a>
    </div>
</body>
</html>
