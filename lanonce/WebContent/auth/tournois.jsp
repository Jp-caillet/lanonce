<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
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


<script>
$(document).ready(function () {

    var navListItems = $('div.setup-panel div a'),
            allWells = $('.setup-content'),
            allNextBtn = $('.nextBtn');

    allWells.hide();

    navListItems.click(function (e) {
        e.preventDefault();
        var $target = $($(this).attr('href')),
                $item = $(this);

        if (!$item.hasClass('disabled')) {
            navListItems.removeClass('btn-primary').addClass('btn-default');
            $item.addClass('btn-primary');
            allWells.hide();
            $target.show();
            $target.find('input:eq(0)').focus();
        }
    });

    allNextBtn.click(function(){
        var curStep = $(this).closest(".setup-content"),
            curStepBtn = curStep.attr("id"),
            nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
            curInputs = curStep.find("input[type='text'],input[type='url']"),
            isValid = true;

        $(".form-group").removeClass("has-error");
        for(var i=0; i<curInputs.length; i++){
            if (!curInputs[i].validity.valid){
                isValid = false;
                $(curInputs[i]).closest(".form-group").addClass("has-error");
            }
        }

        if (isValid)
            nextStepWizard.removeAttr('disabled').trigger('click');
    });			

    $('div.setup-panel div a.btn-primary').trigger('click');
});
</script>


</body>
</html>