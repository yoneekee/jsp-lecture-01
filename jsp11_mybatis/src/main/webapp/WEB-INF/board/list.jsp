<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<main>
	<ul>
		<c:forEach items="${boardList }" var="boardDto" varStatus="status" 
		begin="0">
		<li>
			<span>${status.index}</span>
			<span>${boardDto.userName}</span>
			<span><a href="../board/view?no=${boardDto.no}">${boardDto.subject }</a></span>
			<span>${boardDto.regDate}</span>
		</li>
		</c:forEach>
	</ul>	
</main>

<%@ include file="../include/footer.jsp" %>
