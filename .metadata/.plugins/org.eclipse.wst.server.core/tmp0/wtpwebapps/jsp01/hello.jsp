<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%!String str01 = "jsp";
	String str02 = "hello";%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World</title>
</head>
<body>

	<h1>Hello World</h1>
	<p>Hello World</p>
	<p><%=str02%>
		<%=str01%></p>
	<p>
		<%
		out.println(str02 + " " + str01 + "입니다.");
		for (int i = 0; i < 100; i++) {
			out.println(str02 + "<br>");
		}
		%>
	</p>
</body>
</html>