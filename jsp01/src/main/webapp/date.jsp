<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
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
		Date today = new Date();
		SimpleDateFormat dateForamt = new SimpleDateFormat("yyyy-mm-dd");
		String todayStr = dateForamt.format(today);
		out.println("오늘은 : "+todayStr);
	%>
</body>
</html>