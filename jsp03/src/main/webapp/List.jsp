<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String driver = "oracle.jdbc.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "YONEE001";
String pw = "0000";

Connection conn = null; // 커넥션 객체 초기화
PreparedStatement pstmt = null;
ResultSet rs = null;

Class.forName(driver); // 드라이버 가져오겠다
conn = DriverManager.getConnection(url, id, pw); // 커넥션 연결

//String sql = "INSERT INTO MEMBER (USERID, USERPW) VALUES (?, ?)";
String sql = "SELECT * FROM MEMBER";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery(); // SELECT의 실행 결과가 담김
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LIST</title>
</head>
<body>
	<h1>회원 목록</h1>
	<ul>
		<%
		while (rs.next()) {
			String userID = rs.getString("userID");
			String userPW = rs.getString("userPW");
			String userName = rs.getString("userName");
			String gender = rs.getString("gender");
			String grade = rs.getString("grade");
			out.println("<li>" + userID + " / " + userName +  " / " + gender + " / "+ grade + "</li>");
		}
		%>
	</ul>
	
	<a href="Join.jsp">회원가입</a>
	<a href="Login.jsp">로그인</a>
</body>
</html>