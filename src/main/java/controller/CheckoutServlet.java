package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (session.getAttribute("role") == null || session.getAttribute("role").equals("admin")) {
            request.setAttribute("message", "Questa pagina è accessibile solo agli utenti registrati");
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/view/error.jsp");
            rd.forward(request, response);
            return;
        }

        String totaleStr = request.getParameter("totale");
        if (totaleStr == null || totaleStr.trim().isEmpty()) {
            request.setAttribute("message", "Il totale non è stato specificato correttamente.");
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/view/error.jsp");
            rd.forward(request, response);
            return;
        }

        double totale = 0.0;
        try {
            totale = Double.parseDouble(totaleStr);
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Formato non valido per il totale.");
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/view/error.jsp");
            rd.forward(request, response);
            return;
        }

        request.setAttribute("totale", totale);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/checkout.jsp");
        dispatcher.forward(request, response);
    }
}
