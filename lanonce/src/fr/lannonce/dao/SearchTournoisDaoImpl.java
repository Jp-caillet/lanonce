package fr.lannonce.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import fr.lanonce.beans.ConnexionBeans;

public class SearchTournoisDaoImpl implements SearchTournoisDao {
	private ConnexionBeans connexionUser;

    public SearchTournoisDaoImpl(ConnexionBeans connexionUser) {
        this.connexionUser = connexionUser;
    }
    
	public ArrayList<String> getAllNameGameTournois(String l) {
	    ArrayList<String> list1 = new ArrayList<String>();
	    PreparedStatement ps = null;

	    String data;

	    Connection connexion = null;
	    
	    try {
	    		connexion = (Connection) connexionUser.getConnection();
	        String ch=l+"%";
	        
	        /* Création de l'objet gérant les requêtes préparées */
	        ps = (PreparedStatement) connexion.prepareStatement("SELECT * FROM tournois WHERE nameGame LIKE '"+ch+"'");
	        ResultSet rs = ps.executeQuery();
	        
	        while (rs.next()) {
	        		
	            data = rs.getString("nameGame");
	           
	            list1.add(data);

	        }
	    } catch (Exception e) {
	        System.out.println(e.getMessage());
	    }
	    return list1;	
	}
}
