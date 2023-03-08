<%@page import="com.jjang051.utils.CookieManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = request.getParameter("userID");
	String userPW = request.getParameter("userPW");
	String saveId = request.getParameter("saveId");
	
	System.out.println(userID+"==="+userPW+"==="+saveId);

	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "YONEE001";
	String pw = "0000";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "SELECT * FROM MEMBER02 WHERE USERID = ? AND USERPW = ?";
	
	try {
		//1. 드라이버 찾기
		Class.forName(driver);
		//2. db 연결
		conn = DriverManager.getConnection(url, id, pw);
		// 쿼리 날리기.
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,userID);
		pstmt.setString(2,userPW);

		rs = pstmt.executeQuery();
		if(rs.next()) {
			//response.sendRedirect("list.jsp");
			String userName = rs.getString("USERNAME");
			String userId = rs.getString("USERID");
			session.setAttribute("userName", userName);
			session.setAttribute("userId", userId);
			if(saveId!=null && saveId.equals("yes")) {
				Cookie saveIdCookie = new Cookie("saveIdCookie",userID);
				saveIdCookie.setPath(request.getContextPath());
				saveIdCookie.setMaxAge(60*60*24*30);
				response.addCookie(saveIdCookie);
				CookieManager.makeCookie(response, "aaa", "bbb", 60*60);
			} else {
				//Cookie saveIdCookie = new Cookie("saveIdCookie",null);
				//saveIdCookie.setMaxAge(0);
				//response.addCookie(saveIdCookie); 
				CookieManager.deleteCookie(response, "saveIdCookie");
			}
			response.sendRedirect("index.jsp");
			//out.println("<script>alert('"+userName+"님 로그인 되었습니다.');</script>");
		} else {
			out.println("<script>alert('아이디 비밀번호를 확인해 주세요.'); history.back();</script>");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
	}
	
	

%>