package fr.lannonce.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

import fr.lanonce.beans.ConnexionBeans;
import fr.lanonce.beans.UserBean;

public class AddUserDaoImpl implements AddUserDao {
		private ConnexionBeans connexionUser;

	    public AddUserDaoImpl(ConnexionBeans connexionUser) {
	        this.connexionUser = connexionUser;
	    }

	    @Override
	    public void ajouter(UserBean user) {
	        Connection connexion = null;
	        PreparedStatement preparedStatement = null;
	        
	        try {
	            connexion = (Connection) connexionUser.getConnection();
	            System.out.println("connexion");
	            
	            /* Création de l'objet gérant les requêtes préparées */
	            preparedStatement = connexion.prepareStatement("INSERT INTO users(pseudo, email, password) VALUES(?, ?, ?);");
	            
	            /*
	             * Remplissage des paramètres de la requête grâce aux méthodes
	             * setXXX() mises à disposition par l'objet PreparedStatement.
	             */
	            preparedStatement.setString(1, user.getPseudo());
	            preparedStatement.setString(2, user.getEmail());
	            preparedStatement.setString(3, user.getPassword());
	            
	            preparedStatement.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
}
