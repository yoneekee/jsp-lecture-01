<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<h1>INDEX</h1>

<c:choose>
	<c:when test="${not empty sessionScope.userId}">
		<ul>
			<li><a href="../member/info"><%=loggedUserName%>님</a></li>
			<li><a href="../member/logout">로그아웃</a></li>
			<li><a href="../board/list.jsp">게시판</a></li>
		</ul>
	</c:when>
	<c:otherwise>
		<ul>
			<li><a href="../member/join">회원가입</a></li>
			<li><a href="../member/login">로그인</a></li>
			<li><a href="../board/list.jsp">게시판</a></li>
		</ul>
	</c:otherwise>
</c:choose>
<%@ include file="../include/footer.jsp"%>
