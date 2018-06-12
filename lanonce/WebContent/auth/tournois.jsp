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
  
  <div class="container">
  <div class="stepwizard">
    <div class="stepwizard-row setup-panel">
        <div class="stepwizard-step">
            <a href="#step-1" type="button" class="btn btn-primary btn-circle">1</a>
            <p>Step 1</p>
        </div>
        <div class="stepwizard-step">
            <a href="#step-2" type="button" class="btn btn-default btn-circle" disabled="disabled">2</a>
            <p>Step 2</p>
        </div>
    </div>
  </div>
  
  <form method="post" action="">
    <div class="row setup-content" id="step-1">
        <div class="col-xs-12">
            <div class="col-md-12">
                <h3> Step 1</h3>
                <div class="form-group">
                    <label for="Nom">Picture</label>
                    <input type="file" name="picture" value="picture" id="picture"><label for="picture"> Select a file to upload</label>
                </div>
                <div class="form-group">
                    <label for="Nom">NOM DU TOURNOI</label>
                    <input type="text" class="form-control" id="nameTournois" placeholder="nameTournois" name="nameTournois">
                </div>
                <div class="form-group">
                    <label for="Nom">NOM DU JEUX</label>
                    <input type="text" class="form-control" id="nameGame" placeholder="nameGame" name="nameGame">
                </div>
                <div class="form-group">
                    <label for="Nom">ADRESSE</label>
                    <input type="text" class="form-control" id="lieux" placeholder="lieux" name="lieux">
                </div>
                <div class="form-group">
                    <label for="Nom">DATE ET HEURE</label>
                    <input type="date" class="form-control" id="date" placeholder="date" name="date">
                </div>
                <button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >Next</button>
            </div>
        </div>
    </div>
    <div class="row setup-content" id="step-2">
        <div class="col-xs-12">
            <div class="col-md-12">
                <h3> Step 2</h3>
                <div class="form-group">
                        <label for="Nom">Description</label>
                    <input type="text" class="form-control" id="description" placeholder="description" name="description">
                </div>
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
                <div class="form-group">
                        <div class="form-group">
                        <label for="Nom">SELECTIONNER UN TYPE DE TOURNOIS</label>
                    <SELECT name="typeTournois" size="1">
                        <OPTION>League
                        <OPTION>Coupe
                    </SELECT>
                </div>
                <div class="form-group">
                    <label for="Nom">INFORMATION COMPLEMENTAIRE? </label>
                    <input type="text" class="form-control" id="info" placeholder="info" name="info">
                </div>
                <button class="btn btn-success btn-lg pull-right" type="submit">Finish!</button>
            </div>
        </div>
    </div>
  </div>
</form>
</div>
<!-- Javascript -->
<script language='Javascript' type='text/javascript'
 src='../js/lanPage.js'></script>
</body>
</html>