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
import com.jjang051.utils.ScriptWriter;

@WebServlet("/board/delete")
public class BoardDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoardDeleteController() {
		super();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		int no = Integer.parseInt( request.getParameter("no"));
		BoardDao boardDao = new BoardDao();
		int result = boardDao.deleteBoard(no);
		
		if(result > 0) {
			ScriptWriter.alertAndNext(response, "삭제 완료", "./list");
		} else {
			ScriptWriter.alertAndBack(response, "삭제 실패. 다시 한 번 시도해 주세요.");
		}
	}
}
