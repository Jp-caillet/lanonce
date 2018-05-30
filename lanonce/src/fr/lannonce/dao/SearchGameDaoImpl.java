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
	    String data;
	    Connection connexion = null;
	    
	    try {
	    		connexion = (Connection) connexionUser.getConnection();
	        String ch=l+"%";
	        
	        /* Création de l'objet gérant les requêtes préparées */
	        ps = (PreparedStatement) connexion.prepareStatement("SELECT * FROM lans WHERE nameGame LIKE '"+ch+"'");
	        ResultSet rs = ps.executeQuery();
	        
	        while (rs.next()) {
	            data = rs.getString("nameGame");
	            list.add(data);
	        }
	    } catch (Exception e) {
	        System.out.println(e.getMessage());
	    }
	    return list;
	}
}
