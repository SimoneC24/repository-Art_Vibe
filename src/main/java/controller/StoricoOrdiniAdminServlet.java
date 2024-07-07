package controller;

import model.OrdineBean;
import model.OrdineDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "storicoOrdiniAdmin", urlPatterns = "/storicoOrdiniAdmin")
public class StoricoOrdiniAdminServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        OrdineDAO ordineDAO = new OrdineDAO();
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String clientId = request.getParameter("clientId");

        try {
            List<OrdineBean> ordini;

            if ((startDate != null && !startDate.isEmpty()) || (endDate != null && !endDate.isEmpty()) || (clientId != null && !clientId.isEmpty())) {
                ordini = ordineDAO.doRetrieveByFilter(startDate, endDate, clientId);
            } else {
                ordini = ordineDAO.doRetrieveAll();
            }

            request.setAttribute("ordini", ordini);
            request.getRequestDispatcher("/view/storicoOrdiniAdmin.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().append("Errore durante il recupero degli ordini: " + e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}