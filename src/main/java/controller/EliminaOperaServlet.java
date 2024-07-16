package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.OperaDAO;

@WebServlet(name = "EliminaOperaServlet", urlPatterns = "/eliminaOpera")
public class EliminaOperaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	HttpSession session = request.getSession();
    	if (session.getAttribute("role") == null || !session.getAttribute("role").equals("admin")) {
            request.setAttribute("message", "Pagina eccessibile solo agli admin");
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/view/error.jsp");
            rd.forward(request, response);
            return;
        }
    	
        String operaIdParam = request.getParameter("id");
        int operaId = -1;

        // Verifica se il parametro ID non è null e convertilo in intero
        if (operaIdParam != null && !operaIdParam.trim().isEmpty()) {
            try {
                operaId = Integer.parseInt(operaIdParam);
            } catch (NumberFormatException e) {
                // Se il formato del numero non è valido, gestisci l'errore
                handleException(request, response, "ID Opera non valido");
                return;
            }
        } else {
            // Se il parametro ID è null o vuoto, gestisci l'errore
            handleException(request, response, "ID Opera mancante");
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
                handleException(request, response, "Opera non trovata");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            handleException(request, response,"Errore nel database");
        }
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    private void handleException(HttpServletRequest request, HttpServletResponse response, String message)
            throws ServletException, IOException {
        request.setAttribute("message", message);
        request.getRequestDispatcher("/view/error.jsp").forward(request, response);
    }
}
