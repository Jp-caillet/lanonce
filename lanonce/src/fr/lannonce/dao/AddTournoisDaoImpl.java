package fr.lannonce.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

import fr.lanonce.beans.ConnexionBeans;
import fr.lanonce.beans.TournoisBean;

public class AddTournoisDaoImpl implements AddTournoisDao{
	ConnexionBeans connexionTournois;
	
	public AddTournoisDaoImpl(ConnexionBeans connexionTournois) {
		this.connexionTournois = connexionTournois;
	}
	
	@Override
	public void ajouterTournois(TournoisBean tournois) {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		
		try {
            connexion = (Connection) connexionTournois.getConnection();

            System.out.println("connexion");
            
            /* Création de l'objet gérant les requêtes préparées */
            preparedStatement = connexion.prepareStatement("INSERT INTO tournois(picture, nameTournois, lieux, date, description, info, id_user, private, type, status, pay, nb_user, id_url) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");
            
            /*
             * Remplissage des paramètres de la requête grâce aux méthodes
             * setXXX() mises à disposition par l'objet PreparedStatement.
             */
            preparedStatement.setString(1, tournois.getPicture());
            preparedStatement.setString(2, tournois.getNameTournois());
            preparedStatement.setString(3, tournois.getLieux());
            preparedStatement.setDate(4, tournois.getDate());
            preparedStatement.setString(5, tournois.getDescription());
            preparedStatement.setString(6, tournois.getInfo());
            preparedStatement.setString(7, tournois.getId_user());
            preparedStatement.setInt(8, tournois.getPriv_checked());
            preparedStatement.setString(9, tournois.getTypeTournois());
            preparedStatement.setString(10, tournois.getStatus());
            preparedStatement.setInt(11, tournois.getPay());
            preparedStatement.setInt(12, tournois.getNombreUser());
            preparedStatement.setString(13, tournois.getId_url());
  
            preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
