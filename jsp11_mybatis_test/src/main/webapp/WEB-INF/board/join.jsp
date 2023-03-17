<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<main>
	<form class="form" action="../board/joinProcess" method="POST">
		<table class="board">
			<colgroup>
				<col style="width: 20%">
				<col style="width: 80%">
			</colgroup>
			<tbody>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="userId"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="userPwd"></td>
				</tr>
			</tbody>
		</table>
		<div class="btns">
			<button class="btn confirm">회원가입</button>
			<button class="btn reset" type="reset">취소</button>
		</div>
	</form>
</main>

<%@ include file="../include/footer.jsp"%>








