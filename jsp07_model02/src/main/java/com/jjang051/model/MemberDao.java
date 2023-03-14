package com.jjang051.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDao {

	private String driver = "oracle.jdbc.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String id = "TIS001";
	private String pw = "1234";

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public void getConnection() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, id, pw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// crud 작성
	public int insertMember(MemberDto memberDto) {
		int result = 0;
		getConnection();
		String sql = "INSERT INTO MEMBER02 VALUES(MEMBER02_SEQ.NEXTVAL,?,?,?,?,?,?,?,sysdate)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDto.getUserId());
			pstmt.setString(2, memberDto.getUserPw());
			pstmt.setString(3, memberDto.getUserName());
			pstmt.setString(4, memberDto.getUserEmail());
			pstmt.setString(5, memberDto.getUserHp());
			pstmt.setInt(6, memberDto.getZipCode());
			pstmt.setString(7, memberDto.getAddress());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	public MemberDto getMemberInfo(String userId) {
		MemberDto memberDto = new MemberDto();
		getConnection();
		String sql = "SELECT * FROM MEMBER02 WHERE USERID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memberDto.setUserId(rs.getString("userId"));
				memberDto.setUserName(rs.getString("userName"));
				memberDto.setUserHp(rs.getString("userHp"));
				memberDto.setZipCode(rs.getInt("zipCode"));
				memberDto.setAddress(rs.getString("address"));
				memberDto.setUserEmail(rs.getString("userEmail"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return memberDto;
	}

	public MemberDto getLoggedMemberInfo(MemberDto memberDto) {
		MemberDto loggedMemberInfo = null;
		getConnection();
		String sql = "SELECT * FROM MEMBER02 WHERE USERID = ? AND USERPW = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDto.getUserId());
			pstmt.setString(2, memberDto.getUserPw());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				loggedMemberInfo = new MemberDto();
				loggedMemberInfo.setUserId(rs.getString("userId"));
				loggedMemberInfo.setUserName(rs.getString("userName"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return loggedMemberInfo;
	}
}








