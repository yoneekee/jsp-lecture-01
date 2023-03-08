<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
int idx = Integer.parseInt(request.getParameter("idx"));
//System.out.println(idx);

String driver = "oracle.jdbc.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "YONEE001";
String pw = "0000";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "SELECT * FROM BOARD WHERE NO = " + idx; // 최신순으로 나오게

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
<title></title>
</head>
<body>

	<%
	while (rs.next()) {
		out.println("<table>");
		out.println("<colgroup><col style='width: 20%' /><col style='width: 80%' /></colgroup><tbody>");
		out.println("<tr>");
		out.println("<th>게시물번호 : </th>");
		out.println("<td>" + rs.getInt("no") + "</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<th>작성자 : </th>");
		out.println("<td>" + rs.getString("userName") + "</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<th>글제목 : </th>");
		out.println("<td>" + rs.getString("subject") + "</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<th>글내용 : </th>");
		out.println("<td>" + rs.getString("contents") + "</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<th>작성일 : </th>");
		out.println("<td>" + rs.getDate("regdate") + "</td>");
		out.println("</tr>");
		out.println("</tbody></table>");
	}
	%>

	<a href="list.jsp"><button>리스트로 가기</button></a>
	<a href="write.jsp"><button>글쓰러 가기</button></a>
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