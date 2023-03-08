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
	while (rs.next()) {
	%>
	<ul>
		<li>번호 : <%=rs.getInt("NO")%></li>
		<li>작성자 : <%=rs.getString("userName")%></li>
		<li><a href="view.jsp?idx=<%=rs.getInt("NO")%>">제목 : <%=rs.getString("subject")%></a></li>
		<li>글 내용 : <%=rs.getString("contents")%></li>
		<li>작성일 : <%=rs.getDate("regdate")%></li>
	</ul>
	<%
	}
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