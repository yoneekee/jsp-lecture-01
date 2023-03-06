<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String userId = (String) session.getAttribute("userId");
String userPW = request.getParameter("userPW");
String userName = request.getParameter("userName");
String userEmail = request.getParameter("userEmail");
String userHp = request.getParameter("userHp");
int userZipcode = Integer.parseInt(request.getParameter("userZipcode"));
String userAddr01 = request.getParameter("userAddr01");
String userAddr02 = request.getParameter("userAddr02");
String userAddr03 = request.getParameter("userAddr03");
String address = userAddr01 + userAddr02 + userAddr03;

String driver = "oracle.jdbc.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "YONEE001";
String pw = "0000";

request.setCharacterEncoding("UTF-8");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "UPDATE MEMBER02 SET userPW=?, userName = ?, userEmail=?, userHp=?, address=? WHERE userID = ?";

try {
	//1. 드라이버 찾기
	Class.forName(driver);
	//2. db 연결
	conn = DriverManager.getConnection(url, id, pw);
	// 쿼리 날리기.
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userPW);
	pstmt.setString(2, userName);
	pstmt.setString(3, userEmail);
	pstmt.setString(4, userHp);
	pstmt.setString(5, address);
	pstmt.setString(6, userId);
	int result = pstmt.executeUpdate();

	if (result > 0) {
		session.setAttribute("userName", userName);
		out.println("<script> alert('회원정보 수정 성공.'); location.href='index.jsp'</script>");
	} else {
		out.println("<script> alert('수정에 실패했습니다. 확인 요망.'); history.back(); </script>");
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