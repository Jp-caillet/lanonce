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
		response.setContentType("text/html");
        /*PrintWriter pw = response.getWriter();
        String url = "jdbc:mysql://mysql-lanonce.alwaysdata.net/lanonce_bdd";
        String username = "lanonce";
        String pass = "fifou707";*/
        
        String nom1=request.getParameter("nom");
        String prenom1=request.getParameter("prenom");
        String ville1=request.getParameter("ville");
        String email1=request.getParameter("email");
        String pseudo1=request.getParameter("pseudo");
        String password1=request.getParameter("password");
        
        addModifUserDao.addModifUser(pseudo1, nom1, prenom1, ville1, email1, password1);
        
        /*try{

		    Class.forName("com.mysql.jdbc.Driver");
		    Connection con = (Connection) DriverManager.getConnection(url, username, pass);
		    PreparedStatement pst = (PreparedStatement) con.prepareStatement("UPDATE users SET pseudo=?, nom=?, prenom=?, ville=?, email=?, password=? WHERE email=?"); 
		    pst.setString(1,pseudo1);
		    pst.setString(2,nom1);      
		    pst.setString(3,prenom1);
		    pst.setString(4,ville1);
		    pst.setString(5,email1);
		    pst.setString(6,password1);
		    pst.setString(7, email1);
		    int i = pst.executeUpdate();
		    if(i!=0){
		        pw.println("<br>Data has been inserted");
		    }
		    else{
		       pw.println("failed!");
		    }
		 
		    } catch (Exception e){
		      pw.println(e);
		  }*/
	}
}

