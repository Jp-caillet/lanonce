<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/contactUsPage.css">
</head>
<body>

  <%@ include file="adminMenu.jsp" %>
  <%@ include file="adminMenuLan.jsp" %>
</br></br></br>
<div class="container">

	<form action="contactus" method="post">
	    <label for="fname">Ton email: </label>
	    <input type="text" id="email" name="fromEmail" placeholder="Ton email..">
	
	    <label for="lname">Ton objet: </label>
	    <input type="text" id="subject" name="subject" placeholder="Ton objet..">
	
	    <label for="subject">Message</label>
	    <textarea id="message" name="message" placeholder="Message.." style="height:200px"></textarea>
	
		<input type="submit"><span class="message">${message}</span>
   </form>
  
</div>

</br></br></br></br></br></br>
<%@ include file="adminFooter.jsp" %>

</body>
</html>