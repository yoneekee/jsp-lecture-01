<%@page import="com.jjang051.utils.ScriptWriter"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
int idx = Integer.parseInt(request.getParameter("idx"));
String userPW = request.getParameter("userPW");
String msg = request.getParameter("ajaxTest");
System.out.println("ajaxMsg : " + msg);

String driver = "oracle.jdbc.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "YONEE001";
String pw = "0000";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "DELETE FROM BOARD WHERE NO = ? AND USERPW = ?";

try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, id, pw);
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, idx);
	pstmt.setString(2, userPW);

	int result = pstmt.executeUpdate();
	if (result > 0) {
		ScriptWriter.alertAndNext(response, "삭제 완료", "list.jsp");
	} else {
		ScriptWriter.alertAndBack(response, "삭제 실패");
	}
} catch (Exception e) {
	e.printStackTrace();
} finally {
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
}
%>
