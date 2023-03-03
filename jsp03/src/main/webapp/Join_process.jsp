<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String userID = (String) request.getParameter("userID");
String userPW = (String) request.getParameter("userPW");
String userName = (String) request.getParameter("userName");
String gender = (String) request.getParameter("gender");
String grade = (String) request.getParameter("grade");
%>

<%
String driver = "oracle.jdbc.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "YONEE001";
String pw = "0000";

Connection conn = null; // 커넥션 객체 초기화
PreparedStatement pstmt = null;

Class.forName(driver); // 드라이버 가져오겠다
conn = DriverManager.getConnection(url, id, pw); // 커넥션 연결

String sql = "INSERT INTO MEMBER (USERID, USERPW, USERNAME, GENDER, GRADE) VALUES (?, ?, ?, ?, ?)";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, userID);
pstmt.setString(2, userPW);
pstmt.setString(3, userName);
pstmt.setString(4, gender);
pstmt.setString(5, grade);

int result = pstmt.executeUpdate(); 
// 데이터에 변경을 주는 경우 (select 제외 전부) 
// 영향을 준 개수가 나옴 (1이 뜰 것임 성공했다면)

//ystem.out.println(result);

%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Process</title>
</head>
<body>
<%
if(result > 0) {
	out.println("<script>alert('회원가입 완료'); history.back();</script>");
	//out.println("<h2>회원가입 완료</h2>");
} else {
	out.println("<script>alert('회원가입 완료'); history.back();</script>");
	//out.println("<h2>회원가입 실패</h2>");
}
%>
</body>
</html>