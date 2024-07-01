package controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cart;
import model.OperaBean;
import model.OpereAcquistate;
import model.OpereAcquistateDAO;
import model.OrdineBean;
import model.OrdineDAO;
import model.PersonaBean;

@WebServlet(name = "completaAcquisto", urlPatterns = "/completaAcquisto")
public class CompletaAcquistoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String numero_carta = request.getParameter("cardNumber");
        String data_scadenza = request.getParameter("expiryDate");
        int cvv = Integer.parseInt(request.getParameter("cvv"));

        Date data;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDate = sdf.parse(data_scadenza);
            data = new Date(parsedDate.getTime());
        } catch (ParseException e) {
            throw new ServletException("Formato della data non valido", e);
        }

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        double totale = Double.parseDouble(request.getParameter("totale"));

        LocalDate localDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDate = localDate.format(formatter);

        Date today;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDate = sdf.parse(formattedDate);
            today = new Date(parsedDate.getTime());
        } catch (ParseException e) {
            throw new ServletException("Formato della data non valido", e);
        }

        PersonaBean utente = (PersonaBean) session.getAttribute("user");

        // Creiamo l'ordine
        OrdineBean ordine = new OrdineBean(totale, today, numero_carta, cvv, data, utente.getCf());

        OrdineDAO ordineDAO = new OrdineDAO();
        OpereAcquistateDAO opereDao = new OpereAcquistateDAO();

        int idOrdine = 0; // Variabile per memorizzare l'ID generato dall'ordine

        try {
            // Salviamo l'ordine nel database e otteniamo l'ID generato
            idOrdine = ordineDAO.doSaveInt(ordine);
            System.out.println("Generated key=" + idOrdine); // Stampa l'ID generato nella console

            // Salviamo le opere acquistate associate a questo ordine
            HashMap<OperaBean, Integer> opere = cart.getProducts();

            for (Map.Entry<OperaBean, Integer> entry : opere.entrySet()) {
                OperaBean opera = entry.getKey();
                int quantity = entry.getValue();

                OpereAcquistate operaAcquistata = new OpereAcquistate(idOrdine, opera.getNome(), opera.getPrezzo(), opera.getImmagine(), quantity);

                try {
                    opereDao.doSave(operaAcquistata);
                } catch (SQLException e) {
                    e.printStackTrace();
                    // Gestisci l'errore nel salvataggio delle opere acquistate
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Gestisci l'errore nel salvataggio dell'ordine
        }

        // Svuota il carrello
        session.removeAttribute("cart");

        // Reindirizza alla pagina del carrello
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/carrello.jsp");
        dispatcher.forward(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Eventualmente gestisci il caso in cui la servlet sia chiamata tramite GET
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }
}
