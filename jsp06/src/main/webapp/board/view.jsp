<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String idx = request.getParameter("idx");
	
	System.out.println(idx);

	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "YONEE001";
	String pw = "0000";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String userName = null;
	String subject = null;
	String contents = null;
	String regDate = null;
	
	String sql = "SELECT * FROM BOARD WHERE NO = ?";
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url, id, pw);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,idx);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			userName =  rs.getString("userName");
			subject =  rs.getString("subject");
			contents =  rs.getString("contents");
			regDate =  rs.getString("regDate");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
	}
	
%>
<%@ include file="../include/header.jsp" %>

	<table>
		<tbody>
			<tr>
				<th>제목 : </th>
				<td><%= subject %></td>
			</tr>
			<tr>
				<th>글쓴이 : </th>
				<td><%= userName %></td>
			</tr>
			<tr>
				<th>날짜 : </th>
				<td><%= regDate %></td>
			</tr>
			<tr>
				<th>내용 : </th>
				<td style="white-space:pre;"><%= contents %></td>
			</tr>
		</tbody>
	</table>
	<div>
		<a href="write.jsp"><button>글쓰기</button></a>
		<a href="modify.jsp?idx=<%= idx %>"><button>수정</button></a>
		<a href="delete.jsp?idx=<%= idx %>"><button>삭제</button></a>
	</div>
<%@ include file="../include/footer.jsp" %>
