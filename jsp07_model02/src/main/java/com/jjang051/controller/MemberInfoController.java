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

@WebServlet("/member/info")
public class MemberInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberInfoController() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		MemberDao memberDao = new MemberDao();
		MemberDto  memberDto = new MemberDto();
		memberDto = memberDao.getMemberInfo(userId);
		request.setAttribute("memberInfo", memberDto);
		RequestDispatcher dispatcher =  request.getRequestDispatcher("/WEB-INF/member/info.jsp");
		dispatcher.forward(request, response);
		System.out.println(memberDto.toString());
		
	}
}
