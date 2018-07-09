<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Date"%>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@page import="java.awt.print.Printable"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  background-color: #333;
  height: 85px;
}

.topnav a {
  float: right;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
  margin-top: 10px;
}

.topnav a.active {
  padding-top: 21px;		
  background-color: #d6d402;
  height: 80px;
  color: white;
  margin-top: 0;
}

.topnav2 {
  overflow: hidden;
  background-color: #ffffff;
  padding-top: 20px;
  padding-bottom: 20px;
}

.topnav2 a {
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
  margin-top: 10px;
  margin-left: 22px;
}
</style>
</head>
<body>

<!-- adminMenu -->
<div class="topnav">
  <img src="images/logo_blanc.png" width="180px" height="80px"/>
  <a class="active" href="/lanonce/auth/home">Home</a>
  <a href="/lanonce/auth/profil">Profil</a>
  <a href="/lanonce/auth/logout">Logout</a>
  <a href=""><c:out value="Bonjour ${sessionScope.pseudo}"/></a>
</div>

<!-- adminMenuLan -->
<div class="topnav2">
  <a href="/lanonce/auth/help">Comment ca marche ?</a></li>
  <a href="/lanonce/auth/create">Créer une rencontre</a></li>
  <a href="/lanonce/auth/searchLan">Chercher une rencontre</a></li>
  <a href="/lanonce/auth/history/lan/inComing">Mes lans</a></li>
  <a href="/lanonce/auth/history/tournois?status=open">Mes tournois</a></li>
  <a href="#">Tournois</a></li>
  <a href="/lanonce/auth/contactus">Contactez-nous</a></li>
</div>

<div class="row">
<div class="col-md-offset-2 col-md-7">
<div class="form-group">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container">
      <ul class="nav navbar-nav">
	  <li ><a href="/lanonce/auth/history/lan/inComing">Mes lans à venir</a></li>
	  <li><a href="#">Mes lans passées</a></li>
    </ul>
  </div>
</nav>
</div>
</div>
</div>
<ul>
<%
ArrayList  id_game = new ArrayList();
  
   Calendar today = Calendar.getInstance();
   boolean nolan = true;

   try {
	    // Vérification avec l'id de la session de l'utilisateur si il participe a une lan dans la base "participer_lan"
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://mysql-lanonce.alwaysdata.net/lanonce_bdd", "lanonce", "fifou707");
        Statement smt = con.createStatement();
        ResultSet r = smt.executeQuery("select id_lan from participer_lans where id_user='" + session.getAttribute("id") + "' ;");
        while (r.next()) {
        	id_game.add(r.getString("id_lan"));
        	
        }
        // Si il participe, on accede au élément de la Lan ou il participe pour afficher les informations que l'on souhaite
        // Ensuite on compare la date de lan et on la compare avec la date actuel 
        for(int i = 0; i < id_game.size(); i++)
        {
          
	        Statement smt1 = con.createStatement();
	        ResultSet r1 = smt.executeQuery("select * from lans where id_url='" + id_game.get(i) + "';");
	        while (r1.next()) {

	        	 Calendar date = Calendar.getInstance() ;
	        	 date.setTime( r1.getDate("date"));
	        	 
	        	if(date.getTime().before(today.getTime())){
	        		nolan= false;
	        		%>
	        	
		        	<li>
		        	<a href="/lanonce/auth/displayLan?id=<%out.println(r1.getString("id_url"));%>">
		        	<h1>lan :</h1>
		        	<p>
		        	<% 
		        	out.println(r1.getString("namelan"));
		        	%>
		        	</p>
		        	<div>
		        	sur le jeux: 
		        	</div>
		        	<p>
		        	<% 
		        	out.println(r1.getString("nameGame"));
		        	%>
		        	</p>
		        	<div>
		        	le: 
		        	</div>
		        	<p>
		        	<% 
		        	out.println(r1.getString("date"));
		        	%>
		        	</p>
		        	</a>
		        	</li>
		        	<% 
		        	}
	        }
        
        } 
        con.close();
   } catch (Exception e) {
        e.printStackTrace();
        out.println(e);
   }
   if(nolan){
%>
<h1>pas de lan réalisé </h1>
	<%
	
}
%>
</ul>
</body>

</body>
</html>