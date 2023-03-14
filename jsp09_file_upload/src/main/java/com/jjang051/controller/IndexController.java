package com.jjang051.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jjang051.model.Member;

// 인덱스 폴더로 들어오는 모든 것은 얘가 처리
@WebServlet(urlPatterns = {"/index/*"})
public class IndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/index/index.jsp");
		Member member = new Member();
		member.setName("홍길동");
		member.setAge(20);
		member.setWeight(50);
		request.setAttribute("member", member); // 어떤 것이든 실어서 보낼 수 있다.
		dispatcher.forward(request, response);
	}

}
