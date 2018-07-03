package fr.lannonce.dao;

import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import fr.lanonce.beans.ConnexionBeans;

public class AddModifUserDaoImpl implements AddModifUserDao {
	private ConnexionBeans connexionUser;
    
    public AddModifUserDaoImpl(ConnexionBeans connexionUser) {
        this.connexionUser = connexionUser;
    }
    
    public void addModifUser(String pseudo1, String nom1, String prenom1, String ville1, String email1, String password1) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
    	
	    try{
		    connexion = (Connection) connexionUser.getConnection();
		    
		    System.out.println("connexion");
		    
		    preparedStatement = (PreparedStatement) connexion.prepareStatement("UPDATE users SET pseudo=?, nom=?, prenom=?, ville=?, email=?, password=? WHERE email=?"); 
		    
		    preparedStatement.setString(1,pseudo1);
		    preparedStatement.setString(2,nom1);      
		    preparedStatement.setString(3,prenom1);
		    preparedStatement.setString(4,ville1);
		    preparedStatement.setString(5,email1);
		    preparedStatement.setString(6,password1);
		    preparedStatement.setString(7, email1);
		    int i = preparedStatement.executeUpdate();
		    if(i!=0){
		    	System.out.println("<br>Data has been inserted");
		    }
		    else{
		    	System.out.println("failed!");
		    }
		 
		    } catch (Exception e){
		    	System.out.println(e);
		  }
	 }
}
