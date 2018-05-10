package fr.lanonce.servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.lannonce.dao.AddLanDao;
import fr.lannonce.dao.AddUserDao;
import fr.lanonce.beans.ConnexionBeans;
import fr.lanonce.beans.LanBean;

/**
 * Servlet implementation class Lan1Servlet
 */
public class Lan1Servlet extends HttpServlet {
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
		this.getServletContext().getRequestDispatcher("/auth/lanStep1.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LanBean lan = new LanBean();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		HttpSession session = request.getSession();
		
		try {
	        /* Récupération des paramètres d'URL saisis par l'utilisateur */
			lan.setPicture(request.getParameter("picture"));
			lan.setNameLan(request.getParameter("nameLan"));
			lan.setLieux(request.getParameter("lieux"));
			String date = request.getParameter("date");
			Date fd = format.parse(date);
			java.sql.Date sqlDate = new java.sql.Date(fd.getTime());
			lan.setDate(sqlDate);
			lan.setIdUser(session.getId());
			lan.setDescription(request.getParameter("description"));
			lan.setInfo(request.getParameter("info"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		lanDao.ajouter(lan);
	}
}
