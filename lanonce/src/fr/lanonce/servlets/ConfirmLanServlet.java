package fr.lanonce.servlets;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class ConfirmLanServlet
 */
@WebServlet("/ConfirmLanServlet")
public class ConfirmLanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmLanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.getServletContext().getRequestDispatcher("/auth/confirmLan.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   HttpSession session = request.getSession();

		   try {
			    String description = "";
			    String info = "";
			    String date = "";
		        Class.forName("com.mysql.jdbc.Driver");
		        Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://mysql-lanonce.alwaysdata.net/lanonce_bdd", "lanonce", "fifou707");
		        Statement smt = (Statement) con.createStatement();
		        ResultSet r = smt.executeQuery("select * from lans where(id_user='" + session.getAttribute("id") + "');");

		        while (r.next()) {
		          request.setAttribute("description", description = r.getString("description"));
		          request.setAttribute("info", description = r.getString("info"));
		          request.setAttribute("date", description = r.getString("date"));
		          request.getRequestDispatcher("/auth/confirmLan.jsp").forward(request, response);
		          /*info = r.getString("info");
		          date = r.getString("date");*/
		        }
		        con.close();
		   } catch (Exception e) {
		        e.printStackTrace();
		   }
	}

}
