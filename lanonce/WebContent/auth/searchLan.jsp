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
    <%@ include file="adminMenu.jsp" %>
    <%@ include file="adminMenuLan.jsp" %>
    <div class="row">
	<div class="col-md-offset-2 col-md-7">
        <label>SELECTIONNER UN JEU</label>
    <select class="form-control" style="width: 250px;">
        <option value="">select game</option>
        <%
        String nameGame = "";

        try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://mysql-lanonce.alwaysdata.net/lanonce_bdd", "lanonce", "fifou707");
                Statement smt = con.createStatement();
                ResultSet r = smt.executeQuery("select nameGame from lans;");

                while (r.next()) {
                nameGame = r.getString("nameGame");
                %>
                <option value="<%=nameGame%>"><%=nameGame%></option>
                <%
                out.println(nameGame);
                }
                con.close();
        } catch (Exception e) {
                e.printStackTrace();
        }
        %>
    </select>
    </div>
    </div>
</body>
</html>