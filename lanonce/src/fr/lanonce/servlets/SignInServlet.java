package fr.lanonce.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.lannonce.dao.AddUserDao;
import fr.lanonce.beans.ConnexionBeans;
import fr.lanonce.beans.UserBean;

/**
 * Servlet implementation class SignInServlet
 */
@WebServlet(name = "/SignInServlet")
public class SignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private AddUserDao userDao;

    public void init() throws ServletException {
    	ConnexionBeans daoFactory = ConnexionBeans.getInstance();
        this.userDao = daoFactory.getUtilisateurDao();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/WEB-INF/signIn.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserBean user = new UserBean();
        
        /* Récupération des paramètres d'URL saisis par l'utilisateur */
        user.setPseudo(request.getParameter("pseudo"));
        user.setNom(request.getParameter("nom"));
        user.setPrenom(request.getParameter("prenom"));
        user.setVille(request.getParameter("ville"));
        user.setEmail(request.getParameter("email"));
        user.setPassword(request.getParameter("password"));
        System.out.println("connexion");
        
        userDao.ajouter(user);
	}

}
