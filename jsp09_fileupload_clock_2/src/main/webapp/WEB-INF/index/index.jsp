<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>HUBLOT</title>
<link rel="shortcut icon" href="images/layout/favicon.png"
	type="image/x-icon" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Roboto:wght@100;300;400;500;700&display=swap"
	rel="stylesheet" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" />
<link rel="stylesheet" href="./css/reset.css" />
<link rel="stylesheet" href="./css/common.css" />
<link rel="stylesheet" href="./css/splitting.css" />
<link rel="stylesheet" href="./css/fullpage.css" />
<link rel="stylesheet" href="./css/layout.css" />
<link rel="stylesheet" href="./css/main.css" />
<script src="./js/jquery-3.6.3.min.js"></script>
<script src="./js/greensock/gsap.min.js"></script>
<script src="./js/greensock/CSSRulePlugin.min.js"></script>
<script src="./js/splitting.min.js"></script>
<script src="./js/fullpage.min.js"></script>
<script src="./js/particles.min.js"></script>
</head>
<body>
	<header id="header">
		<h1 id="logo">
			<a href=""><img src="images/hublot02/logo.png" alt="" /></a>
		</h1>
		<nav id="gnb">
			<h2 class="hidden">global navigation</h2>
			<ul class="gnbList">
				<li data-url="bigbang" class="on"><a href="">BIGBANG</a></li>
				<li data-url="classic"><a href="">CLASSIC</a></li>
				<li data-url="square"><a href="">SQUARE</a></li>
			</ul>
		</nav>
		<div class="utilMenu">
			<a href="">HUBLOTISTA</a> <a href=""> <span
				class="material-icons">favorite_border</span>
			</a> <a href=""> <span class="material-icons">search</span>
			</a>
		</div>
	</header>
	<main id="main">
		<c:forEach items="${clockList }" var="clockDto">
			<div class="section" id="clock01"
				style="background-image:url('${pageContext.request.contextPath}/upload/${clockDto.clockRealImg}')">
				<div class="info">
					<p class="category">${clockDto.category }</p>
					<p class="title">${clockDto.title }</p>
					<p class="depth">${clockDto.depth }MM</p>
					<p class="price">CHF ${clockDto.price }</p>
				</div>
			</div>
		</c:forEach>
	</main>
	<div class="pagination">1/10</div>
	<div id="bgParticle"></div>
	<div class="cover">
		<div></div>
		<div></div>
		<div></div>
		<div></div>
		<div></div>
		<div></div>
		<div></div>
		<div></div>
		<div></div>
		<div></div>
	</div>

	<script>
		new fullpage("#main", {
			scrollBar : true, // 배경을 completely fixed로 함
		});
	</script>

</body>
</html>
