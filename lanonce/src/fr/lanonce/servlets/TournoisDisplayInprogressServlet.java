package fr.lanonce.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class TournoisDisplayInprogressServlet
 */
public class TournoisDisplayInprogressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private String username = "lanonce";
	 private String pass = "fifou707";
	 private String url = "jdbc:mysql://mysql-lanonce.alwaysdata.net/lanonce_bdd";
	 private String sql1 = "select * from tournois where id_url =?";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TournoisDisplayInprogressServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		 boolean already = true;
		try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, username, pass);
	    PreparedStatement st = (PreparedStatement) con.prepareStatement(sql1);
	    st.setString(1, request.getParameter("id"));
	    ResultSet rs = st.executeQuery();
	    if(rs.next()) {
	    	request.setAttribute("nb", rs.getInt("nb_user"));
	    }
	   con.close();
  } catch (Exception e) {
       e.printStackTrace();
      
  }
		this.getServletContext().getRequestDispatcher("/auth/tournois/current.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int nbtour =Integer.parseInt( request.getParameter("nbtour"))+1;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, pass);
		    PreparedStatement st = (PreparedStatement) con.prepareStatement("UPDATE trees SET perdu = 1 WHERE pseudo_player=? and  id_tournois=?;");
		    if(request.getParameter("versus")== request.getParameter("player1")){
		    	st.setString(1, request.getParameter("player2"));
		    	st.setString(2,request.getParameter("url"));
		    }
		    else {
		    	st.setString(1, request.getParameter("player1"));
		    	st.setString(2,request.getParameter("url"));
		    }
		    st.executeUpdate();
		   con.close();
	   } catch (Exception e) {
		   System.err.println(e);
	        e.printStackTrace();
	       
	   }
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, pass);
		    PreparedStatement st = (PreparedStatement) con.prepareStatement("UPDATE trees SET tour = ? WHERE pseudo_player=? and id_tournois=?;");
		    if(request.getParameter("versus")== request.getParameter("player1")){
		    	st.setInt(1, nbtour);
		    	st.setString(2, request.getParameter("player1"));
		    	st.setString(3,request.getParameter("url"));
		    }
		    else {
		    	st.setInt(1, nbtour);
		    	st.setString(2, request.getParameter("player2"));
		    	st.setString(3,request.getParameter("url"));
		    }
		    st.executeUpdate();
		   con.close();
	   } catch (Exception e) {
		   System.err.println(e);
	        e.printStackTrace();
	       
	   }
		doGet(request, response);
	}

}
