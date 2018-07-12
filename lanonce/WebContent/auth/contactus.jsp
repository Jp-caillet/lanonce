<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/contactUsPage.css">
<title>Nous contactez</title>
</head>
<body>

  <%@ include file="adminMenu.jsp" %>
  <%@ include file="adminMenuLan.jsp" %>	
	
	<div class="contenaire">
	
		<div class="texte">
			<p><h1>CONTACTEZ-NOUS</h1></p>
			<p>Une communication facile est l'une de nos valeurs primordiales. </br> N'éshitez donc pas à nous </br>contacter.</p>
			<p>Nous sommes la pour vous aidez et nous </br> efforcons de vous répondre le jour ouvré suivant</br>votre demande. (Veuillez noter nos horaires</br>d'ouvertures: du Lundi au Vendredi de 10h à</br>18H30 ECT)</p>
			
			
		</div>
		
	    <div class="w3-twothird" style="padding-right: 30px; float: right; margin-top:20px">  
	      <div class="w3-container w3-card w3-white w3-margin-bottom">   
		   	 	<form action="contactus" method="post">
				    <label for="fname">Adresse email* </label>
				    <input type="text" id="email" name="fromEmail" placeholder="Ton email..">
				
				    <label for="lname">Objet </label>
				    <input type="text" id="subject" name="subject" placeholder="Ton objet..">
				
				    <label for="subject">Message</label>
				    <textarea id="message" name="message" placeholder="Message.." style="height:200px"></textarea>
				
					<input type="submit"><span class="message">${message}</span>
			   </form>		    
	      </div>
	    </div>
	</div>
	
	<%@ include file="adminFooter.jsp" %>

</body>
</html>