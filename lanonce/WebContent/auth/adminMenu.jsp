<!DOCTYPE html>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title></title>
<link rel="stylesheet" type="text/css" href="../css/adminMenuPage.css">
</head>
<body>

<div class="topnav">
  <img src="../images/logo_blanc.png" width="180px" height="80px"/>
  <a class="active" href="/lanonce/auth/home">Home</a>
  <a href="/lanonce/auth/profil">Profil</a>
  <a href="/lanonce/auth/logout">Logout</a>
  <a href=""><c:out value="Bonjour ${sessionScope.pseudo}"/></a>
</div>

</body>
</html>