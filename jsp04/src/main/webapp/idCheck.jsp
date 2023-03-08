<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
String userID = request.getParameter("userID");

String driver = "oracle.jdbc.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "YONEE001";
String pw = "0000";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
int result = 0;

String sql = "SELECT COUNT(*) as COUNT FROM MEMBER02 WHERE USERID = ?";

try {
	//1. 드라이버 찾기
	Class.forName(driver);
	//2. db 연결
	conn = DriverManager.getConnection(url, id, pw);
	// 쿼리 날리기.
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,userID);
	
	rs = pstmt.executeQuery();
	if(rs.next()) {
		result = rs.getInt("count");
		System.out.println("result : " + result);
	} else {
		System.out.println("idCheck에서 예외 발생");
	}
} catch (Exception e) {
	e.printStackTrace();
} finally {
	if(pstmt!=null) pstmt.close();
	if(conn!=null) conn.close();
}
%>