package fr.lanonce.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class DisplayTournoisServlet
 */
public class DisplayTournoisServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private String username = "lanonce";
	 private String pass = "fifou707";
	 private String url = "jdbc:mysql://mysql-lanonce.alwaysdata.net/lanonce_bdd";
	 private String sql = "INSERT INTO participer_tournois(id_tournois, id_user) VALUES(?, ?);";
	 private String sql2 = "select * from participer_tournois where id_tournois =? and id_user=?";
     
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayTournoisServlet() {
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
	    PreparedStatement st = (PreparedStatement) con.prepareStatement(sql2);
	    st.setString(1, request.getParameter("id"));
	    st.setString(2, String.valueOf(session.getAttribute("id")));
	    ResultSet rs = st.executeQuery();
	    if(rs.next()) {
	    	System.out.println("vous participé déja");
	    	already = false;
	    }
	    request.setAttribute("already",already );
	   con.close();
   } catch (Exception e) {
        e.printStackTrace();
       
   }
		this.getServletContext().getRequestDispatcher("/auth/displayTournois.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		System.out.println(request.getParameter("id"));
		System.out.println(session.getAttribute("id"));

		try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, username, pass);
	    PreparedStatement st = (PreparedStatement) con.prepareStatement(sql);
	    st.setString(1, request.getParameter("id"));
	    st.setString(2, String.valueOf(session.getAttribute("id")));
	    st.executeUpdate();
	   con.close();
   } catch (Exception e) {
        e.printStackTrace();
       
   }
		doGet(request, response);
		
	}

}
