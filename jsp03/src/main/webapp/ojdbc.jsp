<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "YONEE001";
	String pw = "0000";
	
	Connection conn = null; // 커넥션 객체 초기화
	
	Class.forName(driver); // 드라이버 가져오겠다
	conn = DriverManager.getConnection(url, id, pw); // 커넥션 연결
	
	System.out.println(conn); // 연결 확인
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

</body>
</html>