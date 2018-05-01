package fr.lanonce.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.lannonce.dao.AddLanDao;
import fr.lannonce.dao.AddUserDao;
import fr.lanonce.beans.ConnexionBeans;
import fr.lanonce.beans.LanBean;

/**
 * Servlet implementation class LanServlet
 */
public class LanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private AddLanDao lanDao;

    public void init() throws ServletException {
    	ConnexionBeans daoFactory = ConnexionBeans.getInstance();
        this.lanDao = daoFactory.getLanDao();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/auth/lan.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LanBean lan = new LanBean();
		
        /* Récupération des paramètres d'URL saisis par l'utilisateur */
		lan.setPicture(request.getParameter("picture"));
		lan.setTitle(request.getParameter("Title"));
		lan.setDate(request.getParameter("Date"));
		lan.setLieux(request.getParameter("lieux"));
		lan.setDescription(request.getParameter("description"));
		
		lanDao.ajouter(lan);
	}
}
