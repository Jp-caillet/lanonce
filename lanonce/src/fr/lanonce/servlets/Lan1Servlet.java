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

import fr.lannonce.dao.AddLanDao;
import fr.lannonce.dao.AddUserDao;
import fr.lanonce.beans.ConnexionBeans;
import fr.lanonce.beans.LanBean;

/**
 * Servlet implementation class Lan1Servlet
 */
public class Lan1Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private AddLanDao lanDao;
    private String sql = "select * from lans where id_url =?";
    private String url = "jdbc:mysql://mysql-lanonce.alwaysdata.net/lanonce_bdd";
    private String username = "lanonce";
    private String pass = "fifou707";
    
    public void init() throws ServletException {
    	ConnexionBeans daoFactory = ConnexionBeans.getInstance();
        this.lanDao = daoFactory.getLanDao();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/auth/lanStep1.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LanBean lan = new LanBean();
		int box = 0;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		HttpSession session = request.getSession();
		
		try {
	        /* Récupération des paramètres d'URL saisis par l'utilisateur */
			lan.setPicture(request.getParameter("picture"));
			lan.setNameLan(request.getParameter("nameLan"));
			lan.setNameGame(request.getParameter("game"));
			int hasInteger= Integer.parseInt(request.getParameter("nombreUser"));
			lan.setNombreUser(hasInteger);
			lan.setLieux(request.getParameter("lieux"));
			String date = request.getParameter("date");
			Date fd = format.parse(date);
			java.sql.Date sqlDate = new java.sql.Date(fd.getTime());
			lan.setDate(sqlDate);
			boolean hasCreatePermission= Boolean.parseBoolean(request.getParameter("checkedRows"));
			if (hasCreatePermission == true) {
				box = 1;
			} 
			boolean test = true;
			String idurl = "";
			while(test) {
				idurl = this.generate(7);
				System.out.println(idurl);
				 try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection(url, username, pass);
				    PreparedStatement st = (PreparedStatement) con.prepareStatement(sql);
				    st.setString(1, idurl);
				    
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
			lan.setUrl(idurl); 
			lan.setCheckedRows(box);
			String Id_user =String.valueOf(session.getAttribute("id"));
			System.out.println(Id_user);
			lan.setIdUser(Id_user);
			lan.setDescription(request.getParameter("description"));
			lan.setInfo(request.getParameter("info"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		lanDao.ajouter(lan);
		this.getServletContext().getRequestDispatcher("/auth/confirmLan.jsp").forward(request, response);	

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
		    return pass;
	}
}
