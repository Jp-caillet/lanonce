<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lan/Tournois</title>
<link rel="stylesheet" type="text/css" href="../css/createPage.css">
</head>
<body>
  <%@ include file="adminMenu.jsp" %>
  <%@ include file="adminMenuLan.jsp" %>
	
	<div class="flex-container">
		<div class="flex-right">
			<a href="/lanonce/auth/lanStep1">
				<img class="img1" src="../images/LanVF.jpg"/>
			</a>
		</div>
		<div class="flex-left">
			<a href="/lanonce/auth/tournois">
				<img class="img2" src="../images/new.jpg"/>
			</a>
		</div>
	</div>
	
    </br></br></br></br></br></br>
    <%@ include file="adminFooter.jsp" %>
</body>
</html>