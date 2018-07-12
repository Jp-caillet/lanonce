<%@page import="java.sql.Date"%>
<%@page import="java.awt.print.Printable"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../css/displayLanPage.css">
<title>Insert title here</title>
</head>
<body>

<%@ include file="adminMenu.jsp" %>

<%
   String nameLan = "";
   String nameGame = "";
   String lieux = "";
   String description = "";
   String info = "";
   Date date = null ;
   Integer nb_user = 0;
   
   try {
	   
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://mysql-lanonce.alwaysdata.net/lanonce_bdd", "lanonce", "fifou707");
        Statement smt = con.createStatement();
        ResultSet r = smt.executeQuery("select * from lans where(id_url='" +  request.getParameter("id") + "');");
        
        while (r.next()) {
        	nameLan = r.getString("nameLan");
        	nameGame = r.getString("nameGame");
        	lieux = r.getString("lieux");
        	description = r.getString("description");
        	info = r.getString("info");
        	nb_user = r.getInt("nb_user");
        	date = r.getDate("date");
        }
        con.close();
   } catch (Exception e) {
        e.printStackTrace();
        out.println(e);
   }
%>
<div class="texte">
	<div class="contenaire">
		<h1>Nom: <%out.println(nameLan);%> </h1>
		<p>Date: <%out.println(date);%> </p> 
		<p>Name game: <%out.println(nameGame);%></p>
		<p>Lieux: <%out.println(lieux);%></p>
		<p>Description: <%out.println(description);%></p>
		<p>Info: <%out.println(info);%></p>
		<p>Nombre user: <%out.println(nb_user);%></p>
		</br>
<%
if((boolean) request.getAttribute("already")){
%>
<form method="post" action="">
<div class="row">
<div class="col-md-offset-5 col-md-1">
<div class="bouton">
<input type="submit" value="JE CONFIRME" class="btn btn-primary"></input>
</div>
</div>
</div>
</form>
<%
}else{
%>
<div class="row">
<div class="col-md-offset-5 col-md-1">
Vous participez déja à cette lan
</div>
</div>
<%
}
%>

</div>
</div>

<%@ include file="adminFooter.jsp" %>

</body>
</html>