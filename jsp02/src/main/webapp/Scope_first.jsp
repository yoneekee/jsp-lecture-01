<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FIRST</title>
</head>
<body>
	<%
	pageContext.setAttribute("name", "나는 page Context 입니다."); // 단일 페이지
	request.setAttribute("name", "나는 request 입니다."); // forward(O), sendRedirect(X)
	session.setAttribute("name", "나는 session 입니다."); // 세션이 사라질 때까지
	application.setAttribute("name", "나는 application 입니다."); // 서버 종료 시까지
	
	out.println("<h2>==== scope first ====</h2>");
	out.println("<p>pageContext : " + pageContext.getAttribute("name") + "</p>");
	out.println("<p>request : " + request.getAttribute("name") + "</p>");
	out.println("<p>session : " + session.getAttribute("name") + "</p>");
	out.println("<p>application : " + application.getAttribute("name") + "</p>");
	
	// 이거 때문에 이 페이지는 그냥 스쳐지나가고 바로 Scope_second만 보여짐
	// EX ) jsp (유효성 검증 등 요청) -> servelt(디스패처) -> 다시 jsp (결과 반환)
	RequestDispatcher dispatcher =  request.getRequestDispatcher("Scope_second.jsp");
	dispatcher.forward(request, response);
	%>
</body>
</html>