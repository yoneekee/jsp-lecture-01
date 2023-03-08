<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String driver = "oracle.jdbc.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "YONEE001";
String pw = "0000";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "SELECT * FROM BOARD";

try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, id, pw);
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
%>

<%@ include file="../include/header.jsp"%>

<ul>
	<%
	out.println("<table>");
	out.println("<colgroup><col style='width: 20%' /><col style='width: 80%' /></colgroup><tbody>");
	int index = 1;
	while (rs.next()) {
		out.println("<tr>");
		out.println("<th>게시물번호 : </th>");
		out.println("<td>" + index++ + "</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<th>작성자 : </th>");
		out.println("<td>" + rs.getString("userName") + "</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<th>글제목 : </th>");
		out.println("<td style='color:blue'>");
		out.println("<a href='view.jsp?idx=" + rs.getInt("no") + "'>" + rs.getString("subject") + "</a>");
		out.println("</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<th>글내용 : </th>");
		out.println("<td>" + rs.getString("contents") + "</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<th>작성일 : </th>");
		out.println("<td>" + rs.getDate("regdate") + "</td>");
		out.println("</tr>");
	}
	out.println("</tbody></table>");
	%>
</ul>
<div>
	<a href="write.jsp">글쓰기</a>
</div>
<%@ include file="../include/footer.jsp"%>
<%
} catch (Exception e) {
e.printStackTrace();
} finally {
if (rs != null)
	rs.close();
if (pstmt != null)
	pstmt.close();
if (conn != null)
	conn.close();
}
%>