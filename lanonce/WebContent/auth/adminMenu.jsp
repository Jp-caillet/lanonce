<!DOCTYPE html>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand"></a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="/lanonce/auth/home">Home</a></li>
	  <li><a href="/lanonce/auth/profil">profil</a></li>
	  <li><a href="/lanonce/auth/create">Create</a></li>
      <li><a href="/lanonce/auth/logout">Logout</a></li>
      <li><a><c:out value="Bonjour ${sessionScope.pseudo}"/></a></li>
    </ul>
  </div>
</nav>

</body>
</html>