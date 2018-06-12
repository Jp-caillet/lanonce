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
    
    public ArrayList<String> getAllTournoisCheck(String l) {
	    ArrayList<String> list = new ArrayList<String>();
	    PreparedStatement ps = null;

	    String data, idUrl, lieux, picture, date;

	    Connection connexion = null;
	    
	    try {
	    		connexion = (Connection) connexionUser.getConnection();
	        String ch=l+"%";
	        
	        /* Création de l'objet gérant les requêtes préparées */
	        ps = (PreparedStatement) connexion.prepareStatement("SELECT * FROM tournois WHERE nameGame LIKE '"+ch+"'");
	        ResultSet rs = ps.executeQuery();
	        int i = 0;
	        
	        while (rs.next()) {
	        	    picture = rs.getString("picture");
	        	    data = rs.getString("nameGame");
	        	    date = rs.getString("date");
	            idUrl = rs.getString("id_url");
	            lieux = rs.getString("lieux");
	            
	            list.add(picture);
	            list.add(data);
	            list.add(date);
	            list.add(lieux);
	            list.add(idUrl);
	            i ++;
	        }
	        
	        list.add(String.valueOf(i));
	        
	    } catch (Exception e) {
	        System.out.println(e.getMessage());
	    }
	    return list;
    }
}
