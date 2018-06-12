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

            <h1>REJOINDRE UNE LAN & TOURNOIS </h1>
            </br>
            </br>
            Search name game:

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
	            	var titre = ["picture:","game:","date:","lieux:","id_url:"];

	            	$.ajax({
	            	    "type": "POST",
	            	    "url": "../auth/searchLan",
	            	    "data": {
	                        term: nameGame
	                },
	            	    "success": function (r) {
	            	    	
		            	    	if (r.length == 0){
		            	    	    $("<div id='a'>Ce jeux n'existe pas</div>").appendTo(document.body);
		            	    	}							
						
		            	    	
	            			var j = 0;
						var DOM ="";
						var nbrTournoisTrouver = parseInt(r[r.length-1]);
						var k = 0;
						var pictureTournois, gameTournois, dateTournois, lieuxTournois, urlTournois;
						var pictureLan, gameLan, dateLan, lieuxLan, urlLan;
						
						// Tableau Tournois
						var tabPicTournois=[];
						var tabGameTournois =[];
						var tabDateTournois =[];						
						var tabLieuxTournois =[];
						var tabUrlTournois =[];	
						
						// Tableau Lan
						var tabPicLan=[];
						var tabGameLan=[];
						var tabDateLan=[];
						var tabLieuxLan=[];
						var tabUrlLan=[];

					
	            			for(var i = 0; i<r.length-1;i++) {
	            				console.log(r[i]);
            					if(j==5){
            						j=0;
            						k++;
            					}
            					if(nbrTournoisTrouver > k){
            						if(j == 0){
            							pictureTournois = r[i];
            							tabPicTournois.push(pictureTournois);
                					}
                					if(j == 1 ){
                						gameTournois = r[i];
                						tabGameTournois.push(gameTournois);
                					}
                					if(j == 2){
                						dateTournois = r[i];
                						tabDateTournois.push(dateTournois);
                					}
                					if(j == 3){
                						lieuxTournois = r[i];
                						tabLieuxTournois.push(lieuxTournois);
                					}
                					if(j == 4){
                						urlTournois = r[i];
                						tabUrlTournois.push(urlTournois);
                						//console.log(urlTournois);
                					}
            					} else {	
            						if(j == 0){
            							pictureLan = r[i];
            							tabPicLan.push(pictureLan);
                					}
                					if(j == 1 ){
                						gameLan = r[i];
                						tabGameLan.push(gameLan);
                					}
                					if(j == 2){
                						dateLan = r[i];
                						tabDateLan.push(dateLan);
                					}
                					if(j == 3){
                						lieuxLan = r[i];
                						tabLieuxLan.push(lieuxLan);
                						
                					}
                					if(j == 4){
                						urlLan = r[i];
                						console.log("urlLan");
                						console.log(urlLan);
                						tabUrlLan.push(urlLan);
                						console.log(urlLan);
                					}
            					}          					
            					j++;	
	            			}  
	            			
	            			
	            			for(var t= 0 ; t< tabPicTournois.length ; t++){
    							DOM += "<tr>";
    							DOM += "<h1> TOURNOIS </h1>";
    							DOM += "<td><h4>picture:</h4>" + tabPicTournois[t] + "</td>";
    							DOM += "<td><h4>nom du jeux:</h4>" + tabGameTournois[t] + "</td>";
    							DOM += "<td><h4>Date:</h4>" + tabDateTournois[t] + "</td>";
    							DOM += "<td><h4>Lieux:</h4>" + tabLieuxTournois[t] + "</td>";
    							DOM += "</tr></br>";
       						DOM += "<a href='/lanonce/displayTournois?id="+ tabUrlTournois[t] +"'";
       						DOM += "<button type=submit>CLIQUEZ ICI POUR PARTICIPER</button>";
    							DOM += "</a>";
    							DOM += "</br>";
	            			}
	            			
	            			for(var g= 0 ; g< tabPicLan.length ; g++){
    							DOM += "<tr>";
    							DOM += "<h1> LAN </h1>";		
    							DOM += "<td><h4>picture:</h4>" + tabPicLan[g] + "</td>";
    							DOM += "<td><h4>nom du jeux:</h4>" + tabGameLan[g] + "</td>";
    							DOM += "<td><h4>Date:</h4>" + tabDateLan[g] + "</td>";
    							DOM += "<td><h4>Lieux:</h4>" + tabLieuxLan[g] + "</td>";
    							DOM += "</tr></br>";
       						DOM += "<a href='/lanonce/displayLan?id="+ tabUrlLan[g] +"'";
       						DOM += "<button type=submit>CLIQUEZ ICI POUR PARTICIPER</button>";
    							DOM += "</a>";
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