<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>lan Crée</title>
</head>
<body>

  <%@ include file="adminMenu.jsp" %>
  <%@ include file="adminMenuLan.jsp" %>
  
 <div class="lanFinished">
 	<img class="v" src="../images/valider.png"/>
 	</br></br>
	<h2><b>VOTRE LAN PARTY A BIEN ETE CRÉE</b></br>
	POUR INVITER VOS AMIS, PARTAGER CE LIEN</h2>

    <center>
    		<p style="border: 3px black solid">http://109.232.232.58:8080/lanonce/auth/displayLan?id=<%out.print(request.getAttribute("url"));%></p>
       	</br>
    		<button><a href="/lanonce/auth/home"> Terminer</a></button>
    </center>

       
    	</br></br></br></br>
    <%@ include file="adminFooter.jsp" %>
</div>

</body>
</html>