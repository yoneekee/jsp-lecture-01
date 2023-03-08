<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String userName = request.getParameter("userName");
String subject = request.getParameter("subject");
String userPW = request.getParameter("userPW");
String contents = request.getParameter("contents");

String driver = "oracle.jdbc.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "YONEE001";
String pw = "0000";

Connection conn = null;
PreparedStatement pstmt = null;
//ResultSet rs = null;

String sql = "INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL, ?, ?, ?, ?, SYSDATE)";

try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, id, pw);
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,userName);
	pstmt.setString(2, subject);
	pstmt.setString(3, userPW);
	pstmt.setString(4, contents);
	int result = pstmt.executeUpdate();
	if(result > 0) {
		out.println("<script>alert('작성 완료'); history.back();</script>");
		System.out.println("작성 완료");
	} else{
		out.println("<script>alert('작성 실패'); history.back();</script>");
		System.out.println("작성 실패");
	}
} catch (Exception e) {
	e.printStackTrace();
} finally {
	if(pstmt!=null) pstmt.close();
	if(conn!=null) conn.close();
}
%>