package controller;

import model.OpereAcquistate;
import model.OpereAcquistateDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/dettagliOrdine")
public class DettagliOrdineServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	HttpSession session = request.getSession();
        if (session.getAttribute("role")==null) {
            request.setAttribute("message", "Pagina non accessibile agli utenti non registrati");
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/view/error.jsp");
            rd.forward(request, response);
            return;
        }
    	
        String ordineIdStr = request.getParameter("id");
        
        try {
            int ordineId = Integer.parseInt(ordineIdStr);
            System.out.println("ID dell'ordine: " + ordineId);

            OpereAcquistateDAO opereAcquistateDAO = new OpereAcquistateDAO();
            List<OpereAcquistate> opereAcquistate = opereAcquistateDAO.doRetrieveAllByOrder(ordineId);

            if (opereAcquistate == null || opereAcquistate.isEmpty()) {
                System.out.println("Nessuna opera trovata per l'ordine con ID: " + ordineId);
            } else {
                System.out.println("Opere trovate per l'ordine con ID " + ordineId + ": " + opereAcquistate.size());
            }

            request.setAttribute("opereAcquistate", opereAcquistate);
            request.getRequestDispatcher("/view/dettagliOrdine.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            handleException(request, response, "ID dell'ordine non valido");
        } catch (SQLException e) {
            handleException(request, response, "Errore durante il recupero delle opere dell'ordine");
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doGet(request, response);
    }

    private void handleException(HttpServletRequest request, HttpServletResponse response, String message)
            throws ServletException, IOException {
        request.setAttribute("message", message);
        request.getRequestDispatcher("/view/error.jsp").forward(request, response);
    }
}
