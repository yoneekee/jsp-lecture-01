<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String userID = (String) session.getAttribute("userID");
String userName = (String) session.getAttribute("userName");
String gender = (String) session.getAttribute("gender");
String grade = (String) session.getAttribute("grade");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN OK</title>
</head>
<body>

	<h2><%=userName%>
		님, 안녕하세요 (<%=userID%>)
	</h2>
	<hr>
	<p><%=gender%>, <%=grade%></p>
</body>
</html>