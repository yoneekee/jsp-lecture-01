package com.jjang051.controller;

import com.jjang051.model.MemberDao;
import com.jjang051.model.MemberDto;

public class test {

	public static void main(String[] args) {
		MemberDao dao = new MemberDao();
		MemberDto dto = new MemberDto();

		System.out.println(dao.getOneMember("admin").toString());
	}
}
