<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
int idx = Integer.parseInt(request.getParameter("idx"));
System.out.println(idx);

String driver = "oracle.jdbc.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "YONEE001";
String pw = "0000";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "SELECT * FROM BOARD WHERE NO = ?";

try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, id, pw);
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, idx);
	rs = pstmt.executeQuery();

	if (rs.next()) {

		int no = rs.getInt("no");
		String userName = rs.getString("userName");
		String subject = rs.getString("subject");
		String contents = rs.getString("contents");
		Date regdate = rs.getDate("regdate");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="./js/jquery-3.6.3.min.js"></script>
<title></title>
</head>
<body>

	<table>
		<colgroup>
			<col style='width: 20%' />
			<col style='width: 80%' />
		</colgroup>
		<tbody>
			<tr>
				<th>게시물번호 :</th>
				<td><%=no%></td>
			</tr>
			<tr>
				<th>작성자 :</th>
				<td><%=userName%></td>
			</tr>
			<tr>
				<th>글제목 :</th>
				<td><%=subject%><input type="hidden" value=<%=subject%>
					name="subject" /></td>
			</tr>
			<tr>
				<th>글내용 :</th>
				<td><%=contents%><input type="hidden" value=<%=contents%>
					name="contents" /></td>
			</tr>
			<tr>
				<th>작성일 :</th>
				<td><%=regdate%></td>
			</tr>
		</tbody>
	</table>


	<a href="list.jsp"><button>리스트로 가기</button></a>
	<a href="write.jsp"><button>글쓰러 가기</button></a>
	<a href="delete.jsp?idx=<%=no%>"><button>삭제하러 가기</button></a>
	<a
		href="modify.jsp?userName=<%=userName%>&idx=<%=no%>
		&subject=<%=subject%> &contents=<%=contents%>"><button
			class="btn confirm">수정하러 가기</button></a>

	<!--  
	<form action="modify.jsp" method="POST">
		<input type="hidden" value=<%=no%> name="idx" /> <input type="hidden"
			value=<%=userName%> name="userName" /> <input type="hidden"
			value=<%=subject%> name="subject" /> <input type="hidden"
			value=<%=contents%> name="contents" />
		<button class="btn confirm">수정하러 가기</button>
	</form>
	-->


	<%
	}
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

<script>
	$(".confirm").on("click", function() {
		const msg = "this is a msg for checking ajax function";
		//alert(msg);
		$.ajax({
			url : "modify.jsp", 
			dataType : "json",
			Type : "post",
			data : {
				"ajaxMsg" : msg
			},
			fail : function(error) {
				alert(error);
			},
			success : function(response) {
				alert(response);
			}
		});
	});
</script>

</html>