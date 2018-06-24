package fr.lanonce.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.lannonce.dao.SearchGameDao;
import fr.lannonce.dao.SearchTournoisDao;
import fr.lanonce.beans.ConnexionBeans;
import fr.lanonce.beans.LanDto;
import fr.lanonce.beans.TournoisDto;

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

	    List<HashMap<Integer, TournoisDto>> list1 = tournois.getAllTournoisCheck(term);
	    List<HashMap<Integer, LanDto>>  list = nameGame.getAllNameGameCheck(term);


	   
	    System.out.println(list);
	    String json = new Gson().toJson(list);
	    String json1 = new Gson().toJson(list1);
	    
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    String bothJson = "["+json+","+json1+"]";
	    response.getWriter().write(bothJson);
	}
}
