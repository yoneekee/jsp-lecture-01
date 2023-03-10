package com.jjang051.model;


import java.sql.SQLException;

public class MemberDao extends getConnection {

	public MemberDao() {
		super();
	}



	// crud 작성
	public int insertMember(MemberDto memberDto) {
		int result = 0;
		
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
		MemberDto memberDto = null;
		
		String sql = "SELECT * FROM MEMBER02 WHERE USERID = ?";
		try {
			memberDto = new MemberDto();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				memberDto.setNo(rs.getInt("no"));
				memberDto.setUserId(rs.getString("userId"));
				memberDto.setUserName(rs.getString("userName"));
				memberDto.setUserHp(rs.getString("userHp"));
				memberDto.setZipCode(rs.getInt("zipCode"));
				memberDto.setAddress(rs.getString("address"));
				memberDto.setUserEmail(rs.getString("userEmail"));
				memberDto.setRegDate(rs.getString("regdate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return memberDto;
	}
	
	public MemberDto getLoggedMemberInfo(String userId, String userPw) {

		MemberDto loggedMember = null;
		
		String sql = "SELECT * FROM MEMBER02 WHERE USERID = ? AND USERPW = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPw);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				loggedMember = new MemberDto();
				loggedMember.setUserId(rs.getString("userId"));
				loggedMember.setUserName(rs.getString("userName"));
				loggedMember.setUserHp(rs.getString("userHp"));
				loggedMember.setZipCode(rs.getInt("zipCode"));
				loggedMember.setAddress(rs.getString("address"));
				loggedMember.setUserEmail(rs.getString("userEmail"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return loggedMember;
	}


	public MemberDto getLoggedMemberInfo(MemberDto dto) {

		MemberDto loggedMember = null;
		
		String sql = "SELECT * FROM MEMBER02 WHERE USERID = ? AND USERPW = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserPw());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				loggedMember = new MemberDto();
				loggedMember.setUserId(rs.getString("userId"));
				loggedMember.setUserName(rs.getString("userName"));
				loggedMember.setUserHp(rs.getString("userHp"));
				loggedMember.setZipCode(rs.getInt("zipCode"));
				loggedMember.setAddress(rs.getString("address"));
				loggedMember.setUserEmail(rs.getString("userEmail"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return loggedMember;
	}
}
