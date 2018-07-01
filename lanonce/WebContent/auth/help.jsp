<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/helpPage.css">
<title>HELP</title>
</head>
<body>
  <%@ include file="adminMenu.jsp" %>
  <%@ include file="adminMenuLan.jsp" %>
  
  <div class="contenaire">
  	<h3><b>BONJOUR, COMMENT POUVONS NOUS VOUS AIDER</b></h3>
  		<article class="grille">
		    <section><p style="text-align: center;padding-top: 80px;"><b><a href="/lanonce/auth/contactus">PAIEMENT</a></b></p></section>
		    <section><p style="text-align: center;padding-top: 80px;"><b><a href="/lanonce/auth/lanStep1">CREE UNE LAN PARTY</a></b></p></section>
		    <section><p style="text-align: center;padding-top: 80px;"><b><a href="/lanonce/auth/tournois">CREE UN TOURNOI</a></b></p></section>

		    <section><p style="text-align: center;padding-top: 80px;"><b><a href="/lanonce/auth/profil">MODIFIER VOTRE PROFIL</a></b></p></section>
		    <section><p style="text-align: center;padding-top: 80px;"><b><a href="">COMMENT INVITER VOS AMIS</a></b></p></section>
		    <section><p style="text-align: center;padding-top: 80px;"><b><a href="">LES AVANTAGES DU COMPTE PREMIUM</a></b></p></section>		
		</article> 
  	<h3><b>VOUS RENCONTREZ UN PROBLEME? </b></h3>
  	<p style="text-align: center"><button><a href="/lanonce/auth/contactus" >CONTACTEZ NOUS</a></button></p>
  </div>
  
  <%@ include file="adminFooter.jsp" %>
</body>
</html>