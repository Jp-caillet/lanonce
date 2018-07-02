package fr.lanonce.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class CreationTreesBeans {
	private int position;
	private String id_player;
	private int perdu;
	private String id_tournois;
	private String pseudo_player;
	private String url = "jdbc:mysql://mysql-lanonce.alwaysdata.net/lanonce_bdd";
	private String username = "lanonce";
	private String pass = "fifou707";
	
	public void CreationTreesBeans(int position, String id_player, int perdu,String id_tournois, String pseudo_player) {
		this.id_player =id_player;
		this.position = position;
		this.perdu= perdu;
		this.id_tournois = id_tournois;
		this.pseudo_player = pseudo_player;
	}
	
	public void ajoutBase() {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, pass);
		    PreparedStatement st = (PreparedStatement) con.prepareStatement("INSERT INTO trees(id_tournois, id_players,perdu, position, pseudo_player) VALUES(?, ?, ?, ?,?);");
		    st.setString(1,  this.id_tournois);
		    st.setString(2, this.id_player);
		    st.setInt(3, this.perdu);
		    st.setInt(4, this.position);
		    st.setString(5, this.pseudo_player);
		    st.executeUpdate();
		   con.close();
	   } catch (Exception e) {
	        e.printStackTrace();
	       
	   }
	}

}
