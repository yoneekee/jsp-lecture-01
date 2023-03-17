<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<main>
		<table class="board">
			<colgroup>
				<col style="width:20%">
				<col style="width:80%">
			</colgroup>
			<tbody>
				<tr>
					<th>이름</th>
					<td>${boardDto.userName }</td>
				</tr>
				<tr>
					<th>날짜</th>
					<td>${boardDto.regDate }</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${boardDto.hit }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${boardDto.subject }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						${boardDto.contents }
					</td>
				</tr>
				
			</tbody>
		</table>
		<div class="btns">
			<a class="btn confirm" href="../board/modify?no=${boardDto.no }">수정</a>
			<button class="btn reset" type="reset">취소</button>
		</div>
</main>
<script>
	$("#summernote").summernote({
		height:300
	})
</script>
<%@ include file="../include/footer.jsp" %>
