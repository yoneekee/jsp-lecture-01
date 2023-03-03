
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN OK</title>
</head>
<body>

	<%
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	String userName = "김회원";
	%>


	<%
	if (userId.equals("kim1234") && userPw.equals("1234")) {
		response.sendRedirect("Login_success.jsp?userName=" + URLEncoder.encode(userName, "UTF-8"));
	} else {
		out.println("<script> alert('아이디 및 패스워드 확인 요망'); history.back(); </script>");
	}
	%>

</body>
</html>