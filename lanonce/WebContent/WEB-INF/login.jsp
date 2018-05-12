<!DOCTYPE html>
<html>
<head>
<title>Login</title>
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <script src="https://apis.google.com/js/platform.js" async defer></script>
   <meta name="google-signin-client_id" content="540503980237-9cq83hno437m58gog04dhlmcpt61q9os.apps.googleusercontent.com">
</head>
<body>

<%@ include file="menu.jsp" %>

 <form method="post" action="login">
    
	<div class="container">
	<div class="row">
	<div class="col-md-offset-2 col-md-8">
	<h1> Connexion <br/> <small> Merci de vous connecter </small></h1>
	</div>
	</div>
  
  	<div class="row">
	<div class="col-md-offset-2 col-md-7">
	<div class="form-group">
	<label for="Email">Pseudo</label>
	<input type="text" class="form-control" id="pseudo" placeholder="Enter email" name="pseudo">
	</div>
	</div>
	</div>

	<div class="row">
	<div class="col-md-offset-2 col-md-7">
	<div class="form-group">
	<label for="Email">Email address</label>
	<input type="text" class="form-control" id="email" placeholder="Enter email" name="email">
	</div>
	</div>
	</div>
	
	<div class="row">
	<div class="col-md-offset-2 col-md-7">
	<div class="form-group">
	<label for="Email">Enter your password</label>
	<input type="password" class="form-control" id="password" placeholder="Enter password" name="password">
	</div>
	</div>
	</div>
	
	<br/>
	<div class="row">
	<div class="col-md-offset-5 col-md-1">
	<input type="submit" class="btn btn-primary" value="Connexion"></input>
	</div>
	</div>
	</div>
</form>

<!------------------------------------------------------------------------> 
<!---------------------------- Facebook login ---------------------------->  
<!------------------------------------------------------------------------>
 
 <script>
// This is called with the results from from FB.getLoginStatus().
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    // The response object is returned with a status field that lets the
    // app know the current login status of the person.
    // Full docs on the response object can be found in the documentation
    // for FB.getLoginStatus().
    if (response.status === 'connected') {
      // Logged into your app and Facebook.
      testAPI();
    } else {
      // The person is not logged into your app or we are unable to tell.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    }
  }

  // This function is called when someone finishes with the Login
  // Button.  See the onlogin handler attached to it in the sample
  // code below.
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
    FB.init({
      appId      : '182025445936083', 
      cookie     : true,  // enable cookies to allow the server to access 
      channelUrl : '//http://localhost:8080/',          // the session
      xfbml      : true,  // parse social plugins on this page
      version    : 'v2.8' // use graph api version 2.8
    });

    // Now that we've initialized the JavaScript SDK, we call 
    // FB.getLoginStatus().  This function gets the state of the
    // person visiting this page and can return one of three states to
    // the callback you provide.  They can be:
    //
    // 1. Logged into your app ('connected')
    // 2. Logged into Facebook, but not your app ('not_authorized')
    // 3. Not logged into Facebook and can't tell if they are logged into
    //    your app or not.
    //
    // These three cases are handled in the callback function.

    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });

  };

  // Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  // Here we run a very simple test of the Graph API after login is
  // successful.  See statusChangeCallback() for when this call is made.
  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
      console.log('Successful login for: ' + response.name);
      document.getElementById('status').innerHTML =
        'Thanks for logging in, ' + response.name + '!';
    });
  }
  </script>
  <!--
  Below we include the Login Button social plugin. This button uses
  the JavaScript SDK to present a graphical Login button that triggers
  the FB.login() function when clicked.
-->

<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
</fb:login-button>

<div id="status">
</div> 

<!------------------------------------------------------------------------> 
<!----------------------------- Google login ----------------------------->  
<!------------------------------------------------------------------------>
  
 <div class="g-signin2" data-onsuccess="onSignIn" id="myP">
  </div>
   <img id="myImg"><br>
   <p id="name"></p>
  <div id="status">
 </div>
   
 <script>
 function onSignIn(googleUser) {
     // window.location.href='success.jsp';
     var profile = googleUser.getBasicProfile();
     var imagurl=profile.getImageUrl();
     var name=profile.getName();
     var email=profile.getEmail();
     document.getElementById("myImg").src = imagurl;
     document.getElementById("name").innerHTML = name;
     document.getElementById("myP").style.visibility = "hidden";
     document.getElementById("status").innerHTML = 'Welcome '+name+'!<a href=success.jsp?email='+email+'&name='+name+'/>Continue with Google login</a></p>'
  }
  </script>
  
  <button onclick="myFunction()">Sign Out</button>
  
  <script>
     function myFunction() {
     gapi.auth2.getAuthInstance().disconnect();
     location.reload();
  }	      
</script>
 
</body>
</html>