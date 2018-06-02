<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta charset="ISO-8859-1">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
</head>
<body>
    <%@ include file="adminMenu.jsp" %>
    <%@ include file="adminMenuLan.jsp" %>
    
    <div class="search-container">
        <div class="ui-widget">
            Jeux:
            <input type="text" id="search" name="search" class="search" />
            <input type="button" id="bouton" value="Bouton à cliquer">
            <div id="display"></div>
        </div>
    </div>
    
    <script>
    $(document).ready(function() {
        $(function() {
        	
	        	$("#bouton").click(affichage);
	        	
	        	function affichage(){  		 
	            	var nameGame =  $("#search").val();
	            	var messageBox  = document.getElementById("display");

	            	$.ajax({
	            	    "type": "POST",
	            	    "url": "../auth/searchLan",
	            	    "data": {
	                        term: nameGame
	                },
	            	    "success": function (r) {
	            	    		console.log(r);
		            	    	if (r.length == 0){
		            	    	    $("<div id='a'>Ce jeux n'existe pas</div>").appendTo(document.body);
		            	    	}							
						var DOM="";
						for(i = 0; i < r.length; i++) {

							DOM += "<tr>";
							DOM += "<td>" + r[i]+ "</td>";
							DOM += "</tr>";
							DOM += "</br>";
							
						}
						messageBox.innerHTML = DOM;
	            	    }
	            	});  	
	        	}
        });
    });
</script>
</body>
</html>