package com.jjang051.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jjang051.model.BoardDao;
import com.jjang051.model.BoardDto;
import com.jjang051.model.MemberDao;
import com.jjang051.model.MemberDto;
import com.jjang051.util.ScriptWriter;

@WebServlet("/board/joinProcess")
public class MemberJoinProcessController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberJoinProcessController() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		MemberDto memberDto = new MemberDto();
		memberDto.setUserId(request.getParameter("userId"));
		memberDto.setUserPwd(request.getParameter("userPwd"));
		MemberDao memberDao = new MemberDao();
		MemberDto duplicateCheck = memberDao.getOneMember(request.getParameter("userId"));
		
		if(duplicateCheck != null) {
			ScriptWriter.alertAndBack(response, "이미 존재하는 아이디입니다.");
			return ;
		}
		
		int result = memberDao.insertMember(memberDto);
		
		if(result>0) {
			ScriptWriter.alertAndNext(response, "회원가입이 완료되었습니다.", "../board/memberList");
		}
	}
}
