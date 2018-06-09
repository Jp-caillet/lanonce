package fr.lanonce.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.lannonce.dao.SearchGameDao;
import fr.lannonce.dao.SearchTournoisDao;
import fr.lanonce.beans.ConnexionBeans;
import com.google.gson.*;


/**
 * Servlet implementation class SearchLanServlet
 */
public class SearchLanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private SearchGameDao nameGame;
    private SearchTournoisDao tournois;

    public void init() throws ServletException {
    	ConnexionBeans daoFactory = ConnexionBeans.getInstance();
        this.nameGame = daoFactory.getAllNameGameCheck();
        this.tournois = daoFactory.getAllTournoisCheck();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    this.getServletContext().getRequestDispatcher("/auth/searchLan.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String term = request.getParameter("term");
	    ArrayList<String> list1 = tournois.getAllTournoisCheck(term);
	    ArrayList<String> list = nameGame.getAllNameGameCheck(term);

	    
	    list.addAll(list1);
	    System.out.println(list);
	    
	    String json = new Gson().toJson(list);
	    
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(json);
	}
}
