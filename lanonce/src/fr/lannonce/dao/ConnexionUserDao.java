package fr.lannonce.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConnexionUserDao {
	private String sql = "select * from users where pseudo =? and email=? and password=?";
    private String url = "jdbc:mysql://mysql-lanonce.alwaysdata.net/lanonce_bdd";
    private String username = "lanonce";
    private String pass = "fifou707";

    public boolean check(String pseudo, String email, String password) throws SQLException {
		try {
		    Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection(url, username, pass);
		    PreparedStatement st = (PreparedStatement) con.prepareStatement(sql);
		    st.setString(1, pseudo);
		    st.setString(2, email);
		    st.setString(3, password);
		    ResultSet rs = st.executeQuery();
		    if(rs.next()) {
		    		return true;
		    }
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false;
    }
}
