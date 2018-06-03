package fr.lannonce.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import fr.lanonce.beans.ConnexionBeans;

public class SearchGameDaoImpl implements SearchGameDao{
	private ConnexionBeans connexionUser;

    public SearchGameDaoImpl(ConnexionBeans connexionUser) {
        this.connexionUser = connexionUser;
    }
	
	public ArrayList<String> getAllNameGameCheck(String l) {
	    ArrayList<String> list = new ArrayList<String>();
	    PreparedStatement ps = null;
	    String data, date, lieux, picture;
	    Connection connexion = null;
	    
	    try {
	    		connexion = (Connection) connexionUser.getConnection();
	        String ch=l+"%";
	        
	        /* Cr�ation de l'objet g�rant les requ�tes pr�par�es */
	        ps = (PreparedStatement) connexion.prepareStatement("SELECT * FROM lans WHERE nameGame LIKE '"+ch+"'");
	        ResultSet rs = ps.executeQuery();
	        
	        while (rs.next()) {
	        		
	            data = rs.getString("nameGame");
	            date = rs.getString("date");
	            lieux = rs.getString("lieux");
	            picture = rs.getString("picture");
	            
	            list.add(data);
	            list.add(date);
	            list.add(lieux);
	            list.add(picture);
	        }
	    } catch (Exception e) {
	        System.out.println(e.getMessage());
	    }
	    return list;
	}
}