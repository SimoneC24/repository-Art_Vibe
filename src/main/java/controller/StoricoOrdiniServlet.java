package controller;

import model.OrdineBean;
import model.OrdineDAO;
import model.PersonaBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/storicoOrdini")
public class StoricoOrdiniServlet extends HttpServlet {
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        HttpSession session = request.getSession();
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("view/login.jsp");
            return;
        }

        PersonaBean utente = (PersonaBean) session.getAttribute("user");
        String id_utente = utente.getCf();
        OrdineDAO ordineDAO = new OrdineDAO();

        try {
            List<OrdineBean> ordini = ordineDAO.doRetrieveAllByUser(id_utente);
            if (ordini == null || ordini.isEmpty()) {
                System.out.println("Nessun ordine trovato per l'utente con CF: " + id_utente);
            } else {
                System.out.println("Ordini trovati: " + ordini.size());
            }
            request.setAttribute("ordini", ordini);
            request.getRequestDispatcher("/view/storicoOrdini.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().append("Errore durante il recupero degli ordini: " + e.getMessage());
        }
    }
}

