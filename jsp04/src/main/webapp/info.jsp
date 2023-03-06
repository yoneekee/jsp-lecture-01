<!-- info.jsp -->

<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String driver = "oracle.jdbc.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "YONEE001";
String pw = "0000";
String userID = (String) session.getAttribute("userID");

request.setCharacterEncoding("UTF-8");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "SELECT * FROM MEMBER02 WHERE userID = ?";
System.out.println(userID);
try {
	//1. 드라이버 찾기
	Class.forName(driver);
	//2. db 연결
	conn = DriverManager.getConnection(url, id, pw);
	// 쿼리 날리기.
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userID);
	rs = pstmt.executeQuery();
	if (rs.next()) {
		String userId = rs.getString("userID");
		String userPw = rs.getString("userPW");
		String userEmail = rs.getString("userEmail");
		String userName = rs.getString("userName");
		String address = rs.getString("address");
		String phone = rs.getString("userHP");
		int zipcode = rs.getInt("zipcode");
		Date regdate = rs.getDate("regdate");

		request.setAttribute("userName", userName);
		request.setAttribute("userId", userId);
		request.setAttribute("userEmail", userEmail);
		request.setAttribute("userPw", userPw);
		request.setAttribute("address", address + " (우편번호 : " + zipcode + ")");
		request.setAttribute("phone", phone);
		request.setAttribute("regdate", regdate);
		RequestDispatcher dispatcher = request.getRequestDispatcher("./info_show.jsp");
		dispatcher.forward(request, response);

	} else {

	}
} catch (Exception e) {
	e.printStackTrace();
} finally {

	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	if (rs != null)
		rs.close();
}
%>

</body>
</html>