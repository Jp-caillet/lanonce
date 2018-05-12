<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lan/Tournois</title>
</head>
<body>
  <%@ include file="adminMenu.jsp" %>
  <%@ include file="adminMenuLan.jsp" %>


	<div class="row">
	<div class="col-md-offset-2 col-md-7">
	<div class="form-group">
    <button type="button" class="btn btn-warning"><a href="/lanonce/auth/lanStep1">Organiser une Lan PARTY</a></button>
    <button type="button" class="btn btn-warning"><a href="/lanonce/auth/lanStep1">Organiser un tournois</a></button>
	</div>
	</div>
	</div>
</body>
</html>