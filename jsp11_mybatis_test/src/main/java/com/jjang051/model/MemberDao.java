package com.jjang051.model;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import com.jjang051.mybatis.MybatisConnectionFactory;

public class MemberDao {
	public List<MemberDto> getAllMember() {
		List<MemberDto> memberList = null;
		SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
		memberList = sqlSession.selectList("getAllMember");
		sqlSession.close();
		return memberList;
	}

	public MemberDto getOneMember(String userId) {
		MemberDto memberDto = null;
		SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
		memberDto = sqlSession.selectOne("getOneMember", userId);
		sqlSession.close();
		return memberDto;
	}
	public int insertMember(MemberDto memberDto) {
		int result = 0;
		SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
		result = sqlSession.insert("insertMember", memberDto);
		if (result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		sqlSession.close();
		return result;
	}

	public int updateMember(MemberDto memberDto) {
		int result = 0;
		SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
		result = sqlSession.insert("updateMember", memberDto);
		if (result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		sqlSession.close();
		return result;
	}

	

}
