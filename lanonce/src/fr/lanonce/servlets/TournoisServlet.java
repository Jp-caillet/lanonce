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

import fr.lannonce.dao.AddTournoisDao;
import fr.lanonce.beans.ConnexionBeans;
import fr.lanonce.beans.TournoisBean;

/**
 * Servlet implementation class TournoisServlet
 */
public class TournoisServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AddTournoisDao tournoisDao;
    private String sql = "select * from tournois where id_url =?";
    private String url = "jdbc:mysql://mysql-lanonce.alwaysdata.net/lanonce_bdd";
    private String username = "lanonce";
    private String pass = "fifou707";
         
    public void init() throws ServletException {
    	ConnexionBeans daoFactory = ConnexionBeans.getInstance();
        this.tournoisDao = daoFactory.getTournoisDao();
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.getServletContext().getRequestDispatcher("/auth/tournois.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TournoisBean tournois = new TournoisBean();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		HttpSession session = request.getSession();
		int privBox = 0;
		int payBox = 0;

		try {
			tournois.setPicture(request.getParameter("picture"));
			tournois.setNameTournois(request.getParameter("nameTournois"));
			tournois.setLieux(request.getParameter("lieux"));
			String date = request.getParameter("date");
			String nameGame = request.getParameter("nameGame");
			Date fd = format.parse(date);
			java.sql.Date sqlDate = new java.sql.Date(fd.getTime());
			tournois.setnameGame(nameGame);
			tournois.setDate(sqlDate);
			tournois.setDescription(request.getParameter("description"));
			tournois.setInfo(request.getParameter("info"));
			String Id_user =String.valueOf(session.getAttribute("id"));
			System.out.println(Id_user);
			tournois.setId_user(Id_user);
			boolean hasCreatePermission= Boolean.parseBoolean(request.getParameter("checkedPriv"));
			if (hasCreatePermission == true) {
				privBox = 1;
			} 
			tournois.setPriv_checked(privBox);
			tournois.setTypeTournois(request.getParameter("typeTournois"));
			tournois.setStatus("open");
			boolean hasCreatePermission1 = Boolean.parseBoolean(request.getParameter("checkedPay"));
			if (hasCreatePermission1 == true) {
				payBox = 1;
			} 
			tournois.setPay(payBox);
			int hasInteger = Integer.parseInt(request.getParameter("nombreUser"));
			tournois.setNombreUser(hasInteger);
			boolean test = true;
			String id_url = "";
			while(test) {
				id_url = this.generate(7);
				request.setAttribute("url", id_url);

				 try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection(url, username, pass);
				    PreparedStatement st = (PreparedStatement) con.prepareStatement(sql);
				    st.setString(1, id_url);
				    
				    ResultSet rs = st.executeQuery();
				    if(!rs.next()) {
				    		test = false;
				    }
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				} catch (SQLException e) {
					e.printStackTrace();
				}	
			}
			tournois.setId_url(id_url);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		tournoisDao.ajouterTournois(tournois);
		
		this.getServletContext().getRequestDispatcher("/auth/tournoisCreated.jsp").forward(request, response);
	}
	
	public String generate(int length)
	{
		    String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"; // Tu supprimes les lettres dont tu ne veux pas
		    String pass = "";
		    for(int x=0;x<length;x++)
		    {
		       int i = (int)Math.floor(Math.random() * 62); // Si tu supprimes des lettres tu diminues ce nb
		       pass += chars.charAt(i);
		    }
		    System.out.println(pass);
		    return pass;
	}

}
