<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="">
    <div class="form-group">
    <label class="col-md-3 control-label"></label>
    <div class="col-md-8">
<%
   String description = "";
   String info = "";
   String date = "";
   String nameLan = "";

   try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://mysql-lanonce.alwaysdata.net/lanonce_bdd", "lanonce", "fifou707");
        Statement smt = con.createStatement();
        ResultSet r = smt.executeQuery("select * from lans where(id_user='" + session.getAttribute("id") + "');");

        while (r.next()) {
          description = r.getString("description");
          info = r.getString("info");
          date = r.getString("date");
          nameLan = r.getString("nameLan");
        }
        con.close();
   } catch (Exception e) {
        e.printStackTrace();
   }
%>
Nom de la lan:
<%out.println(nameLan);%></br>
Description:
<%out.println(description);%></br>
Information:
<%out.println(info);%></br>
Date:
<%out.println(date);%>
        <input type="submit" class="btn btn-primary" value="JE CONFIRME" name="send">
    </div>
    </div>
</form>


</body>
</html>