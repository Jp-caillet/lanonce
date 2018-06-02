<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	<label for="Nom">NOM DU TOURNOI</label>
	<input type="text" class="form-control" id="nameLan" placeholder="nameLan" name="nameTournois">
	</div>
	</div>
	</div>
	
	<div class="row">
	<div class="col-md-offset-2 col-md-7">
	<div class="form-group">
	<label for="Nom">NOM DU JEUX</label>
	<input type="text" class="form-control" id="nameGame" placeholder="nameGame" name="nameGame">
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
	<label class="checkbox-inline"><input type="checkbox" name="checkedPriv" value="true">Party privé</label>
	</div>
	</div>
	</div>

	<div class="row">
	<div class="col-md-offset-2 col-md-7">
	<div class="form-group">
	<label class="checkbox-inline"><input type="checkbox" name="checkedPay" value="true">Party payante</label>
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
	<label for="Nom">SELECTIONNER UN NOMBRE DE PARTICIPANT</label>
		<SELECT name="nombreUser" size="1">
			<OPTION>1
			<OPTION>2
			<OPTION>3
			<OPTION>4
			<OPTION>5
			<OPTION>6
			<OPTION>7
			<OPTION>8
			<OPTION>9
			<OPTION>10
		</SELECT>
	</div>
	</div>
	</div> 

	<div class="row">
	<div class="col-md-offset-2 col-md-7">
	<div class="form-group">
	<label for="Nom">SELECTIONNER UN TYPE DE TOURNOIS</label>
		<SELECT name="typeTournois" size="1">
			<OPTION>League
			<OPTION>Coupe
		</SELECT>
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
		
	<br/>
	<div class="row">
	<div class="col-md-offset-5 col-md-1">
	<input type="submit" class="btn btn-primary"></input>
	</div>
	</div>
	
   </form>

</body>
</html>
</body>
</html>