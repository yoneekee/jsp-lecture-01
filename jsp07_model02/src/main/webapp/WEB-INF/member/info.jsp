<%@page import="com.jjang051.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<%
	MemberDto dto = (MemberDto)request.getAttribute("memberInfo");
	pageContext.setAttribute("memberInfo", dto);
%>
	<h1>${memberInfo.userName} 님의 정보</h1>
	
	<table>
		<colgroup>
			<col style="width: 20%" />
			<col style="width: 80%" />
		</colgroup>
		<tbody>
			<tr>
				<th>아이디</th>
				<td>${memberInfo.userId}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${memberInfo.userName}</td>
			</tr>
			<tr>
				<th>휴대전화</th>
				<td>${memberInfo.userHp}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${memberInfo.userEmail}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${memberInfo.address} (${memberInfo.zipCode})</td>
			</tr>
		</tbody>
	</table>
<%@ include file="../include/footer.jsp"%>
