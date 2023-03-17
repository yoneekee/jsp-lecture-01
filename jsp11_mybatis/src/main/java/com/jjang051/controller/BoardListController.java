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

@WebServlet("/board/list")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BoardListController() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDao boardDao = new BoardDao();
		int total = boardDao.getTotal();  // db에서 긁어온 글 전체 갯수
		int listPerPage = 5;              // 한번에 보여질 글목록에 뿌려질 갯수
		int pageBlock = 4; 
		// 아래쪽 아래쪽 페이지(pageBox)에 한번에 뿌려질 페이지 갯수;  이전 1/2/3 다음  |  이전 4/5/6 다음  
		
		
		String tempClickedPage = request.getParameter("page");
		int clickedPage = 0;
		if(tempClickedPage==null) {
			clickedPage = 1;
		} else {
			clickedPage = Integer.parseInt(tempClickedPage); 
		}
		
		int start = (clickedPage-1)*listPerPage+1;  // 글 목록시작  
		int end = start+listPerPage-1;        // 글 목록 끝
		
		System.out.println("end==="+end);
		
		int pageStart = (int)((clickedPage-1)/pageBlock)*pageBlock+1;  
		int pageEnd = pageStart+pageBlock-1;
		int pageLast = 0;  // 아래쪽 페이지(pageBox)의 전체 갯수
		
		if(total%listPerPage==0) {
			pageLast =  (int)(total / listPerPage);
		} else {
			pageLast =  (int)(total / listPerPage)+1;
		}
		
		if(pageEnd>pageLast) {
			pageEnd = pageLast;
		};
		
		
		ArrayList<BoardDto> boardList = 
				(ArrayList<BoardDto>) boardDao.getAllBoard02(start,end);
		request.setAttribute("boardList", boardList);
		request.setAttribute("clickedPage", clickedPage);
		request.setAttribute("total", total);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("listPerPage", listPerPage);
		request.setAttribute("pageLast", pageLast);
		request.setAttribute("pageStart", pageStart);
		request.setAttribute("pageEnd", pageEnd);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/board/list.jsp");
		dispatcher.forward(request, response);
	}
}







