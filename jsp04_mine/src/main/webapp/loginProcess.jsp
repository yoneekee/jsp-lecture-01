<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
String userID = request.getParameter("userID");
String userPW = request.getParameter("userPW");

String driver = "oracle.jdbc.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "YONEE001";
String pw = "0000";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "SELECT * FROM MEMBER02 WHERE USERID = ? AND USERPW = ?";

try {
	//1. 드라이버 찾기
	Class.forName(driver);
	//2. db 연결
	conn = DriverManager.getConnection(url, id, pw);
	// 쿼리 날리기.
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userID);
	pstmt.setString(2, userPW);
	
	rs = pstmt.executeQuery();
	
	if(rs.next()) { // 결과값이 하나라도 있으면 (pk조건 때문에 하나일 것)
		String userName = rs.getString("userName");
		String userId = rs.getString("userID");
		out.println("<script>alert('" + userName + " 님 로그인 되었습니다.');</script>");	
		session.setAttribute("userID", userId);
		session.setAttribute("userName", userName);
		response.sendRedirect("index_hello.jsp");
	} else {
		out.println("<script> alert('로그인에 실패했습니다. 아이디 패스워드 확인 요망.'); history.back(); </script>");
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