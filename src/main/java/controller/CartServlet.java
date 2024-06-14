package controller;

import java.io.IOException;
import java.sql.SQLException;

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
		Cart cart = (Cart)session.getAttribute("cart");
		if(cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		
		String action = request.getParameter("action");
		int id = Integer.parseInt(request.getParameter("id"));
		OperaBean opera = null;
		
		OperaDAO operaDAO = new OperaDAO();
		try {
			opera = operaDAO.doRetrieveByKey(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(action.equalsIgnoreCase("aggiungi")) {
			cart.addProduct(opera);
		}
		
		response.sendRedirect(request.getContextPath() + "/home");
		
		System.out.println("Elemento " + cart.getProducts().get(0));
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
