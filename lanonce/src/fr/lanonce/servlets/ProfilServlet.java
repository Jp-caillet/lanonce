package fr.lanonce.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import fr.lannonce.dao.AddUserDao;
import fr.lannonce.dao.ConnexionUserDao;
import fr.lannonce.dao.AddModifUserDao;
import fr.lannonce.dao.AddModifUserDaoImpl;
import fr.lanonce.beans.ConnexionBeans;

/**
 * Servlet implementation class ProfilServlet
 */
public class ProfilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AddModifUserDao addModifUserDao;
    
    public void init() throws ServletException {
    	ConnexionBeans daoFactory = ConnexionBeans.getInstance();
        this.addModifUserDao = daoFactory.getModifUserDao();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/auth/profil.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String nom1=request.getParameter("nom");
        String prenom1=request.getParameter("prenom");
        String ville1=request.getParameter("ville");
        String email1=request.getParameter("email");
        String pseudo1=request.getParameter("pseudo");
        String password1=request.getParameter("password");
        
        addModifUserDao.addModifUser(pseudo1, nom1, prenom1, ville1, email1, password1);
                
        this.getServletContext().getRequestDispatcher("/auth/profilChange.jsp").forward(request, response);
	}
}

