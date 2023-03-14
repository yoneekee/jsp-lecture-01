<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Upload Form</title>
</head>
<body>
	<h1>File Upload Form</h1>
	<hr>
	<form action="../board/fileUpload" method="POST" enctype="multipart/form-data">
		<table>
			<tbody>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<th>이미지</th>
					<td><input type="file" name="file"></td>
				</tr>
			</tbody>
		</table>
		<div>
			<button>확인</button>
			<button type="reset">취소</button>
		</div>
	</form>
</body>
</html>