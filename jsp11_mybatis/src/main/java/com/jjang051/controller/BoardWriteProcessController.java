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

@WebServlet("/board/writeProcess")
public class BoardWriteProcessController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardWriteProcessController() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 넘어오는 데이터 받아서 dao넘겨주고
		// 패이지 바꿔주기..
		request.setCharacterEncoding("UTF-8");
		BoardDto boardDto = new BoardDto();
		boardDto.setUserName(request.getParameter("userName"));
		boardDto.setSubject(request.getParameter("subject"));
		boardDto.setContents(request.getParameter("contents"));
		BoardDao boardDao = new BoardDao();
		int result = boardDao.insertBoard(boardDto);
		if(result>0) {
			ScriptWriter.alertAndNext(response, "글이 입력되었습니다.", "../board/list");
		}
	}
}
