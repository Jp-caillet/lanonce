<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>home</title>
<link rel="stylesheet" type="text/css" href="../css/homePage.css">
</head>
<body>

  <%@ include file="adminMenu.jsp" %>
  <%@ include file="adminMenuLan.jsp" %>

<!-- Banner -->
  <div class='banniere'>
	<img src='../images/home1.jpg' alt='Image 1' style="width:100%;"/>
    <img src='../images/slide02.jpg' title='Image 2' alt='Image 2' />
    <img src='../images/slide03.jpg' title='Image 3' alt='Image 3' />
	<img src='../images/slide04.jpg' title='Image 4' alt='Image 4' />
	<img src='../images/slide05.jpg' title='Image 5' alt='Image 5' />
	<div class="centered">Centered</div>
  </div> 

<!-- One -->
	<section id="one" class="wrapper style2">
		<div class="inner">
			<div class="grid-style">
				<div>
					<div class="box" style="float: left;">
						<div class="image fit">
							<img src="../images/slide04.jpg" alt="" />
						</div>
						<div class="content">
							<header class="align-center">
								<p>maecenas sapien feugiat ex purus</p>
								<h2>CREER UNE LAN</h2>
							</header>
							<p> Cras aliquet urna ut sapien tincidunt, quis malesuada elit facilisis. Vestibulum sit amet tortor velit. Nam elementum nibh a libero pharetra elementum. Maecenas feugiat ex purus, quis volutpat lacus placerat malesuada.</p>
							<footer class="align-center">
								<a href="/lanonce/auth/create" class="button alt">CLIQUEZ ICI</a>
							</footer>
						</div>
					</div>
				</div>

				<div>
					<div class="box">
						<div class="image fit">
							<img src="../images/slide04.jpg" alt="" />
						</div>
						<div class="content">
							<header class="align-center">
								<p>mattis elementum sapien pretium tellus</p>
								<h2>REJOINDRE UNE LAN</h2>
							</header>
							<p> Cras aliquet urna ut sapien tincidunt. Maecenas feugiat ex purus, quis volutpat lacus placerat malesuada.</p>
							<footer class="align-center">
								<a href="/lanonce/auth/searchLan" class="button alt">CLIQUEZ ICI</a>
							</footer>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Two -->
	<section id="two" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>Nam vel ante sit amet libero scelerisque facilisis eleifend vitae urna</p>
				<h2>TROUVER UNE PARTIE</h2>
				<input type="button" href="" value="rechercher une ville">
			</header>
		</div>
	</section>

  <%@ include file="adminFooter.jsp" %>
	

<!-- Javascript -->
<script language='Javascript' type='text/javascript'
 src='http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js'></script>
<script language='Javascript' type='text/javascript'
 src='../js/timer.js'></script>
<script language='Javascript' type='text/javascript'
 src='../js/banniere-defilante.js'></script>

</body>
</html>