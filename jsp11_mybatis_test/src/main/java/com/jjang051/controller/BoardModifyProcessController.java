package com.jjang051.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jjang051.model.BoardDao;
import com.jjang051.model.BoardDto;
import com.jjang051.util.ScriptWriter;

@WebServlet("/board/modifyProcess")
public class BoardModifyProcessController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		BoardDto boardDto = new BoardDto();
		boardDto.setNo(Integer.parseInt(request.getParameter("no")));
		boardDto.setUserName(request.getParameter("userName"));
		boardDto.setSubject(request.getParameter("subject"));
		boardDto.setContents(request.getParameter("contents"));
		BoardDao boardDao = new BoardDao();
		int result = boardDao.updateBoard(boardDto);
		if (result > 0) {
			ScriptWriter.alertAndNext(response, "글이 수정되었습니다.", "../board/list");
		} else {
			ScriptWriter.alertAndBack(response, "수정 시 문제 발생, 다시 시도.");
			System.out.println(boardDto.toString());
		}
	}

}
