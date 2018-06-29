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
<link rel="stylesheet" type="text/css" href="../css/searchLanPage.css">
<link href="https://developers.google.com/maps/documentation/javascript/examples/default.css" rel="stylesheet">
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDZP8IN8kZ1PsZko2hlbHCyOckwDvcAuaY"></script>
</head>
<body>
    <%@ include file="adminMenu.jsp" %>
    <%@ include file="adminMenuLan.jsp" %>
    
    
    <div id=baniere>
		<div id=baniere_gauche> 
		    <input type="text" id="search" name="search" class="search" />
            <input type="button" id="bouton" value="Bouton à cliquer">
            
            </br>
            
            <div id="display"></div>
            
                     
		</div>
		<div id=baniere_droite> 
			<input type="text" id="search" name="search" class="search" />
            <input type="button" id="bouton" value="Bouton à cliquer" >  
		</div>
	</div>
	
	<div id="map_canvas_00" ></div>
    
    </br></br> </br></br> </br></br> </br></br> </br></br> </br></br> </br></br> </br></br>
    <%@ include file="adminFooter.jsp" %>
    <script>
    
    $("#bouton").click(affichage);
    
    //var geocoder;
    //var map;
    //var marker;

    
    function initialize(id, adressLieux) {
    	console.log(adressLieux);
        var mapOptions = {
        	      zoom: 17,
        	      mapTypeId: google.maps.MapTypeId.ROADMAP
        	    }
        
    	    var map = new google.maps.Map(document.getElementById(id), mapOptions);
    	    codeAddress(map, adressLieux);   
    }
    
    function codeAddress(map, adressValue) {
    	console.log(adressValue);
    	var geocoder = new google.maps.Geocoder();
    	var marker;
      geocoder.geocode( { 'address': adressValue}, function(results, status) {
    	  console.log(results);
        if (status == google.maps.GeocoderStatus.OK) {
          map.setCenter(results[0].geometry.location);
          if(marker)
            marker.setMap(null);
          marker = new google.maps.Marker({
              map: map,
              position: results[0].geometry.location,
              draggable: true
          });
        } else {
          alert('Geocode was not successful for the following reason: ' + status);
        }
      });
    }
    
	function affichage(){ 
	var DOM = "";
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
    	    	
    	    		for(i=0;i<r.length;i++) {
    	    			for(j=0;j<r[i].length;j++) {
    	    				var obj = r[i][j];
    	    				
    	    				for(var key in obj) {
    	    					if(key == 1) {
            	    				var valueObj = Object.values(obj);
            	    				
            	    				DOM += "<div class="+ "recherche" + ">";
    							DOM += "<tr>";
    							DOM += "<h1> LAN </h1>";
    							DOM += "<td><h4>Date:</h4>" + valueObj[0].date + "</td>";
       						DOM += "<a href='/lanonce/auth/displayLan?id="+ valueObj[0].id_url +"'";
       						DOM += "<button type=submit>CLIQUEZ ICI POUR PARTICIPER</button>";
    							DOM += "</a>";
							DOM += "</br>";
    							DOM += "<td><h4>Lieux:</h4>" + valueObj[0].lieux + "</td>";
    							DOM += "<td><h4>nom du jeux:</h4>" + valueObj[0].nameGame + "</td>";
    							DOM += "<td><h4>picture:</h4>" + valueObj[0].picture + "</td>";
    							DOM += "</tr></br>";
    							DOM += "<div id=\"map_canvas_"+ i + j +"\" style=\"height:30%;width:30%;top:30px\"></div>";
    							DOM += "</div>";
    							DOM += "</br>";
    	    					} else {
    	    						var valueObj = Object.values(obj);
    	    						
            	    				DOM += "<div class="+ "recherche" + ">";
    							DOM += "<tr>";
    							DOM += "<h1> TOURNOIS </h1>";
    							DOM += "<td><h4>Date:</h4>" + valueObj[0].date + "</td>";
       						DOM += "<a href='/lanonce/auth/displayTournois?id="+ valueObj[0].id_url +"'";
							DOM += "</br>";
       						DOM += "<button type=submit>CLIQUEZ ICI POUR PARTICIPER</button>";
    							DOM += "</a>";
    							DOM += "<td><h4>Lieux:</h4>" + valueObj[0].lieux + "</td>";
    							DOM += "<td><h4>nom du jeux:</h4>" + valueObj[0].nameGame + "</td>";
    							DOM += "<td><h4>picture:</h4>" + valueObj[0].picture + "</td>";
    							DOM += "</tr></br>";
    							DOM += "<div id=\"map_canvas_"+ i + j +"\"></div>";
    							DOM += "</div>";
    							DOM += "</br>";
    	    					}
    	    					messageBox.innerHTML = DOM;
    	    					initialize("map_canvas_"+ i + j, valueObj[0].lieux);
    	    					console.log("map_canvas_"+ i + j);
    	    				}	
    	    			}
    	    		}
    	    		
        	}
    	});
};

</script>
</body>
</html>