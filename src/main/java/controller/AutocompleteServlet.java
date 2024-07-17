package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.OperaBean;
import model.OperaDAO;
import com.google.gson.Gson;

@WebServlet("/autocomplete")
public class AutocompleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String query = request.getParameter("query");
        List<OperaBean> suggestions = new ArrayList<>();

        try {
            OperaDAO operaDAO = new OperaDAO();
            suggestions = (List<OperaBean>) operaDAO.doRetrieveByName(query);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(new Gson().toJson(suggestions));
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
