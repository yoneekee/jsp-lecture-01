<%@page import="com.jjang051.utils.ScriptWriter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("UTF-8");
	// 넘어온 데이터 받기
	String userPw = request.getParameter("userPW");
	int idx = Integer.parseInt( request.getParameter("idx") );
	
	// db연결
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "YONEE001";
	String pw = "0000";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String sql =  "DELETE FROM BOARD WHERE NO = ? AND USERPW = ?";
	
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url, id, pw);
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,idx);
		pstmt.setString(2,userPw);
		int result = pstmt.executeUpdate();
		if(result>0) {
			ScriptWriter.alertAndNext(response, "글이 삭제되었습니다.", "list.jsp");
		} else {
			ScriptWriter.alertAndBack(response, "서버 오류 입니다. 잠시후 다시 시도해 주시기 바랍니다.");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
	}
	
	System.out.println(userPw+"==="+idx);
%>