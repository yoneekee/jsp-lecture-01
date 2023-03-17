<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<main>
	<ul class="boardList">
		<c:forEach items="${boardList }" var="boardDto" varStatus="status" 
		begin="0">
		<li>
			<span class="no item">${status.index}</span>
			<span class="userName item">${boardDto.userName}</span>
			<span class="subject item"><a href="../board/view?no=${boardDto.no}">${boardDto.subject }</a></span>
			<span class="date item">${boardDto.regDate}</span>
		</li>
		</c:forEach>
	</ul>	
	<ul class="pageBox">
		<li><a href="">이전</a></li>
		<c:forEach begin="${pageStart }" 
		           end="${pageEnd }" 
		           step="1" 
		           varStatus="status" 
		           var="page">
			<li><a href="../board/list?page=${page }">${page }</a></li>
		</c:forEach>
		<li><a href="../board/list?page=${pageStart+pageBlock }">다음</a></li>
		<!-- <li><a href="../board/list?page=1">1</a></li>
		<li><a href="../board/list?page=2">2</a></li>
		<li><a href="../board/list?page=3">3</a></li>
		<li><a href="../board/list?page=4">4</a></li> -->
	</ul>
	<div class="btns">
		<a href="../board/write" class="confirm">글쓰기</a>
		<a href="../index" class="reset">홈</a>
	</div>
</main>

<%@ include file="../include/footer.jsp" %>