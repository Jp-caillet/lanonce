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

/**
 * Servlet implementation class ConnectionServlet
 */
@WebServlet(name = "/ConnectionServlet", urlPatterns = {"/connectionServlet"})
public class ConnectionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/WEB-INF/connection.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		ConnexionUserDao connexionDao = new ConnexionUserDao();
		
		try {
			if(connexionDao.check(email, password)) {
				HttpSession session = request.getSession();
				session.setAttribute("email", email);
				System.out.println("connexion reussi");
			} else {
				System.out.println("connexion rejetée");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
