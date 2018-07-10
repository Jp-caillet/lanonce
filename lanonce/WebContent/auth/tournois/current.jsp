<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../../css/tree.css">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/auth/adminMenu.jsp" %>
<article id="container">
 
 <%

 String[] player = new String[19];
 String sql = "select * from tournois where id_url =?";
  String url = "jdbc:mysql://mysql-lanonce.alwaysdata.net/lanonce_bdd";
  String username = "lanonce";
  String pass = "fifou707";
  int vaincu[] = new int[19];
  int tour[] = new int[19];
  String[] tour1 = new String[19];
  String[] tour2 = new String[19];
  String[] tour3 = new String[19];
  String[] tour4 = new String[19];
  String[] tour5 = new String[19];
  String[] tour6 = new String[19];
  int end= 0;
  int tour_incurent =0;
  for(int i = 0; i<=player.length-	1; i++){
	  player[i]=" ";
	  vaincu[i] = 3;
	  tour[i]= 0;
	  tour1[i] = " ";
	  tour2[i] = " ";
	  tour3[i] = " ";
	  tour4[i] = " ";
	  tour5[i] = " ";
	  tour6[i] = " ";
  }
  
  try {
	   
      Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://mysql-lanonce.alwaysdata.net/lanonce_bdd", "lanonce", "fifou707");
      Statement smt = con.createStatement();
      ResultSet r = smt.executeQuery("select * from trees where(id_tournois='" +  request.getParameter("id") + "') order by position;");
	int pos1 = 0;
	int pos2 = 0;
	int pos3 = 0;
	int pos4 = 0;
	int calc1 = 0;
	int calc2 = 0;
	int calc3 = 0;
	int calc4 = 0;
	int calc5 = 0;
	
      while (r.next()) {
      	player[r.getInt("position")-1] = r.getString("pseudo_player");
      	vaincu[r.getInt("position")-1] = r.getInt("perdu");
      	tour[r.getInt("position")-1] = r.getInt("tour");
      	calc1++;
      	if(r.getInt("tour")==1){
      		
      		tour1[pos1] = r.getString("pseudo_player");
      		pos1++;
      	}
      	if(r.getInt("tour")==2){
      		
      		tour1[pos1] = r.getString("pseudo_player");
      		tour2[pos2] = r.getString("pseudo_player");
      		pos1++;
      		pos2++;
      	}
      	if(r.getInt("tour")==3){
      	
      		tour1[pos1] = r.getString("pseudo_player");
      		tour2[pos2] = r.getString("pseudo_player");
      		tour3[pos3] = r.getString("pseudo_player");
      		pos1++;
      		pos2++;
      		pos3++;
      	}
      	if(r.getInt("tour")==4){
      		
      		tour1[pos1] = r.getString("pseudo_player");
      		tour2[pos2] = r.getString("pseudo_player");
      		tour3[pos3] = r.getString("pseudo_player");
      		tour4[pos4] = r.getString("pseudo_player");
      		pos1++;
      		pos2++;
      		pos3++;
      		pos4++;
      	}
      }
      
      for(int i = 0; i<=tour1.length-1; i++){
    	  if(tour1[i] != " "){
    		  calc2++;
    	  }
    	  
      }
      for(int i = 0; i<=tour2.length-1; i++){
    	  if(tour2[i] != " "){
    		  calc3++;
    	  }
    	  
      }
      for(int i = 0; i<=tour3.length-1; i++){
    	  if(tour3[i] != " "){
    		  calc4++;
    	  }
    	  
      }
      
      
      if(calc2 == (calc1/2)){
    	  tour_incurent = 1;
      }
      if(calc3 == (calc1/4)){
    	  tour_incurent = 2;
      }
      if(calc4 == (calc1/8)){
    	  tour_incurent = 3;
      }
     
      for(int i = 0; i<=vaincu.length-1; i++){
    	  if(vaincu[i] != 3 && vaincu[i]!=1 ){
    		  end++;
    	  }
    	  
      }
      request.setAttribute("end", end);
      request.setAttribute("nbtour", tour_incurent);
      con.close();
 } catch (Exception e) {
      e.printStackTrace();
      out.println(e);
 }
 
 if(request.getAttribute("nb").equals(8)){ 
	 
 	%>
 	
 	<section>
    <div><% out.print(player[0]);%></div>
    <div><% out.print(player[1]);%></div>
    <div><% out.print(player[2]);%></div>
    <div><% out.print(player[3]);%></div>
    <div><% out.print(player[4]);%></div>
    <div><% out.print(player[5]);%></div>
    <div><% out.print(player[6]);%></div>
    <div><% out.print(player[7]);%></div>
</section>

<div class="connecter">
    <div></div>
    <div></div>
    <div></div>
    <div></div>
</div>

<div class="line">
    <div>
    </div><div>
    </div><div>
    </div><div>
    </div>
</div>

<section id="quarterFinals">
     <div><% out.print(tour1[0]);%></div>
     <div><% out.print(tour1[1]);%></div>
     <div><% out.print(tour1[2]);%></div>
    <div><% out.print(tour1[3]);%></div>
</section>

<div class="connecter" id="conn2">
    <div></div>
    <div></div>
</div>

<div class="line" id="line2">
    <div></div>
    <div></div>
</div>

<section id="semiFinals">
     <div><% out.print(tour2[0]);%></div>
     <div><% out.print(tour2[1]);%></div>
</section>

<div class="connecter" id="conn3">
    <div></div>
</div>

<div class="line" id="line3">
    <div></div>
</div>

<section id="final">
<div><% out.print(tour3[0]);%></div>
</section>

</article>
 	
 	<%
 }
 %>
 
 <%
 if(request.getAttribute("nb").equals(4)){
 	%>
 	
 	<section>
    <div><% out.print(player[0]);%></div>
    <div><% out.print(player[1]);%></div>
    <div><% out.print(player[2]);%></div>
    <div><% out.print(player[3]);%></div>
    
</section>

<div class="connecter">
    <div></div>
    <div></div>
    
</div>

<div class="line">
    <div>
    </div><div>
    </div>
</div>

<section id="quarterFinals">
    <div></div>
    <div></div>
    
</section>

<div class="connecter" id="conn2">
    <div></div>
    
</div>

<div class="line" id="line2">
    <div></div>
    
</div>

<section id="semiFinals">
    <div></div>
    
</section>


</article>
 	
 	<%
 }
