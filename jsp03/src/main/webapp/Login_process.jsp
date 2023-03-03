<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String userID = (String) request.getParameter("userID");
String userPW = (String) request.getParameter("userPW");

//System.out.println(userID + ", " + userPW);
%>

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
String sql = "SELECT * FROM MEMBER WHERE USERID = ? AND USERPW = ?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, userID);
pstmt.setString(2, userPW);
rs = pstmt.executeQuery(); // SELECT의 실행 결과가 담김
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Process</title>
</head>
<body>
	<%
	if (rs.next()) {
		// 중복 허용을 하지 않는다는 가정 하에 1개가 나옴 (id - primary)
		// eof : END OF FILE....다음 줄을 읽어라 
		String _userID = rs.getString("USERID");
		String _userPW = rs.getString("USERPW");
		String _userName = rs.getString("USERNAME");
		String _gender = rs.getString("GENDER");
		String _grade = rs.getString("GRADE");
		System.out.println(_userID + ", " + _userPW);
		session.setAttribute("userID", _userID);
		session.setAttribute("userName", _userName);
		session.setAttribute("gender", _gender);
		session.setAttribute("grade", _grade);
		response.sendRedirect("Login_ok.jsp");
	} else {
		System.out.println(userID + ", " + userPW);
		out.println("<script>alert('아이디 패스워드 확인 요망'); history.back();</script>");
	}
	%>
</body>
</html>