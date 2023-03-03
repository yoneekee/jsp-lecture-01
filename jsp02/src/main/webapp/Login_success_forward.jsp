<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Success Forward</title>
</head>
<body>
	<%
	String userName = (String) request.getAttribute("userName");
	String userCity = (String) request.getAttribute("userCity");
	int userAge = (int) request.getAttribute("userAge");
	%>
	<h1>안녕하세요, <%=userName%> 님 !</h1>
	<p>(<%=userCity%> 거주, <%=userAge%> 세)</p>
</body>
</html>