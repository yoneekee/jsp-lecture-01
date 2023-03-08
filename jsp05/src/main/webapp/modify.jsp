<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String idx = request.getParameter("idx");
String userName = request.getParameter("userName");
String subject = request.getParameter("subject");
String contents = request.getParameter("contents");
String ajaxMsg = request.getParameter("ajaxMsg");
System.out.println("11111" + ajaxMsg);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="./js/jquery-3.6.3.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<form method="POST" action="modifyProcess.jsp">
		<table>
			<colgroup>
				<col style="width: 20%">
				<col style="width: 80%">
			</colgroup>
			<tbody>
				<tr>
					<th>이름</th>
					<td><input type="text" name="userName" value="<%=userName%>"readonly="readonly"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject" value="<%=subject%>" readonly="readonly"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="userPW" placeholder=""></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="contents" id="" cols="30" rows="10" placeholder="<%=contents%>"></textarea></td>
				</tr>
			</tbody>
		</table>
		<div>
			<input type="hidden" name="idx" value="<%=idx%>">
			<button class="btn confirm">확인</button>
			<button type="reset" class="btn reset">취소</button>
		</div>
	</form>
	<a href="list.jsp"><button>리스트보기</button></a>
</body>

<script>
	
</script>
</html>