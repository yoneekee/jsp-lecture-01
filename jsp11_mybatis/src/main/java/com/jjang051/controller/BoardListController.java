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
import com.jjang051.model.PageDto;
import com.jjang051.model.PageDao;

@WebServlet("/board/list")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoardListController() {
		super();
	}

	// < 한 페이지 당 글 불러오는 myBatis SQL문 >
	// SELECT * FROM (
	// SELECT ROWNUM AS NUM, B.* FROM
	// (SELECT * FROM BOARD03 ORDER BY NO DESC) B
	// )
	// WHERE NUM >= #{start} AND NUM <= #{end}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BoardDao boardDao = new BoardDao();
		PageDao pageDao = new PageDao();
		
		int total = boardDao.getTotal(); // db에서 긁어온 글 전체 갯수
		int listPerPage = 5; // 한번에 보여질 글목록에 뿌려질 갯수
		int pageBlock = 4; // 아래쪽 아래쪽 페이지(pageBox)에 한번에 뿌려질 페이지 갯수; 이전 1/2/3 다음 | 이전 4/5/6 다음
		String tempClickedPage = request.getParameter("page");
		// list에 처음 접속 시 쿼리스트링이 없어서 page가 null일 수 있다. 그 경우를 처리

		int clickedPage = 0;
		if (tempClickedPage == null) {
			clickedPage = 1;
		} else {
			clickedPage = Integer.parseInt(tempClickedPage);
		}

		int start = pageDao.getStart(clickedPage, listPerPage); // 글 목록시작
		int end = pageDao.getEnd(start, listPerPage); // 글 목록 끝

		System.out.println("end===" + end);

		int pageStart = pageDao.getPageStart(clickedPage, pageBlock);
		int pageEnd = pageDao.getPageEnd(pageStart, pageBlock);
		int pageLast = 0; // 아래쪽 페이지(pageBox)의 전체 갯수

		if (total % listPerPage == 0) {
			pageLast = (int) (total / listPerPage);
		} else {
			pageLast = (int) (total / listPerPage) + 1;
			// 만약에 101개의 글이 있고 5개가 listPerPage라면
			// 100개에서 페이지가 끊겨버리기에, 나누어 떨어지지 않는다면 +1을 해야 함
		}

		if (pageEnd > pageLast) {
			pageEnd = pageLast;
		}
		;

		// 이렇게 너무 많은 request를 보내야 할 때는 Dto 및 Dao 만드는 걸 고려해야 함
		ArrayList<BoardDto> boardList = (ArrayList<BoardDto>) boardDao.getAllBoard02(start, end);
		//		request.setAttribute("boardList", boardList);
		//		request.setAttribute("clickedPage", clickedPage);
		//		request.setAttribute("total", total);
		//		request.setAttribute("pageBlock", pageBlock);
		//		request.setAttribute("listPerPage", listPerPage);
		//		request.setAttribute("pageLast", pageLast);
		//		request.setAttribute("pageStart", pageStart);
		//		request.setAttribute("pageEnd", pageEnd);
		
		PageDto pageDto = new PageDto();
		pageDto.setBoardList(boardList);
		pageDto.setClickedPage(clickedPage);
		pageDto.setTotal(total);
		pageDto.setPageBlock(pageBlock);
		pageDto.setListPerPage(listPerPage);
		pageDto.setPageLast(pageLast);
		pageDto.setPageStart(pageStart);
		pageDto.setPageEnd(pageEnd);

		request.setAttribute("pageDto", pageDto);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/board/list.jsp");
		dispatcher.forward(request, response);
	}
}
