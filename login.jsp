<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String errorMessage = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Login | Online Book Store</title>
</head>
<body>

    <h2>Online Book Store - Login</h2>

    <% if (errorMessage != null) { %>
        <p style="color: red;"><%= errorMessage %></p>
    <% } %>

    <form action="<%= request.getContextPath() %>/login" method="post">
        Login ID:
        <input type="text" name="loginId" required>
        <br><br>

        Password:
        <input type="password" name="password" required>
        <br><br>

        <input type="submit" value="Login">
    </form>

      

</body>
</html>
