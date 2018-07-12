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

public class SearchGameDaoImpl implements SearchGameDao{
	private ConnexionBeans connexionUser;

    public SearchGameDaoImpl(ConnexionBeans connexionUser) {
        this.connexionUser = connexionUser;
    }
	
	public List<HashMap<Integer, LanDto>> getAllNameGameCheck(String l) {
	    LanDto dto = new LanDto();
	   
	    List<HashMap<Integer, LanDto>> list = new ArrayList<HashMap<Integer, LanDto>>();
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
	        	
	        		HashMap<Integer, LanDto> dtoLan = new HashMap<Integer, LanDto>();
	        		
	        		dto = new LanDto();
	        		        		
	            data = rs.getString("nameGame");
	            date = rs.getString("date");
	            lieux = rs.getString("lieux");
	            picture = rs.getString("picture");

	            idUrl = rs.getString("id_url");

	            
	            dto.setPicture(picture);
	            dto.setNameGame(data);
	            dto.setDate(date);
	            dto.setId_url(idUrl);
	            dto.setLieux(lieux);
	            
	            dtoLan.put(1, dto);
	            
	            list.add(dtoLan);      
	        }
	       
	    } catch (Exception e) {
	        System.out.println(e.getMessage());
	    }
	    return list;
	}
}
