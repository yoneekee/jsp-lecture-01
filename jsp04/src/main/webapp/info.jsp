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
System.out.println(userID);
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
		out.println("<h2> [" + rs.getString("userName") + " 님의 정보 ]</h2>");
		out.println("<ul>");
		out.println("<li>이름 : " + rs.getString("userName") + "</li>");
		out.println("<li>아이디 : " + rs.getString("userID") + "</li>");
		out.println("<li>이메일 : " + rs.getString("userEmail") + "</li>");	
		String phone = rs.getString("userHP");
		out.println("<li>전화번호 : " + phone.substring(0, 3) + "-" + phone.substring(3, 7) + "-" + phone.substring(7)+ "</li>");
		out.println("<li>주소 : " + rs.getString("address") + "(" + rs.getInt("zipcode") + ")</li>");
		out.println("<li>가입일 : " + rs.getDate("regdate") +"</li>");
		out.println("</ul>");
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

</body>
</html>