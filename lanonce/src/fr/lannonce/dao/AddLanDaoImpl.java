package fr.lannonce.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

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
            preparedStatement = connexion.prepareStatement("INSERT INTO lans(picture, title, lieux, description, date, id_user) VALUES(?, ?, ?, ?, ?, ?);");
            
            /*
             * Remplissage des paramètres de la requête grâce aux méthodes
             * setXXX() mises à disposition par l'objet PreparedStatement.
             */
            preparedStatement.setString(1, lan.getPicture());
            preparedStatement.setString(2, lan.getTitle());
            preparedStatement.setString(3, lan.getLieux());
            preparedStatement.setString(4, lan.getDescription());
            preparedStatement.setDate(5, lan.getDate());
            preparedStatement.setString(6, lan.getIdUser());
            
            preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
    
}
