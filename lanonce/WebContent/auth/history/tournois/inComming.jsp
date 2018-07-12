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
<link rel="stylesheet" type="text/css" href="../../css/adminMenuLanPage.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>



<%@ include file="/auth/adminMenu.jsp" %>

<div class="topnav2">
	  <a href="/lanonce/auth/history/tournois?status=open">Mes tournois à venir</a>
	  <a href="/lanonce/auth/history/tournois?status=current">Mes tournois en cours</a>
	  <a href="/lanonce/auth/history/tournois?status=done">Mes tournois terminés</a>
</div>
<ul>
<%
ArrayList  id_game = new ArrayList();
  
   Calendar today = Calendar.getInstance();
   boolean nolan = true;
	
   try {
	    // VÃ©rification avec l'id de la session de l'utilisateur si il participe a une lan dans la base "participer_lan"
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://mysql-lanonce.alwaysdata.net/lanonce_bdd", "lanonce", "fifou707");
        Statement smt = con.createStatement();
        ResultSet r = smt.executeQuery("select id_tournois from participer_tournois where id_user='" + session.getAttribute("id") + "' ;");
        while (r.next()) {
        	id_game.add(r.getString("id_tournois"));
        	
        }
        // Si il participe, on accede au Ã©lÃ©ment de la Lan ou il participe pour afficher les informations que l'on souhaite
        for(int i = 0; i < id_game.size(); i++)
        {
          
        Statement smt1 = con.createStatement();
        ResultSet r1 = smt.executeQuery("select * from tournois where id_url='" + id_game.get(i) + "' and status='open';");
        while (r1.next()) {
      
       	
       		nolan= false;
	        	%>
	        	
	        	<li>
	        	<a href="/lanonce/auth/tournois/incoming?id=<%out.println(r1.getString("id_url"));%>">
	        	<h1>tournois :</h1>
	        	<p>
	        	<% 
	        	out.println(r1.getString("nameTournois"));
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
	        	<div>
	        	Ã  : 
	        	</div>
	        	<p>
	        	<% 
	        	out.println(r1.getString("lieux"));
	        	%>
	        	</p>
	        	</a>
	        	</li>
	        	<% 
       		}
        	}
     
        con.close();
   } catch (Exception e) {
        e.printStackTrace();
        out.println(e);
   }
   if(nolan){
%>
<h1>pas de tournois Ã  venir </h1>
	<%
	
}
%>

</body>
</html>