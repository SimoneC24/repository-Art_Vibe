package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.OperaBean;
import model.OperaDAO;

@WebServlet(name = "OperaServlet", urlPatterns = "/operaServlet")
public class OperaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idOpera = Integer.parseInt(request.getParameter("id"));
		OperaDAO operaDAO = new OperaDAO();
		OperaBean opera = null;
		
		try {
			opera = operaDAO.doRetrieveByKey(idOpera);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("opera", opera);
		
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/view/opera.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
