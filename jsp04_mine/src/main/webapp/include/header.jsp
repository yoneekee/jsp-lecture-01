<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>HOMEPAGE</title>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="./js/jquery-3.6.3.min.js"></script>
</head>
<body>
	<header id="header" class="header">
	
		<h1 id="logo">
			<a href="">JJANG'S MEDIA LAB</a>
		</h1>
		<nav id="gnb">
			<h2 class="blind">global navigation</h2>
			<ul>
				<% out.println("<li><a href='./join.jsp'>회원가입</a></li>"); %>
			<%
			if (session.getAttribute("userName") == null) {
				out.println("<li><a href='./login.jsp'>로그인</a></li>");
			} else {
				out.println("<li><a href='./info.jsp'>" + session.getAttribute("userName")+ " 님</a></li>");
				out.println("<li><a href='./logout.jsp'>로그아웃</a></li>");
			}
			%>
			</ul>
		</nav>
	</header>