<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN SUCCESS</title>
</head>
<body>
	<%
		String userName = request.getParameter("userName");
	%>

	<h1><%=userName%> 님, 로그인 성공!</h1>
</body>
</html>