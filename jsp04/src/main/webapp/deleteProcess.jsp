<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String userID = (String) request.getParameter("userID");
String userPW = (String) request.getParameter("userPW");

String driver = "oracle.jdbc.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "YONEE001";
String pw = "0000";

request.setCharacterEncoding("UTF-8");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "DELETE FROM MEMBER02 WHERE userID = ? AND userPW = ?";

try {
	//1. 드라이버 찾기
	Class.forName(driver);
	//2. db 연결
	conn = DriverManager.getConnection(url, id, pw);
	// 쿼리 날리기.
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userID);
	pstmt.setString(2, userPW);
	int result = pstmt.executeUpdate();

	if (result > 0) {
		out.println("<script> alert('탈퇴 성공.'); </script>");
		if (session.getAttribute("userID") != null) session.removeAttribute("userID");
		if (session.getAttribute("userName") != null) session.removeAttribute("userName");
		response.sendRedirect("./login.jsp");
	} else {
		out.println("<script> alert('탈퇴에 실패했습니다. 아이디 패스워드 확인 요망.'); history.back(); </script>");
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