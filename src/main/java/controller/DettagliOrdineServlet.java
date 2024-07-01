package controller;

import model.OpereAcquistate;
import model.OpereAcquistateDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/dettagliOrdine")
public class DettagliOrdineServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        String ordineIdStr = request.getParameter("id");
        int ordineId = Integer.parseInt(ordineIdStr);
        
        System.out.println("In questo momento l'ID é: "+ordineId);

        OpereAcquistateDAO opereAcquistateDAO = new OpereAcquistateDAO();

        try {
            List<OpereAcquistate> opereAcquistate = opereAcquistateDAO.doRetrieveAllByOrder(ordineId);
            if (opereAcquistate == null || opereAcquistate.isEmpty()) {
                System.out.println("Nessuna opera trovata per l'ordine con ID: " + ordineId);
            } else {
                System.out.println("Opere trovate per l'ordine con ID " + ordineId + ": " + opereAcquistate.size());
            }
            request.setAttribute("opereAcquistate", opereAcquistate);
            request.getRequestDispatcher("/view/dettagliOrdine.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().append("Errore durante il recupero delle opere: " + e.getMessage());
        }
    }
}
