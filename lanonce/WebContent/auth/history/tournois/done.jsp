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
</head>
<body>
<%@ include file="/auth/adminMenu.jsp" %>
<div class="row">
<div class="col-md-offset-2 col-md-7">
<div class="form-group">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container">
      <ul class="nav navbar-nav">
	  <li ><a href="/lanonce/auth/history/tournois?status=open">Mes tournois à venir</a></li>
	  <li><a href="/lanonce/auth/history/tournois?status=current">Mes tournois en cours</a></li>
	  <li><a href="#">Mes tournois terminés</a></li>
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
	   
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://mysql-lanonce.alwaysdata.net/lanonce_bdd", "lanonce", "fifou707");
        Statement smt = con.createStatement();
        ResultSet r = smt.executeQuery("select id_tournois from participer_tournois where id_user='" + session.getAttribute("id") + "' ;");
        while (r.next()) {
        	id_game.add(r.getString("id_tournois"));
        	
        }
        for(int i = 0; i < id_game.size(); i++)
        {
          
        Statement smt1 = con.createStatement();
        ResultSet r1 = smt.executeQuery("select * from tournois where id_url='" + id_game.get(i) + "' and status='done';");
        while (r1.next()) {
        
        	 
        		nolan= false;
        	%>
        	
        	<li>
        	<a href="/lanonce/auth/displayTournois?id=<%out.println(r1.getString("id_url"));%>">
        	<h1>lan :</h1>
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
        	à : 
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
<h1>pas de tournois fini </h1>
	<%
	
}
%>
</body>
</html>