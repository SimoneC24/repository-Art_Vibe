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

import model.Cart;
import model.OperaBean;
import model.OperaDAO;

@WebServlet(name = "cartServlet", urlPatterns = "/cartServlet")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Object role = session.getAttribute("role");

        if (role != null && role.equals("admin")) {
            request.setAttribute("message", "Il carrello non è accessibile agli admin");
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/view/error.jsp");
            rd.forward(request, response);
            return;
        }
        
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        String action = request.getParameter("action");

        if (action != null) {
            OperaDAO operaDAO = new OperaDAO();
            try {
                switch (action.toLowerCase()) {
                    case "aggiungi":
                        int idAdd = Integer.parseInt(request.getParameter("id"));
                        OperaBean operaAdd = operaDAO.doRetrieveByKey(idAdd);
                        if (operaAdd != null) {
                            cart.addProduct(operaAdd, 1);
                        }
                        break;
                    case "incrementa":
                        int idInc = Integer.parseInt(request.getParameter("id"));
                        OperaBean operaInc = operaDAO.doRetrieveByKey(idInc);
                        if (operaInc != null) {
                            cart.incrementProductQuantity(operaInc, 1);
                        }
                        break;
                    case "decrementa":
                        int idDec = Integer.parseInt(request.getParameter("id"));
                        OperaBean operaDec = operaDAO.doRetrieveByKey(idDec);
                        if (operaDec != null) {
                            cart.decrementProductQuantity(operaDec, 1);
                        }
                        break;
                    case "rimuovi":
                        int idRem = Integer.parseInt(request.getParameter("id"));
                        OperaBean operaRem = operaDAO.doRetrieveByKey(idRem);
                        if (operaRem != null) {
                            cart.deleteProduct(operaRem);
                        }
                        break;
                    case "svuota":
                        cart.clear();
                        break;
                    default:
                        handleException(request, response, "Azione non valida: " + action);
                        return;
                }
            } catch (NumberFormatException e) {
                handleException(request, response, "ID del prodotto non valido");
            } catch (SQLException e) {
                handleException(request, response, "Errore durante il recupero dei dati dal database");
            }
        }

        session.setAttribute("cart", cart);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/view/carrello.jsp");
        rd.forward(request, response);
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
