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
	    String idParam = request.getParameter("id");
	    if (idParam == null || idParam.isEmpty()) {
	        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID dell'opera non valido o assente.");
	        return;
	    }

	    int idOpera = Integer.parseInt(idParam);
	    OperaDAO operaDAO = new OperaDAO();
	    OperaBean opera = null;

	    try {
	        opera = operaDAO.doRetrieveByKey(idOpera);
	        if (opera == null) {
	            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Opera non trovata.");
	            return;
	        }
	    } catch (SQLException e) {
	    	request.setAttribute("message", "Errore nel recupero dell'opera.");
	    	RequestDispatcher rd = getServletContext().getRequestDispatcher("/view/error.jsp");
	        rd.forward(request, response);
	        return;
	    }

	    request.setAttribute("opera", opera);
	    RequestDispatcher rd = getServletContext().getRequestDispatcher("/view/opera.jsp");
	    rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
