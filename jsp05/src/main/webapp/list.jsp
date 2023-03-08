<%@page import="java.sql.*"%>
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

String sql = "SELECT * FROM BOARD ORDER BY NO DESC"; // 최신순으로 나오게

try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, id, pw);
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
</head>
<body>
	<h1>BOARD LIST</h1>
	<a href="write.jsp"><button>글쓰러 가기</button></a>
	<hr>


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
		out.println("<td><a href='view.jsp?idx=" + rs.getInt("no") + "'>" + rs.getString("subject") + "</a></td>");
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

</body>

</html>