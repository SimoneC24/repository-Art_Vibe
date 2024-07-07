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

@WebServlet(name = "home", urlPatterns = "/home")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchQuery = request.getParameter("search");
        String minPriceParam = request.getParameter("minPrice");
        String maxPriceParam = request.getParameter("maxPrice");
        String artistName = request.getParameter("artistName");

        Collection<OperaBean> opere = new ArrayList<>();
        OperaDAO operaDAO = new OperaDAO();

        try {
            if ((minPriceParam != null && !minPriceParam.isEmpty()) || (maxPriceParam != null && !maxPriceParam.isEmpty()) || (artistName != null && !artistName.isEmpty())) {
                double minPrice = minPriceParam != null && !minPriceParam.isEmpty() ? Double.parseDouble(minPriceParam) : 0;
                double maxPrice = maxPriceParam != null && !maxPriceParam.isEmpty() ? Double.parseDouble(maxPriceParam) : Double.MAX_VALUE;

                opere = operaDAO.doRetrieveByPriceAndArtist(minPrice, maxPrice, artistName);
            } else if (searchQuery != null && !searchQuery.isEmpty()) {
                opere = operaDAO.doRetrieveByName(searchQuery);
            } else {
                opere = operaDAO.doRetrieveAll();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("opere", opere);
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/view/home.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
