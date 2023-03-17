<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<main>
	<ul class="boardList">
		<c:forEach items="${pageDto.boardList }" var="boardDto"
			varStatus="status" begin="0" end="${pageDto.total}">
			<li><span class="no item">${pageDto.total - (pageDto.clickedPage-1)*pageDto.listPerPage - status.index}</span>
				<span class="userName item">${boardDto.userName}</span> <span
				class="subject item"><a
					href="../board/view?no=${boardDto.no}">${boardDto.subject }</a></span> <span
				class="date item">${boardDto.regDate}</span></li>
		</c:forEach>
	</ul>
	<ul class="pageBox">
		<li><a href="../board/list?page=1"><span
				class="material-icons"> first_page </span></a></li>
		<c:if test="${pageDto.pageStart!=1 }">
			<li><a
				href="../board/list?page=${pageDto.pageStart-pageDto.pageBlock }"><span
					class="material-icons"> chevron_left </span></a></li>
		</c:if>
		<c:forEach begin="${pageDto.pageStart }" end="${pageDto.pageEnd }"
			step="1" varStatus="status" var="page">
			<li class="${pageDto.clickedPage==page ? 'active':'' }"><a
				href="../board/list?page=${page }">${page }</a></li>
		</c:forEach>
		<c:if test="${pageDto.pageLast != pageDto.pageEnd }">
			<li><a
				href="../board/list?page=${pageDto.pageStart+pageDto.pageBlock }"><span
					class="material-icons"> chevron_right </span></a></li>
		</c:if>
		<li><a href="../board/list?page=${pageDto.pageLast}"><span
				class="material-icons"> last_page </span></a></li>
		<!-- <li><a href="../board/list?page=1">1</a></li>
		<li><a href="../board/list?page=2">2</a></li>
		<li><a href="../board/list?page=3">3</a></li>
		<li><a href="../board/list?page=4">4</a></li> -->
	</ul>
	<div class="btns">
		<a href="../board/write" class="confirm">글쓰기</a> <a href="../index"
			class="reset">홈</a>
	</div>
</main>

<%@ include file="../include/footer.jsp"%>
