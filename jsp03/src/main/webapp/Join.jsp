<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

	<form method="GET" action="Join_process.jsp">
		<div>
			<label><span>아이디</span><input type="text" name="userID"></label>
		</div>
		<div>
			<label><span>패스워드</span><input type="password" name="userPW"></label>
		</div>
		<div>
			<button>회원가입</button>&nbsp;<button type="reset">취소</button>
		</div>
	</form>
	
</body>
</html>