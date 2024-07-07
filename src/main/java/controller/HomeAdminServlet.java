package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.OperaBean;
import model.OperaDAO;


@WebServlet(name = "homeAdmin", urlPatterns = "/homeAdmin")
public class HomeAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Collection<OperaBean> opere = new ArrayList<OperaBean>();
		OperaDAO operaDAO = new OperaDAO();
		
		try {
			opere = operaDAO.doRetrieveAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("opere", opere);
		
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/view/homeAdmin.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
}
