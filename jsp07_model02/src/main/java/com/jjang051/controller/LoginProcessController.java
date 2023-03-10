package com.jjang051.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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
		// TODO Auto-generated constructor stub
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		HttpSession session = request.getSession();
		
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		MemberDto dto = new MemberDto(); // 아이디 패스워드 dao로 보내기 위한 dto 객체
		MemberDao memberDao = new MemberDao();
		dto.setUserId(userId);
		dto.setUserPw(userPw);
		MemberDto loggedMemberInfo = memberDao.getLoggedMemberInfo(dto); // 로그인 한 사람이 맞는지 확인하기 위한 객체
		
		if(loggedMemberInfo != null) {
			session.setAttribute("loggedMemberInfo", loggedMemberInfo);
			session.setAttribute("userId", loggedMemberInfo.getUserId());
			session.setAttribute("userName", loggedMemberInfo.getUserName());
			ScriptWriter.alertAndNext(response, loggedMemberInfo.getUserName() + " 님, 반갑습니다.", "../");
			System.out.println(loggedMemberInfo.getUserId() + " 님, 로그인 됨.");
		} else {
			ScriptWriter.alertAndBack(response, "아이디 및 패스워드 재확인 요망");
			System.out.println("로그인 실패.");
		}
		
	}

}
