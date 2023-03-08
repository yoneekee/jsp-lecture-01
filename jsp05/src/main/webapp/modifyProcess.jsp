<%@page import="com.jjang051.utils.ScriptWriter"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
int idx = Integer.parseInt(request.getParameter("idx"));
String userPW = request.getParameter("userPW");
String contents = request.getParameter("contents");
System.out.println(idx + userPW + contents );

String driver = "oracle.jdbc.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "YONEE001";
String pw = "0000";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "UPDATE BOARD SET contents = ? WHERE NO = ? AND userPW = ?";

try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, id, pw);
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, contents);
	pstmt.setInt(2, idx);
	pstmt.setString(3, userPW);

	int result = pstmt.executeUpdate();
	if (result > 0) {
		ScriptWriter.alertAndNext(response, "수정 완료", "view.jsp?idx=" + idx);
	} else {
		ScriptWriter.alertAndBack(response, "수정 실패, 비밀번호를 확인해 주세요.");
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
