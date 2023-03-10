<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String loggedUserName = (String) session.getAttribute("userName");
String loggedUserID = (String) session.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>회원가입</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Lato:wght@100;300;400;700;900&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/layout.css">

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/jquery-3.6.3.min.js"></script>
</head>
<body>
	<header id="header" class="header">
		<h1 id="logo">
			<a href="/jsp07_model02">JJANG'S MEDIA LAB</a>
		</h1>
		<nav id="gnb">
			<h2 class="hidden">global navigation</h2>

			<c:choose>
				<c:when test="${not empty sessionScope.userId}">
					<ul class="list">
						<li><a href="../member/info"><%=loggedUserName%>님</a></li>
						<li><a href="../member/logout">로그아웃</a></li>
						<li><a href="../board/list.jsp">게시판</a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="list">
						<li><a href="../member/join">회원가입</a></li>
						<li><a href="../member/login">로그인</a></li>
						<li><a href="../board/list.jsp">게시판</a></li>
					</ul>
				</c:otherwise>
			</c:choose>



		</nav>
	</header>