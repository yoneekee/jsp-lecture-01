package com.jjang051.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jjang051.model.BoardDao;
import com.jjang051.model.BoardDto;
import com.jjang051.model.MemberDao;
import com.jjang051.model.MemberDto;

@WebServlet("/board/memberList")
public class MemberListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MemberListController() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		MemberDao memberDao = new MemberDao();
		ArrayList<MemberDto> memberList = (ArrayList<MemberDto>) memberDao.getAllMember();
		request.setAttribute("memberList", memberList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/board/memberList.jsp");
		dispatcher.forward(request, response);
	}
}







