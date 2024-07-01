package controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;

@WebServlet("/modificaOperaServlet")
public class ModificaOperaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String idStr = request.getParameter("id");
            String prezzoStr = request.getParameter("prezzo");
            String descrizione = request.getParameter("descrizione");

            if (idStr == null || descrizione == null) {
                response.getWriter().println("ID o descrizione mancanti.");
                return;
            }

            int id = Integer.parseInt(idStr);
            double prezzo = 0.0;

            if (prezzoStr != null && !prezzoStr.trim().isEmpty()) {
                prezzo = Double.parseDouble(prezzoStr.trim());
            } else {
                OperaDAO operaDAO = new OperaDAO();
                OperaBean opera = operaDAO.doRetrieveByKey(id);

                if (opera != null) {
                    prezzo = opera.getPrezzo();
                } else {
                    response.getWriter().println("Opera non trovata o non esistente.");
                    return;
                }
            }

            OperaDAO operaDAO = new OperaDAO();
            OperaBean opera = operaDAO.doRetrieveByKey(id);

            if (opera != null) {
                opera.setPrezzo(prezzo);
                opera.setDescrizione(descrizione);
                operaDAO.doUpdate(opera);

                response.sendRedirect(request.getContextPath() + "/homeAdmin");
            } else {
                response.getWriter().println("Opera non trovata o non esistente.");
            }

        } catch (NumberFormatException e) {
            response.getWriter().println("Formato non valido per prezzo o ID.");
        } catch (SQLException e) {
            throw new ServletException("Errore durante la modifica dell'opera", e);
        }
    }


}