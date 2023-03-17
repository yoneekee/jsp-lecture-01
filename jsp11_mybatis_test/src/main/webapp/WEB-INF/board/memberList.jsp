<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<main>
	<ul class="boardList">
		<c:forEach items="${memberList }" var="memberDto" varStatus="status"
			begin="0">
			<li><span class="no item">${status.index}</span> <span
				class="userName item"><a
					href="../board/memberUpdate?no=${memberDto.userId}">${memberDto.userId}</a></span>
				<span class="subject item">${memberDto.userPwd }</span> <span
				class="date item">${memberDto.regdate}</span></li>
		</c:forEach>
	</ul>
	<div class="btns">
		<a href="../board/write" class="confirm">글쓰기</a> <a href="../index"
			class="reset">홈</a>
	</div>
</main>

<%@ include file="../include/footer.jsp"%>
