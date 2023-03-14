package com.jjang051.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jjang051.model.ClockDao;
import com.jjang051.model.ClockDto;
import com.jjang051.model.Member;

@WebServlet(urlPatterns = { "/index/*" })
public class IndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public IndexController() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ClockDao dao = new ClockDao();
		ArrayList<ClockDto> clockList = dao.getAllClock();
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/index/index.jsp");

		Member member = new Member();
		member.setName("장성호");
		member.setAge(30);
		member.setWeight(80);
		request.setAttribute("member", member); // 뭐든 실을 수 있다.
		request.setAttribute("clockList", clockList);
		
		dispatcher.forward(request, response);
	}
}
