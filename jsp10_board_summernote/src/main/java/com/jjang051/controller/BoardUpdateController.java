package com.jjang051.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jjang051.model.BoardDao;
import com.jjang051.model.BoardDto;
import com.jjang051.utils.ScriptWriter;

@WebServlet("/board/update")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoardUpdateController() {
		super();

	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		BoardDao boardDao = new BoardDao();
		int no = Integer.parseInt(request.getParameter("no"));
		BoardDto dto = boardDao.getSelectOne(no);
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("/WEB-INF/board/update.jsp");
		request.setAttribute("boardDto", dto);
		dispatcher.forward(request, response);
	}
}
