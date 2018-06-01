<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	body {font-family: Arial, Helvetica, sans-serif;}

	input[type=text], select, textarea {
		width: 100%;
		padding: 12px;
		border: 1px solid #ccc;
		border-radius: 4px;
		box-sizing: border-box;
		margin-top: 6px;
		margin-bottom: 16px;
		resize: vertical;
	}

	input[type=submit] {
		background-color: #4CAF50;
		color: white;
		padding: 12px 20px;
		border: none;
		border-radius: 4px;
		cursor: pointer;
	}

	input[type=submit]:hover {
		background-color: #45a049;
	}

	.container {
		border-radius: 5px;
		background-color: #f2f2f2;
		padding: 20px;
	}
</style>
</head>
<body>

  <%@ include file="adminMenu.jsp" %>
  <%@ include file="adminMenuLan.jsp" %>

<h3>Contact Form</h3>

<div class="container">
	<form action="contactus" method="post">
    <label for="fname">Your email: </label>
    <input type="text" id="email" name="email" placeholder="Your email..">

    <label for="lname">Your subject: </label>
    <input type="text" id="subject" name="subject" placeholder="Your subject..">

    <label for="subject">Mail message</label>
    <textarea id="message" name="message" placeholder="Write something.." style="height:200px"></textarea>

	<input type="submit"><span class="message">${message}</span>

  </form>
</div>

</body>
</html>