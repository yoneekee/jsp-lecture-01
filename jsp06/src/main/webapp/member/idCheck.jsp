<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = request.getParameter("userID");
	
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "YONEE001";
	String pw = "0000";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "SELECT COUNT(*) AS COUNT FROM MEMBER02 WHERE USERID = ?";
	int result = 0;
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, id, pw);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,userID);
		rs = pstmt.executeQuery();
		if(rs.next()){
			result  = rs.getInt("count");
			System.out.println(result);
			out.print(result);
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
	}
%>