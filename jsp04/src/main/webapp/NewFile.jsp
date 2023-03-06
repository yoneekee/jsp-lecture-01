<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String userID = request.getParameter("userID");
String userPW = request.getParameter("userPW");
String userName = request.getParameter("userName");
String userEmail = request.getParameter("userEmail");
String userHp = request.getParameter("userHp");
int userZipcode = Integer.parseInt(request.getParameter("userZipcode"));
String userAddr01 = request.getParameter("userAddr01");
String userAddr02 = request.getParameter("userAddr02");
String userAddr03 = request.getParameter("userAddr03");
String address = request.getParameter("address");

String driver = "oracle.jdbc.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "YONEE001";
String pw = "0000";

Connection conn = null;
PreparedStatement pstmt = null;

String sql = "INSERT INTO MEMBER02 VALUES(MEMBER02_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, SYSDATE)";

try {
	// 1. 드라이버 찾기
	Class.forName(driver);
	// 2. DB 연결
	conn = DriverManager.getConnection(url);
	// 3. 쿼리 날리기
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userID);
	pstmt.setString(2, userPW);
	pstmt.setString(3, userName);
	pstmt.setString(4, userEmail);
	pstmt.setString(5, userHp);
	pstmt.setInt(6, userZipcode);
	pstmt.setString(7, address);
} catch (Exception e) {
	e.printStackTrace();
} finally {
	// DB 객체 닫기 
	// pstmt와 conn의 순서가 바뀌면 안 됨 
	if (pstmt != null) pstmt.close();
	if (conn != null) conn.close();
}
%>
