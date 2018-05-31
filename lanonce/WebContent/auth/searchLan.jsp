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
    <!-- <div class="row">
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
    </div>-->
    <div class="search-container">
        <div class="ui-widget">
            Jeux:
            <input type="text" id="search" name="search" class="search" />
        </div>
    </div>
    <script>
    $(document).ready(function() {
        $(function() {
            $("#search").autocomplete({
                source: function(request, response) {
                    $.ajax({
                        url: "../auth/searchLan", 
                        type: "GET",
                        data: {
                            term: request.term
                        },
                        dataType: "json",
                        success: function(data) {
                            console.log(data);
                            response(data);
                        }
                    });
                }
            });
        });
    });
</script>
</body>
</html>