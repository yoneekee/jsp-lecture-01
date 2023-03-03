<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HELLO JSP</title>
</head>
<body>

	<%
		String name = "박연진";
		int age = 30;
	%>
	<h1>HELLO JSP</h1>
	<p><% out.println(name); %></p>
	<p><%= age %></p>
</body>
</html>