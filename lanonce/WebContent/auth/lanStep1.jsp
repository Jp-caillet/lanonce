<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<style>
body{ 
    margin-top:40px; 
}

.stepwizard-step p {
    margin-top: 10px;
}

.stepwizard-row {
    display: table-row;
}

.stepwizard {
    display: table;
    width: 100%;
    position: relative;
}

.stepwizard-step button[disabled] {
    opacity: 1 !important;
    filter: alpha(opacity=100) !important;
}

.stepwizard-row:before {
    top: 14px;
    bottom: 0;
    position: absolute;
    content: " ";
    width: 100%;
    height: 1px;
    background-color: #ccc;
    z-order: 0;

}

.stepwizard-step {
    display: table-cell;
    text-align: center;
    position: relative;
}

.btn-circle {
  width: 30px;
  height: 30px;
  text-align: center;
  padding: 6px 0;
  font-size: 12px;
  line-height: 1.428571429;
  border-radius: 15px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lan étape 1</title>
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
                    <label class="control-label">NOM DE LA PARTY</label>
                    	<input type="text" class="form-control" required="required" id="nameLan" placeholder="nameLan" name="nameLan">
                </div>
                <div class="form-group">
                    <label class="control-label">JEUX</label>
                    <input maxlength="100" type="text" required="required" class="form-control" placeholder="Enter Last Name" name="game"/>
                </div>
                <div class="form-group">
                    <label for="Nom">Description</label>
                    <input type="text" class="form-control" required="required" id="description" placeholder="description" name="description">
                </div>
                <div class="form-group">
                    <label for="Nom">INFORMATION COMPLEMENTAIRE? </label>
                    <input type="text" class="form-control" id="info" placeholder="info" name="info">
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
	                <label for="Nom">ADRESSE</label>
	                <input type="text" class="form-control" id="lieux" placeholder="lieux" name="lieux">
                </div>
                <div class="form-group">
	                <label for="Nom">DATE ET HEURE</label>
	                <input type="date" class="form-control" id="date" placeholder="date" name="date">
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
	                <label class="checkbox-inline"><input type="checkbox" name="checkedRows" value="true">Party privé</label>
                </div>
				<button class="btn btn-success btn-lg pull-right" type="submit">Finish!</button>
            </div>
        </div>
    </div>
</form>
</div>

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