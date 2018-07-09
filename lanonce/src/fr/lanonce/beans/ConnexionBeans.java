package fr.lanonce.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import fr.lannonce.dao.AddLanDao;
import fr.lannonce.dao.AddLanDaoImpl;
import fr.lannonce.dao.AddModifUserDao;
import fr.lannonce.dao.AddModifUserDaoImpl;
import fr.lannonce.dao.AddTournoisDao;
import fr.lannonce.dao.AddTournoisDaoImpl;
import fr.lannonce.dao.AddUserDao;
import fr.lannonce.dao.AddUserDaoImpl;
import fr.lannonce.dao.SearchGameDao;
import fr.lannonce.dao.SearchGameDaoImpl;
import fr.lannonce.dao.SearchTournoisDao;
import fr.lannonce.dao.SearchTournoisDaoImpl;

public class ConnexionBeans {
	
	private String url;
    private String username;
    private String password;

    ConnexionBeans(String url, String username, String password) {
        this.url = url;
        this.username = username;
        this.password = password;
    }

    public static ConnexionBeans getInstance() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {

        }

        ConnexionBeans instance = new ConnexionBeans("jdbc:mysql://mysql-lanonce.alwaysdata.net/lanonce_bdd", "lanonce", "fifou707");  
        return instance;
    }

    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, username, password);
    }
    
    public AddUserDao getUtilisateurDao() {
        return new AddUserDaoImpl(this);
    }
    
    public AddLanDao getLanDao() {
    		return new AddLanDaoImpl(this);
    }
    
    public AddTournoisDao getTournoisDao() {
		return new AddTournoisDaoImpl(this);
    }
    
    public SearchGameDao getAllNameGameCheck() {
		return new SearchGameDaoImpl(this);
    }
    
    public SearchTournoisDao getAllTournoisCheck() {
		return new SearchTournoisDaoImpl(this);
    }
    
    public AddModifUserDao getModifUserDao() {
		return new AddModifUserDaoImpl(this);
    }
    
}

