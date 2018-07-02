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
<title></title>

</head>
<body>

<%@ include file="/auth/adminMenu.jsp" %>

<div class="row">
<div class="col-md-offset-2 col-md-7">
<div class="form-group">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container">
      <ul class="nav navbar-nav">
	  <li ><a href="#">Mes lans à venir</a></li>
	  <li><a href="/lanonce/auth/history/lan/done">Mes lans passées</a></li>
    </ul>
  </div>
</nav>
</div>
</div>
</div>
<%
ArrayList  id_game = new ArrayList();
  
   Calendar today = Calendar.getInstance();
   boolean nolan = true;

   try {
	   
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://mysql-lanonce.alwaysdata.net/lanonce_bdd", "lanonce", "fifou707");
        Statement smt = con.createStatement();
        ResultSet r = smt.executeQuery("select id_lan from participer_lans where id_user='" + session.getAttribute("id") + "' ;");
        while (r.next()) {
        	id_game.add(r.getString("id_lan"));
        	
        }
        for(int i = 0; i < id_game.size(); i++)
        {
          
        Statement smt1 = con.createStatement();
        ResultSet r1 = smt.executeQuery("select * from lans where id_url='" + id_game.get(i) + "';");
        while (r1.next()) {
        
        	 Calendar date = Calendar.getInstance() ;
        	 date.setTime( r1.getDate("date"));
        	if(date.getTime().after(today.getTime())){
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
<h1>pas de lan à venir </h1>
	<%
	
}
%>


<ul>
</ul>
</body>
</html>