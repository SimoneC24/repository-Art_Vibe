package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.PersonaBean;
import model.PersonaDAO;

@WebServlet(name = "login", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("pwd");

        PersonaBean p = null;
        try {
            p = PersonaDAO.doRetriveByEmailPassword(email, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (p == null) {
            // Gestione dell'errore di autenticazione
            System.out.println("Errore di autenticazione");
            // Puoi reindirizzare a una pagina di errore o mostrare un messaggio
            response.sendRedirect(request.getContextPath() + "/view/loginError.jsp");
        } else {
            // Memorizza l'utente e il ruolo nella sessione
            HttpSession session = request.getSession();
            session.setAttribute("user", p);  // Memorizza l'oggetto utente nella sessione
            session.setAttribute("role", p.getRole());  // Memorizza il ruolo nella sessione

            // Redirigi in base al ruolo
            if ("admin".equalsIgnoreCase(p.getRole())) {
                response.sendRedirect(request.getContextPath() + "/homeAdmin");
            } else {
                response.sendRedirect(request.getContextPath() + "/home");
            }
        }
    }
}
