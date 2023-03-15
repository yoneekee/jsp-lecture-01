<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<main>
	<table class="board">
		<colgroup>
			<col style="width: 20%">
			<col style="width: 80%">
		</colgroup>
		<tbody>
			<tr>
				<th>이름</th>
				<td>${boardDto.userName }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${boardDto.title}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${boardDto.contents }</td>
			</tr>
		</tbody>
	</table>
	<div class="btns" style="margin: 0 auto;">
		<a href="./list"><button class="btn btn-info">게시판</button></a> <a
			href="./update?no=${boardDto.no}"><button class="btn btn-primary">수정하기</button></a>
		<a href="./delete?no=${boardDto.no}"><button
				class="btn btn-danger">삭제하기</button></a> <a href="./write"><button
				class="btn btn-warning">글쓰러가기</button></a>
	</div>
</main>
<script>
	$("#summernote").summernote({
		height : 300
	})
</script>
<%@ include file="../include/footer.jsp"%>
