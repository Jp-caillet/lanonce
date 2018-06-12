package fr.lanonce.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.lannonce.dao.ConnexionUserDao;
import fr.lanonce.beans.UserBean;

/**
 * Servlet implementation class ConnectionServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pseudo = request.getParameter("pseudo");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		ConnexionUserDao connexionDao = new ConnexionUserDao();
		
		try {
			if(connexionDao.check(pseudo, email, password)) {
		        /* Récupération de la session depuis la requête */
				HttpSession session = request.getSession();
				session.setAttribute("email", email);
			    session.setAttribute("pseudo", pseudo);
			    session.setAttribute("id", connexionDao.getid());


				response.sendRedirect("/lanonce/auth/home");	


			} else {
				System.out.println("connexion rejetée");

				response.sendRedirect("/lanonce/login");	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
}
