package fr.lannonce.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import fr.lanonce.beans.ConnexionBeans;
import fr.lanonce.beans.LanDto;
import fr.lanonce.beans.TournoisDto;

public class SearchTournoisDaoImpl implements SearchTournoisDao {
	private ConnexionBeans connexionUser;

    public SearchTournoisDaoImpl(ConnexionBeans connexionUser) {
        this.connexionUser = connexionUser;
    }
    
    public List<HashMap<Integer, TournoisDto>> getAllTournoisCheck(String l) {	    
	    TournoisDto dto = new TournoisDto();
	    List<HashMap<Integer, TournoisDto>> list = new ArrayList<HashMap<Integer, TournoisDto>>();
	    
	    PreparedStatement ps = null;

	    String data, idUrl, lieux, picture, date;

	    Connection connexion = null;
	    
	    try {
	    		connexion = (Connection) connexionUser.getConnection();
	        String ch=l+"%";
	        
	        /* Création de l'objet gérant les requêtes préparées */
	        ps = (PreparedStatement) connexion.prepareStatement("SELECT * FROM tournois WHERE nameGame LIKE '"+ch+"'");
	        ResultSet rs = ps.executeQuery();
	        
	        while (rs.next()) {
	        	
	    	    		HashMap<Integer, TournoisDto> dtoTournois = new HashMap<Integer, TournoisDto>();
	    	    		
	    	    		dto = new TournoisDto();
	    	    		
	        	    picture = rs.getString("picture");
	        	    data = rs.getString("nameGame");
	        	    date = rs.getString("date");
	            idUrl = rs.getString("id_url");
	            lieux = rs.getString("lieux");
	            
	            dto.setPicture(picture);
	            dto.setNameGame(data);
	            dto.setDate(date);
	            dto.setId_url(idUrl);
	            dto.setLieux(lieux);
	            
		        dtoTournois.put(0, dto);
		        
		        list.add(dtoTournois);
	        }

	        
	    } catch (Exception e) {
	        System.out.println(e.getMessage());
	    }
	    return list;
    }
}
