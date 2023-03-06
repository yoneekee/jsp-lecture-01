<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<%
String loggedUserName = (String) session.getAttribute("userName");
String loggedUserId = (String) session.getAttribute("userID");
%>

<%
	if(session.getAttribute("userName") != null) {
		out.println("<h1>" + loggedUserName+ " 님, 안녕하세요! (" + loggedUserId + ")</h1>");
	} else {
		out.println("<h1>방문자 님, 안녕하세요!</h1>");
	}
%>
<%@ include file="./include/footer.jsp" %>
</body>
</html>