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

	    String data, date, lieux, picture, idUrl;

	    Connection connexion = null;
	    
	    try {
	    		connexion = (Connection) connexionUser.getConnection();
	        String ch=l+"%";
	        
	        /* Création de l'objet gérant les requêtes préparées */
	        ps = (PreparedStatement) connexion.prepareStatement("SELECT * FROM lans WHERE nameGame LIKE '"+ch+"'");
	        ResultSet rs = ps.executeQuery();
	        
	        while (rs.next()) {
	        		
	            data = rs.getString("nameGame");
	            date = rs.getString("date");
	            lieux = rs.getString("lieux");
	            picture = rs.getString("picture");
<<<<<<< HEAD
	            idUrl = rs.getString("id_url");
=======

	            idUrl = rs.getString("id_url");
	            System.out.println(idUrl);

>>>>>>> 1d96e728003f2fe7abdd05a2bc868f9f5db1ae41
	            
	            list.add(picture);
	            list.add(data);
	            list.add(date);
	            list.add(lieux);
	            list.add(idUrl);
	        }
	    } catch (Exception e) {
	        System.out.println(e.getMessage());
	    }
	    return list;
	}
}
