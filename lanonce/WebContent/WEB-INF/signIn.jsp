<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign in</title>
</head>
<body>

<%@ include file="menu.jsp" %>

  <form method="post" action="signInServlet">
   
	<div class="container">
	<div class="row">
	<div class="col-md-offset-2 col-md-8">
	<h1> Inscription <br/> <small> Merci de renseigner vos informations </small></h1>
	</div>
	</div>
	</div>
	
	<div class="row">
	<div class="col-md-offset-2 col-md-7">
	<div class="form-group">
	<label for="Nom">Pseudo</label>
	<input type="text" class="form-control" id="pseudo" placeholder="prenom" name="pseudo">
	</div>
	</div>
	</div>
	
	<div class="row">
	<div class="col-md-offset-2 col-md-7">
	<div class="form-group">
	<label for="Nom">Nom</label>
	<input type="text" class="form-control" id="nom" placeholder="Nom" name="nom">
	</div>
	</div>
	</div>
	
	<div class="row">
	<div class="col-md-offset-2 col-md-7">
	<div class="form-group">
	<label for="Nom">Prénom</label>
	<input type="text" class="form-control" id="prenom" placeholder=prenom" name="prenom">
	</div>
	</div>
	</div>
	
	<div class="row">
	<div class="col-md-offset-2 col-md-7">
	<div class="form-group">
	<label for="Nom">Ville</label>
	<input type="text" class="form-control" id="ville" placeholder="ville" name="ville">
	</div>
	</div>
	</div>
	
	<div class="row">
	<div class="col-md-offset-2 col-md-7">
	<div class="form-group">
	<label for="Email">Email address</label>
	<input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
	</div>
	</div>
	</div>
	
	<div class="row">
	<div class="col-md-offset-2 col-md-7">
	<div class="form-group">
	<label for="Email">Enter your password</label>
	<input type="password" class="form-control" id="password" placeholder="Enter password" name="password">
	</div>
	</div>
	</div>
	
	<br/>
	<div class="row">
	<div class="col-md-offset-5 col-md-1">
	<input type="submit" class="btn btn-primary"></input>
	</div>
	</div>
	
   </form>

</body>
</html>