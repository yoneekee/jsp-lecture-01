<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write</title>
</head>
<body>

	<form method="POST" action="writeProcess.jsp">
		<table>
			<colgroup>
				<col style="width: 20%">
				<col style="width: 80%">
			</colgroup>
			<tbody>
				<tr>
					<th>이름</th>
					<td><input type="text" name="userName" id=""></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject" id=""></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="userPW" id=""></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="contents" id="" cols="30" rows="10"></textarea></td>
				</tr>
			</tbody>
		</table>
		<div>
			<button class="btn confirm">확인</button>
			<button type="reset" class="btn reset">취소</button>
		</div>
	</form>
	<a href="list.jsp"><button>리스트보기</button></a>
</body>
</html>