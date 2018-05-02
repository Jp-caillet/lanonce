<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profil</title>
</head>
<body>
  <%@ include file="adminMenu.jsp" %>


  <form method="post" action="">
	
	<div class="row">
	<div class="col-md-offset-2 col-md-7">
	<div class="form-group">
	<label for="Nom">Picture</label>
	<input type="text" class="form-control" id="picture" placeholder="picture" name="picture">
	</div>
	</div>
	</div>
	
	<div class="row">
	<div class="col-md-offset-2 col-md-7">
	<div class="form-group">
	<label for="Nom">Title</label>
	<input type="text" class="form-control" id="title" placeholder="title" name="title">
	</div>
	</div>
	</div>

	<div class="row">
	<div class="col-md-offset-2 col-md-7">
	<div class="form-group">
	<label for="Nom">Date</label>
	<input type="date" class="form-control" id="date" placeholder="date" name="date">
	</div>
	</div>
	</div>
	
	<div class="row">
	<div class="col-md-offset-2 col-md-7">
	<div class="form-group">
	<label for="Nom">Lieux</label>
	<input type="text" class="form-control" id="lieux" placeholder=lieux" name="lieux">
	</div>
	</div>
	</div>
	
	<div class="row">
	<div class="col-md-offset-2 col-md-7">
	<div class="form-group">
	<label for="Nom">Descriptio,</label>
	<input type="text" class="form-control" id="description" placeholder="description" name="description">
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