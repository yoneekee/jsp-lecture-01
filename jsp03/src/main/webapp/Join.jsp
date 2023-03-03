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
			<label><span>아이디 :</span><input type="text" name="userID"></label>
		</div>
		<div>
			<label><span>패스워드 :</span><input type="password"
				name="userPW"></label>
		</div>
		<div>
			<label><span>이름 : </span><input type="text" name="userName"></label>
		</div>
		<div>
			<span>성별 : </span> 남자<input type="radio" name="gender" value="남자">&nbsp;&nbsp;
			여자<input type="radio" name="gender" value="여자">
		</div>
		<div>
			<span>학력 : </span> <select name="grade">
				<option value="elementary">초졸</option>
				<option value="middle">중졸</option>
				<option value="high">고졸</option>
				<option value="univ">대졸</option>
				<option value="master">대학원졸</option>
			</select>
		</div>
		<div>
			<button>회원가입</button>
			&nbsp;
			<button type="reset">취소</button>
		</div>
	</form>

	<a href="Login.jsp">로그인</a>
</body>
</html>