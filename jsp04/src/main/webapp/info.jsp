<!-- info.jsp -->

<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="./include/header.jsp"%>
<%@ include file="./include/index.jsp"%>

<%
String driver = "oracle.jdbc.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "YONEE001";
String pw = "0000";
String userID = (String) session.getAttribute("userID");

request.setCharacterEncoding("UTF-8");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "SELECT * FROM MEMBER02 WHERE userID = ?";

String userId = null;
String userPw = null;
String userEmail = null;
String userName = null;
String address = null;
String phone = null;
int zipcode = 0;
Date regdate = null;

try {
	//1. 드라이버 찾기
	Class.forName(driver);
	//2. db 연결
	conn = DriverManager.getConnection(url, id, pw);
	// 쿼리 날리기.
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userID);
	rs = pstmt.executeQuery();
	if (rs.next()) {
		userId = rs.getString("userID");
		userPw = rs.getString("userPW");
		userEmail = rs.getString("userEmail");
		userName = rs.getString("userName");
		address = rs.getString("address");
		phone = rs.getString("userHP");
		zipcode = rs.getInt("zipcode");
		regdate = rs.getDate("regdate");

		/*
		request.setAttribute("userName", userName);
		request.setAttribute("userId", userId);
		request.setAttribute("userEmail", userEmail);
		request.setAttribute("userPw", userPw);
		request.setAttribute("address", address + " (우편번호 : " + zipcode + ")");
		request.setAttribute("phone", phone);
		request.setAttribute("regdate", regdate);
		RequestDispatcher dispatcher = request.getRequestDispatcher("./info_show.jsp");
		dispatcher.forward(request, response);
		*/
	} else {

	}
} catch (Exception e) {
	e.printStackTrace();
} finally {

	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	if (rs != null)
		rs.close();
}
%>
<table>
	<colgroup>
		<col style="width: 20%" />
		<col style="width: 80%" />
	</colgroup>
	<tbody>
		<tr>
			<th>아이디</th>
			<td><%=userId%></td>
		</tr>
		<tr>
			<th>패스워드</th>
			<td><%=userPw.substring(0, 2)%> 
				<%for (int i = 0; i < userPw.length() - 2; i++) {out.print("*");}%></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><%=userName%></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=userEmail%></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><%=phone%></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><%=address%></td>
		</tr>
		<tr>
			<th>가입일</th>
			<td><%=regdate%></td>
		</tr>
	</tbody>
</table>
<div>
	<a href="./modify.jsp?userID="<%=userId%>>회원정보 수정</a>
	<a href="./delete.jsp?userID="<%=userId%>>회원 탈퇴</a>
</div>
<%@ include file="./include/footer.jsp" %>