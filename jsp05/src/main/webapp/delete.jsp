<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String idx = request.getParameter("idx");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="./js/jquery-3.6.3.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<form action="deleteProcess.jsp" method="post">
		<input type="password" name="userPW"> <input type="hidden"
			name="idx" value="<%=idx%>">
		<div>
			<button class="btn confirm">삭제</button>
			<button type="reset">취소</button>
			<a href="list.jsp">목록으로</a>
		</div>
	</form>
</body>

<script>
	$(".confirm").on("click", function() {
		const ajaxMsg = "TEST!!!!";
		$.ajax({
			url : "deleteProcess.jsp",
			data : JSON.stringify ({
				ajaxTest : ajaxMsg
			}),
			success : function(response) {
				console.log(response);
			},
		});
	});
</script>
</html>