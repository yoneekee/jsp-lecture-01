<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	String str01 = "jsp";
	String str02  = "안녕하세요"; 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>hello jsp</p>	
	<p>처음 만들어 보는	<%= str01 %></p>
	<p>
		<% 
			out.println(str02+str01+"입니다.");
			//안녕하세요. 100번 찍기...
		%>
	</p>
	<p>
		<%
			for(int i=0;i<100;i++) {
				out.println("안녕하세요 <br>");
			}
		%>
	</p>
</body>
</html>



