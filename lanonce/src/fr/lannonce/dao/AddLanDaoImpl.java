package fr.lannonce.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

import fr.lanonce.beans.ConnexionBeans;
import fr.lanonce.beans.LanBean;

public class AddLanDaoImpl implements AddLanDao {
	private ConnexionBeans connexionLan;

	public AddLanDaoImpl(ConnexionBeans connexionLan) {
		this.connexionLan = connexionLan;
	}

	@Override
	public void ajouter(LanBean lan) {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		
		try {
            connexion = (Connection) connexionLan.getConnection();
            System.out.println("connexion");
            
            /* Création de l'objet gérant les requêtes préparées */
            preparedStatement = connexion.prepareStatement("INSERT INTO lans(picture, title, date, lieux, description) VALUES(?, ?, ?, ?, ?);");
            
            /*
             * Remplissage des paramètres de la requête grâce aux méthodes
             * setXXX() mises à disposition par l'objet PreparedStatement.
             */
            preparedStatement.setString(1, lan.getPicture());
            preparedStatement.setString(2, lan.getTitle());
            preparedStatement.setString(3, lan.getDate());
            preparedStatement.setString(4, lan.getLieux());
            preparedStatement.setString(5, lan.getDescription());
            
            preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
    
}
