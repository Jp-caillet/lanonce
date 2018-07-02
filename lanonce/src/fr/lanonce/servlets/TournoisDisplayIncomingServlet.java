package fr.lanonce.servlets;

import java.awt.List;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.lanonce.beans.CreationTreesBeans;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.PrimitiveIterator.OfInt;
import java.util.concurrent.ThreadLocalRandom;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


/**
 * Servlet implementation class TournoisDisplayIncoming
 */
@WebServlet("/TournoisDisplayIncoming")
public class TournoisDisplayIncomingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TournoisDisplayIncomingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.getServletContext().getRequestDispatcher("/auth/tournois/incoming.jsp").forward(request, response);
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int position = 1;
		ArrayList<String> id_players = new ArrayList<>();
		ArrayList<String> pseudo_player= new ArrayList<>();
		String id_tournois = request.getParameter("id");
		int perdu = 0;
		 try {
			   
		        Class.forName("com.mysql.jdbc.Driver");
		        Connection con = DriverManager.getConnection("jdbc:mysql://mysql-lanonce.alwaysdata.net/lanonce_bdd", "lanonce", "fifou707");
		        Statement smt = con.createStatement();
		        ResultSet r = smt.executeQuery("select id_user from participer_tournois where id_tournois='" + id_tournois + "';");

		        while (r.next()) {
		        	id_players.add(r.getString("id_user"));
		        	
		        }
		        con.close();
		        System.out.println(id_players);
		   } catch (Exception e) {
		        e.printStackTrace();
		      System.out.println(e);
		   }
		 try {
			   for(int i=0; i<id_players.size();i++) {
				   Class.forName("com.mysql.jdbc.Driver");
			        Connection con = DriverManager.getConnection("jdbc:mysql://mysql-lanonce.alwaysdata.net/lanonce_bdd", "lanonce", "fifou707");
			        Statement smt = con.createStatement();
			        ResultSet r = smt.executeQuery("select pseudo from users where id='" + id_players.get(i) + "';");

			        while (r.next()) {
			        	pseudo_player.add(r.getString("pseudo"));
			        	
			        }
			        con.close();
			   }
		       
		        System.out.println(pseudo_player);
		   } catch (Exception e) {
		        e.printStackTrace();
		      System.out.println(e);
		   }
		 OfInt iterator = ThreadLocalRandom.current().ints(0, id_players.size()).distinct().iterator();
		   
		  
		 
		 for(int i=0; i<id_players.size();i++) {
			 CreationTreesBeans arbre;
				arbre = new CreationTreesBeans();
				arbre.CreationTreesBeans(iterator.next()+1, id_players.get(i), perdu, id_tournois, pseudo_player.get(i));
				arbre.ajoutBase();
		 }
		 try{
				Class.forName("com.mysql.jdbc.Driver");
				 Connection con = DriverManager.getConnection("jdbc:mysql://mysql-lanonce.alwaysdata.net/lanonce_bdd", "lanonce", "fifou707");
			       PreparedStatement st = (PreparedStatement) con.prepareStatement("UPDATE tournois SET status = ? WHERE id_url='"+id_tournois+"';");
			    st.setString(1,  "current");
			    st.executeUpdate();
			   con.close();
		   } catch (Exception e) {
		        e.printStackTrace();
		       
		   }
		 
		 response.sendRedirect("/lanonce/auth/history/tournois?status=current");
	}

}
