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


@WebServlet("/board/view")
public class BoardViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BoardViewController() {
        super();
    }


    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int no = Integer.parseInt(request.getParameter("no")) ;
    	BoardDao boardDao = new BoardDao();
    	int result = boardDao.updateHit(no);
    	BoardDto boardDto = boardDao.getSelectOne(no);
    	request.setAttribute("boardDto", boardDto);
    	RequestDispatcher dispatcher = 
    			request.getRequestDispatcher("/WEB-INF/board/view.jsp");
		dispatcher.forward(request, response);
    }


}
