package com.jjang051.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jjang051.model.MemberDao;
import com.jjang051.model.MemberDto;
import com.jjang051.utils.ScriptWriter;

@WebServlet("/member/loginProcess")
public class LoginProcessController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginProcessController() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		MemberDao memberDao = new MemberDao();
		MemberDto memberDto = new MemberDto();
		memberDto.setUserId(userId);
		memberDto.setUserPw(userPw);
		MemberDto loggedMemberInfo = 
				memberDao.getLoggedMemberInfo(memberDto);
		if(loggedMemberInfo!=null) {
			session.setAttribute("loggedMemberInfo", loggedMemberInfo);
			ScriptWriter.alertAndNext(response, "로그인 되었습니다.", "../index/");
		} else {
			ScriptWriter.alertAndBack(response, "아이디 패스워드 확인해 주세요.");
		}
	}
}




