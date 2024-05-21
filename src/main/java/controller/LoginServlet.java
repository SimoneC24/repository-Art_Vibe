package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (p != null) {
			System.out.println(p.getCf());
			System.out.println(p.getNome());
			System.out.println(p.getCognome());
			System.out.println(p.getEmail());
			System.out.println(p.getPassword());
			
		} else {
			System.out.println("Errore");
		}
	}
}
