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
<style>
#map_canvas {
  height: 100px;
  width: 300px;
  margin: 0px;
  padding: 0px
}
</style>
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
		</div>
		<div id="map_canvas"></div>
	</div>
	
    
    </br></br> </br></br> </br></br> </br></br> </br></br> </br></br> </br></br> </br></br>
    <%@ include file="adminFooter.jsp" %>
    <script>
    
    $("#bouton").click(affichage);
   
    	var geocoder;
    	var map;
    	var bounds = new google.maps.LatLngBounds();

    	function initialize(locations) {
    	  map = new google.maps.Map(
    	    document.getElementById("map_canvas"), {
    	      center: new google.maps.LatLng(48.856614 , 2.352222),
    	      zoom: 13,
    	      mapTypeId: google.maps.MapTypeId.ROADMAP
    	    });
    	  geocoder = new google.maps.Geocoder();

    	  for (i = 0; i < locations.length; i++) {

    	    geocodeAddress(locations, i);
    	  }
    	}
    //	google.maps.event.addDomListener(window, "load", initialize);

    	function geocodeAddress(locations, i) {
    		console.log(locations);
    	  var title = locations[i][0];
    	  var address = locations[i][1];
  	  console.log(address);
    	  var url = locations[i][2];
    	  geocoder.geocode({
    	      'address': locations[i][1]
    	    },

    	    function(results, status) {
    	      if (status == google.maps.GeocoderStatus.OK) {
    	        var marker = new google.maps.Marker({
    	          icon: 'http://maps.google.com/mapfiles/ms/icons/blue.png',
    	          map: map,
    	          position: results[0].geometry.location,
    	          title: title,
    	          animation: google.maps.Animation.DROP,
    	          address: address,
    	          url: url
    	        })
    	        infoWindow(marker, map, title, address, url);
    	        bounds.extend(marker.getPosition());
    	        map.fitBounds(bounds);
    	      } else {
    	        alert("geocode of " + address + " failed:" + status);
    	      }
    	    });
    	}

    	function infoWindow(marker, map, title, address, url) {
    	  google.maps.event.addListener(marker, 'click', function() {
    	    var html = "<div><h3>" + title + "</h3><p>" + address + "<br></div><a href='" + url + "'>View location</a></p></div>";
    	    iw = new google.maps.InfoWindow({
    	      content: html,
    	      maxWidth: 350
    	    });
    	    iw.open(map, marker);
    	  });
    	}

    	function createMarker(results) {
    	  var marker = new google.maps.Marker({
    	    icon: 'http://maps.google.com/mapfiles/ms/icons/blue.png',
    	    map: map,
    	    position: results[0].geometry.location,
    	    title: title,
    	    animation: google.maps.Animation.DROP,
    	    address: address,
    	    url: url
    	  })
    	  bounds.extend(marker.getPosition());
    	  map.fitBounds(bounds);
    	  infoWindow(marker, map, title, address, url);
    	  return marker;
    	}
    
	function affichage(){ 
	var DOM = "";
    	var nameGame =  $("#search").val();
    	var messageBox  = document.getElementById("display");
    	var titre = ["picture:","game:","date:","lieux:","id_url:"];
    var tab;
    var tabVilles = [];

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
    							DOM += "</div>";
    							DOM += "</br>";
    							
    							tab = ['Location Name: ' + valueObj[0].nameGame, valueObj[0].lieux, 'Location URL']
    							tabVilles.push(tab);				
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
    							DOM += "</div>";
    							DOM += "</br>";
    							
    							tab = ['Location Name: ' + valueObj[0].nameGame, valueObj[0].lieux, 'Location URL']
    							tabVilles.push(tab);
    	    					}
    	    					messageBox.innerHTML = DOM;
    	    				}	
    	    			}    	    			
    	    		}
    	    		initialize(tabVilles);
        	}
    	});
    	
    	
};

</script>
</body>
</html>