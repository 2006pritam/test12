<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Login Successful</title>
</head>

<body>

<h2>Login Successful</h2>
<hr>

<p>
Welcome <b><%= request.getAttribute("email") %></b> to the Online Book Store!
</p>

<p>You have logged in successfully.</p>

<br>

<a href="login.jsp">Logout</a>

</body>
</html>