if(end != 1){
	 
 
 %><form method="post" action="">
 
 <div>Choisissez le vainqueur du premier match</div>
 
 <select name="versus">
 <%
 int j = 0;
 int k = 0;
int player1 = 0;
String adversaire1 = "";
String adversaire2 = "";
 while(j!=2){
	 if(vaincu[k]==0){
		 if(tour_incurent== tour[k]){
			 if(player1 == 0){
				 request.setAttribute("player1",player[k]);
				 adversaire1 = player[k];
			 }else{
				 request.setAttribute("player2",player[k]);
				 adversaire2 = player[k];
			 }
			 player1++;			 
		 %>
		 <option><%out.print(player[k]); %></option>
		 <%
		 j++;
		 }
	 }
	 k++;
 }
 %>
 
</select>
<input id="toto" name="player1" type="hidden" value="<%out.print(adversaire1);%>">
<input id="prodId" name="player2" type="hidden" value="<%out.print(adversaire2);%>">
<input id="tutu" name="end" type="hidden" value="<%out.print(end);%>">
<input id="titi" name="nbtour" type="hidden" value="<%out.print(tour_incurent);%>">
<input id="url" name="url" type="hidden" value="<%out.print(request.getParameter("id"));%>">
<input type="submit" class="btn btn-primary" value="valider le vainqueur"></input>
</form>

<%
}else{
%>
<h1>Le Vaiqueur est <% out.print(tour3[0]);%> </h1>
<%} %>


</body>
</html>