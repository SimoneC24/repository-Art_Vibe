package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.OperaDAO;


@WebServlet(name = "/EliminaOperaServlet", urlPatterns = "/eliminaOpera")
public class EliminaOperaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String operaIdParam = request.getParameter("id");
        int operaId = -1;

        // Verifica se il parametro ID non è null e convertilo in intero
        if (operaIdParam != null && !operaIdParam.trim().isEmpty()) {
            try {
                operaId = Integer.parseInt(operaIdParam);
            } catch (NumberFormatException e) {
                // Se il formato del numero non è valido, invia un errore
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID Opera non valido");
                return;
            }
        } else {
            // Se il parametro ID è null o vuoto, invia un errore
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID Opera mancante");
            return;
        }

        OperaDAO operaDAO = new OperaDAO();
        
        try {
            boolean isDeleted = operaDAO.doDelete(operaId);
            if (isDeleted) {
                // Opera eliminata con successo, reindirizza alla pagina admin
                response.sendRedirect(request.getContextPath() + "/homeAdmin");
            } else {
                // Gestione dell'errore, l'opera potrebbe non esistere
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Opera non trovata");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Gestione degli errori
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Errore nel database");
        }
    }
}