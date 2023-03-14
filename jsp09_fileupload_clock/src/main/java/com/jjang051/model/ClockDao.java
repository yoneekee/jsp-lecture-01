package com.jjang051.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ClockDao {
	private String driver = "oracle.jdbc.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String id = "YONEE001";
	private String pw = "0000";

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

	// crud
	public int insertClock(ClockDto dto) {
		int result = 0;

		try {
			getConnection();
			String sql = "INSERT INTO CLOCK VALUES (CLOCK_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getCategory());
			pstmt.setInt(3, dto.getDepth());
			pstmt.setInt(4, dto.getPrice());
			pstmt.setString(5, dto.getClockImg());
			pstmt.setString(6, dto.getClockRealImg());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return result;
	}

	public ArrayList<ClockDto> getAllClock() {
		ArrayList<ClockDto> clockList = null;
		try {
			getConnection();
			String sql = "SELECT * FROM CLOCK";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			clockList = new ArrayList<>();
			while (rs.next()) {
				ClockDto dto = new ClockDto();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setCategory(rs.getString("category"));
				dto.setDepth(rs.getInt("depth"));
				dto.setPrice(rs.getInt("price"));
				dto.setClockImg(rs.getString("clockImg"));
				dto.setClockRealImg(rs.getString("clockRealImg"));
				clockList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return clockList;
	}

}
