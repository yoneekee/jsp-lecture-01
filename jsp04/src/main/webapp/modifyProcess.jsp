	<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<%
		// 넘어오는 데이터 한글 깨짐 방비...
		request.setCharacterEncoding("UTF-8");
		String userID = (String)session.getAttribute("userId");
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
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE MEMBER02 SET "
				+"USERNAME = ?,USEREMAIL = ?, ZIPCODE=?," 
				+"USERHP = ?, ADDRESS = ? WHERE USERID = ? AND USERPW = ?";
		
		try {
			//1. 드라이버 찾기
			Class.forName(driver);
			//2. db 연결
			conn = DriverManager.getConnection(url, id, pw);
			// 쿼리 날리기.
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2, userEmail);
			pstmt.setInt(3, userZipcode);
			pstmt.setString(4, userHp);
			pstmt.setString(5, address);
			pstmt.setString(6, userID);
			pstmt.setString(7, userPW);
			int result = pstmt.executeUpdate();
			if (result > 0) {
				//response.sendRedirect("list.jsp");
				out.println("<script>alert('회원정보가 수정 되었습니다.');location.href='index.jsp'</script>");
			} else {
				out.println("<script>alert('뭔가 잘못된거 같아요...');</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	%>