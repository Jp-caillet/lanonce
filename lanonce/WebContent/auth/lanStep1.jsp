<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lan étape 1</title>
</head>
<body>
  <%@ include file="adminMenu.jsp" %>
  <%@ include file="adminMenuLan.jsp" %>

  <form method="post" action="">
	
	<div class="row">
	<div class="col-md-offset-2 col-md-7">
	<div class="form-group">
	<label for="Nom">Picture</label>
	<input type="file" name="picture" value="picture" id="picture"><label for="picture"> Select a file to upload</label>
	</div>
	</div>
	</div>
	
	<div class="row">
	<div class="col-md-offset-2 col-md-7">
	<div class="form-group">
	<label for="Nom">NOM DE LA LAN PARTY</label>
	<input type="text" class="form-control" id="nameLan" placeholder="nameLan" name="nameLan">
	</div>
	</div>
	</div>

	<div class="row">
	<div class="col-md-offset-2 col-md-7">
	<div class="form-group">
	<label for="Nom">ADRESSE</label>
	<input type="text" class="form-control" id="lieux" placeholder="lieux" name="lieux">
	</div>
	</div>
	</div>

	<div class="row">
	<div class="col-md-offset-2 col-md-7">
	<div class="form-group">
	<label for="Nom">DATE ET HEURE</label>
	<input type="date" class="form-control" id="date" placeholder="date" name="date">
	</div>
	</div>
	</div>

	<div class="row">
	<div class="col-md-offset-2 col-md-7">
	<div class="form-group">
	<label class="checkbox-inline"><input type="checkbox" value="">Les joueurs peuvent inviter des amis</label>
	</br>
	<label class="checkbox-inline"><input type="checkbox" value="">Adresse visible qu'aux participants</label>
	</div>
	</div>
	</div>

	<div class="row">
	<div class="col-md-offset-2 col-md-7">
	<div class="form-group">
	<label for="Nom">Description</label>
	<input type="text" class="form-control" id="description" placeholder="description" name="description">
	</div>
	</div>
	</div> 
	
	<div class="row">
	<div class="col-md-offset-2 col-md-7">
	<div class="form-group">
	<label for="Nom">INFORMATION COMPLEMENTAIRE? </label>
	<input type="text" class="form-control" id="info" placeholder="info" name="info">
	</div>
	</div>
	</div> 
	
	<div class="row">
	<div class="col-md-offset-2 col-md-7">
	<div class="form-group">
	<label class="checkbox-inline"><input type="checkbox" value="">CIGARETTE? </label>
	</br>
	<label class="checkbox-inline"><input type="checkbox" value="">BIERE? </label>
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