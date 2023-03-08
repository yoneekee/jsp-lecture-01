<%@page import="com.jjang051.utils.ScriptWriter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");
int idx = Integer.parseInt(request.getParameter("idx"));
String contents = request.getParameter("contents");
String userPW = request.getParameter("userPW");

System.out.println(idx);

String driver = "oracle.jdbc.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "YONEE001";
String pw = "0000";

Connection conn = null;
PreparedStatement pstmt = null;


String sql = "UPDATE BOARD SET CONTENTS = ? WHERE NO = ? AND USERPW = ?";
try{
	Class.forName(driver);
	conn = DriverManager.getConnection(url, id, pw);
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,contents);
	pstmt.setInt(2,idx);
	pstmt.setString(3,userPW);
	int result = pstmt.executeUpdate();
	if(result > 0) {
		ScriptWriter.alertAndNext(response, "글이 수정되었습니다.", "list.jsp");		
	} else {
		ScriptWriter.alertAndBack(response, "패스워드를 확인해 주세요.");
	}
} catch (Exception e) {
	e.printStackTrace();
} finally {
	if(pstmt!=null) pstmt.close();
	if(conn!=null) conn.close();
}
%>