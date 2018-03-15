<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

 <form method="post" action="connectionServlet">
    
	<div class="container">
	<div class="row">
	<div class="col-md-offset-2 col-md-8">
	<h1> Connexion <br/> <small> Merci de vous connecter </small></h1>
	</div>
	</div>
	
	<div class="row">
	<div class="col-md-offset-2 col-md-7">
	<div class="form-group">
	<label for="Email">Email address</label>
	<input type="text" class="form-control" id="email" placeholder="Enter email" name="email">
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
	<input type="submit" class="btn btn-primary" value="Connexion"></input>
	</div>
	</div>
	</div>
</form>
 
</body>
</html>