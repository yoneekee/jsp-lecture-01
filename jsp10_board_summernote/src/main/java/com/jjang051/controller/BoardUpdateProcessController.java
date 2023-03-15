package com.jjang051.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jjang051.model.BoardDao;
import com.jjang051.model.BoardDto;
import com.jjang051.utils.ScriptWriter;

/**
 * Servlet implementation class BoardUpdateProcessController
 */
@WebServlet("/board/updateProcess")
public class BoardUpdateProcessController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoardUpdateProcessController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		BoardDto boardDto = new BoardDto();
		boardDto.setNo(no);
		boardDto.setContents(contents);
		boardDto.setTitle(title);
		BoardDao boardDao = new BoardDao();
		int result = boardDao.updateBoard(boardDto);
		if (result > 0) {
			ScriptWriter.alertAndNext(response, "글이 수정되었습니다.", "../board/view?no=" + no);
		} else {
			ScriptWriter.alertAndBack(response, "서버오류 !! 잠시후 다시 시도해 주세요.");
		}
		System.out.println(contents);

	}

}
