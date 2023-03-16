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
import com.jjang051.util.ScriptWriter;

@WebServlet("/board/modify")
public class BoardModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BoardModifyController() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int no = Integer.parseInt(request.getParameter("no"));
		BoardDto dto = new BoardDto();
		BoardDao dao = new BoardDao();
		dto = dao.getSelectOne(no);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/board/modify.jsp");
		request.setAttribute("boardDto", dto);
		dispatcher.forward(request, response);
	}

}
