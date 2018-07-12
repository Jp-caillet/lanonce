<!DOCTYPE html>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title></title>
  <link rel="stylesheet" type="text/css" href="/lanonce/css/adminMenuPage.css">
  <link rel="stylesheet" type="text/css" href="../css/footer.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>

<div class="topnav">
  <a  href="/lanonce/auth/home"><img src="/lanonce/images/logo_blanc.png" width="180px" height="80px"/></a>
  <a class="active menu" href="/lanonce/auth/home">Home</a>
  <a class="menu" href="/lanonce/auth/profil">Profil</a>
  <a class="menu" href="/lanonce/auth/logout">Logout</a>
  <a class="menu" href=""><c:out value="Bonjour ${sessionScope.pseudo}"/></a>
</div>

</body>
</html>