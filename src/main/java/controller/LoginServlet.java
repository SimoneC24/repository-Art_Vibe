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

import model.PersonaBean;
import model.PersonaDAO;

@WebServlet(name = "login", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("pwd");

        PersonaBean p = null;
        try {
            p = PersonaDAO.doRetriveByEmailPassword(email, password);
        } catch (SQLException e) {
        	 request.setAttribute("message", "Si è verificato un errore.");
             RequestDispatcher rd = getServletContext().getRequestDispatcher("/view/error.jsp");
             rd.forward(request, response);
             return;
        }

        if (p == null) {

            request.setAttribute("errorMessage", "Email o password errati, per favore riprova.");

            request.getRequestDispatcher("/view/login.jsp").forward(request, response);
        } else {

            HttpSession session = request.getSession();
            session.setAttribute("user", p); 
            session.setAttribute("role", p.getRole());


            if ("admin".equalsIgnoreCase(p.getRole())) {
                response.sendRedirect(request.getContextPath() + "/homeAdmin");
            } else {
                response.sendRedirect(request.getContextPath() + "/home");
            }
        }
    }
}