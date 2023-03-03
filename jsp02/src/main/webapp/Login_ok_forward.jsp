<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	String userName = "김회원";
	%>


	<%
	if (userId.equals("kim1234") && userPw.equals("1234")) {
		request.setAttribute("userName", userName);
		request.setAttribute("userCity", "서울");
		request.setAttribute("userAge", 30);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Login_success_forward.jsp");
		dispatcher.forward(request, response);
		// SendRedirect와는 달리 Forward는 정보를 가지고 갈 수 있다
	} else {
		out.println("<script> alert('아이디 및 패스워드 확인 요망'); history.back(); </script>");
	}
	%>
</body>
</html>