package controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
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
        // Otteniamo i dati di input
        String numero_carta = request.getParameter("cardNumber");
        String data_scadenza = request.getParameter("expiryDate");
        String cvvString = request.getParameter("cvv");

        // Rimuoviamo gli spazi dal numero della carta
        numero_carta = numero_carta.replace(" ", "");

        // Converto il CVV da stringa a intero
        int cvv;
        try {
            cvv = Integer.parseInt(cvvString);
        } catch (NumberFormatException e) {
            throw new ServletException("Formato del CVV non valido", e);
        }

        // Parsing della data di scadenza (MM/AA)
        Date dataScadenza;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("MM/yy");
            java.util.Date parsedDate = sdf.parse(data_scadenza);
            dataScadenza = new Date(parsedDate.getTime());
        } catch (ParseException e) {
            throw new ServletException("Formato della data di scadenza non valido", e);
        }

        // Ottenere il carrello e altri dati di sessione
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        double totale = Double.parseDouble(request.getParameter("totale"));

        // Ottenere la data di oggi
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

        // Ottenere l'utente dalla sessione
        PersonaBean utente = (PersonaBean) session.getAttribute("user");

        // Creare e salvare l'ordine
        OrdineBean ordine = new OrdineBean(totale, today, numero_carta, cvv, dataScadenza, utente.getCf());
        OrdineDAO ordineDAO = new OrdineDAO();
        OpereAcquistateDAO opereDao = new OpereAcquistateDAO();
        int idOrdine = 0;

        try {
            // Salvare l'ordine nel database e ottenere l'ID generato
            idOrdine = ordineDAO.doSaveInt(ordine);
            System.out.println("Generated key=" + idOrdine);

            // Salvare le opere acquistate
            HashMap<OperaBean, Integer> opere = cart.getProducts();
            for (Map.Entry<OperaBean, Integer> entry : opere.entrySet()) {
                OperaBean opera = entry.getKey();
                int quantity = entry.getValue();
                OpereAcquistate operaAcquistata = new OpereAcquistate(idOrdine, opera.getNome(), opera.getPrezzo(), opera.getImmagine(), quantity);

                try {
                    opereDao.doSave(operaAcquistata);
                } catch (SQLException e) {
                    e.printStackTrace();
                    // Gestire l'errore nel salvataggio delle opere acquistate
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Gestire l'errore nel salvataggio dell'ordine
        }

        // Svuotare il carrello
        session.removeAttribute("cart");

        // Reindirizzare alla pagina del carrello
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/carrello.jsp");
        dispatcher.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }
}
