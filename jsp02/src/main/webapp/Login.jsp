<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>

	<h1>LOGIN</h1>
	<form method="GET" action="Login_ok.jsp">
		<div>
			<input type="text" name="userId" />
		</div>
		<div>
			<input type="password" name="userPw">
		</div>
		<div>
			<button type="submit">로그인</button>
			<button type="reset">취소</button>
		</div>
	</form>
</body>
</html>