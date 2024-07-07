function checkCf(input) {
    var cf = /^[a-zA-Z]{6}[0-9]{2}[a-zA-Z][0-9]{2}[a-zA-Z][0-9]{3}[a-zA-Z]$/;
    return cf.test(input.value);
}

function checkPwd(input) {
    var pwd = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/;
    return pwd.test(input.value);
}

function checkName(input) {
    var name = /^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$/;
    return name.test(input.value);
}

function checkEmail(input) {
    var email = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    return email.test(input.value);
}

function validate(obj) {
    var valid = true;

    // Clear all error messages
    var errorMessages = document.querySelectorAll('.error-message-field');
    errorMessages.forEach(function (msg) {
        msg.innerHTML = '';
        msg.classList.remove('active');
    });

    // Validate Codice Fiscale
    var cf = document.getElementsByName("cf")[0];
    if (!checkCf(cf)) {
        valid = false;
        showError(cf, 'Campo CODICE FISCALE non corretto!', 'error-cf');
    } else {
        cf.classList.remove("error");
    }

    // Validate Nome
    var nome = document.getElementsByName("nome")[0];
    if (!checkName(nome)) {
        valid = false;
        showError(nome, 'Campo NOME non corretto!', 'error-nome');
    } else {
        nome.classList.remove("error");
    }

    // Validate Cognome
    var cognome = document.getElementsByName("cognome")[0];
    if (!checkName(cognome)) {
        valid = false;
        showError(cognome, 'Campo COGNOME non corretto!', 'error-cognome');
    } else {
        cognome.classList.remove("error");
    }

    // Validate Email
    var email = document.getElementsByName("email")[0];
    if (!checkEmail(email)) {
        valid = false;
        showError(email, 'Campo EMAIL non corretto!', 'error-email');
    } else {
        email.classList.remove("error");
    }

    // Validate Password
    var password = document.getElementsByName("password")[0];
    if (!checkPwd(password)) {
        valid = false;
        showError(password, 'Campo PASSWORD non corretto!', 'error-password');
    } else {
        password.classList.remove("error");
    }

    return valid;
}

function showError(element, message, errorId) {
    var errorElement = document.getElementById(errorId);
    errorElement.innerText = message;
    errorElement.classList.add('active');
    element.classList.add("error");
    element.classList.add("error");
}