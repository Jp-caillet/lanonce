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
            preparedStatement = connexion.prepareStatement("INSERT INTO lans(picture, nameLan, nameGame, lieux, date, description, info, nb_user, id_user, private, id_url) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");
            
            /*
             * Remplissage des paramètres de la requête grâce aux méthodes
             * setXXX() mises à disposition par l'objet PreparedStatement.
             */
            preparedStatement.setString(1, lan.getPicture());
            preparedStatement.setString(2, lan.getNameLan());
            preparedStatement.setString(3, lan.getNameGame());
            preparedStatement.setString(4, lan.getLieux());
            preparedStatement.setDate(5, lan.getDate());
            preparedStatement.setString(6, lan.getDescription());
            preparedStatement.setString(7, lan.getInfo());
            preparedStatement.setInt(8, lan.getNombreUser());
            preparedStatement.setString(9, lan.getIdUser());
            preparedStatement.setInt(10, lan.getCheckedRows());
            preparedStatement.setString(11, lan.getUrl());

  
            preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
    
}
