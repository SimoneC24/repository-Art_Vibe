package controller;

import model.PersonaBean;
import model.PersonaDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "RegistrazioneServlet", urlPatterns = "/registrazione")
public class RegistrazioneServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String cf = request.getParameter("cf");
        String indirizzo = request.getParameter("indirizzo");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        PersonaBean persona = new PersonaBean(cf, nome, cognome, indirizzo, email, password);
        
        PersonaDAO personaDAO = new PersonaDAO();

        try {

            personaDAO.doSave(persona);
            response.sendRedirect(request.getContextPath() + "/home");

        } catch (SQLException e) {
        	request.setAttribute("message", "Errore nell'inserimento dell'utente nel database");
	    	RequestDispatcher rd = getServletContext().getRequestDispatcher("/view/error.jsp");
	        rd.forward(request, response);
	        return;
        }
    }
}

