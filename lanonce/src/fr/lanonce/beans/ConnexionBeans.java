package fr.lanonce.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import fr.lannonce.dao.UserDao;
import fr.lannonce.dao.UserDaoImpl;

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
    
    public UserDao getUtilisateurDao() {
        return new UserDaoImpl(this);
    }


}
