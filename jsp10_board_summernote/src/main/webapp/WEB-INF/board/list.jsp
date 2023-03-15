<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<main>
	<!-- 
	<ul>
		<c:forEach items="${boardList }" var="boardDto" varStatus="status"
			begin="0">
			<li><span>${status.index}</span> <span>${boardDto.userName}</span>
				<span><a href="../board/view?no=${boardDto.no}">제목입니다.</a></span> <span>${boardDto.regDate}</span>
			</li>
		</c:forEach>
	</ul>
 	-->

	<table class="table col-8">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>등록일</th>
		</tr>
		<c:forEach items="${boardList }" var="boardDto" varStatus="status"
			begin="0">
			<tr>
				<td>${status.index + 1}</td>
				<td>${boardDto.userName}</td>
				<td><a href="../board/view?no=${boardDto.no}">${boardDto.title}</a></td>
				<td>${boardDto.regDate}</td>
			</tr>
		</c:forEach>
	</table>

	<a href="./write"><button class="btn btn-info">글 쓰러 가기</button></a>
</main>

<%@ include file="../include/footer.jsp"%>
