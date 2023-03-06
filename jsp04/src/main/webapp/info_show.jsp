<!-- info_show.jsp -->

<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./include/header.jsp"%>
<%@ include file="./include/index.jsp"%>

<%
String userName = (String) request.getAttribute("userName");
String userId = (String) request.getAttribute("userId");
String userEmail = (String) request.getAttribute("userEmail");
String userPw = (String) request.getAttribute("userPw");
String phone = (String) request.getAttribute("phone");
String address = (String) request.getAttribute("address");
Date regdate = (Date) request.getAttribute("regdate");
%>

<table>
	<colgroup>
		<col style="width: 20%" />
		<col style="width: 80%" />
	</colgroup>
	<tbody>
		<tr>
			<th>아이디</th>
			<td><%=userId%></td>
		</tr>
		<tr>
			<th>패스워드</th>
			<td><%=userPw.substring(0, 2)%> <%
 for (int i = 0; i < userPw.length() - 2; i++) {
	out.print("*");
 }
 %></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><%=userName %></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=userEmail %></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><%=phone %></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><%=address %></td>
		</tr>
		<tr>
			<th>가입일</th>
			<td><%=regdate %></td>
		</tr>
	</tbody>
</table>
</body>
</html>