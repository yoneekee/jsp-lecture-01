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
		
		ClockDao clockDao = new ClockDao();
		ArrayList<ClockDto> clockList = clockDao.getAllClock();
		request.setAttribute("clockList", clockList);
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("/WEB-INF/index/index.jsp");
		dispatcher.forward(request, response);
		/*
		 * request.setAttribute("name", "장성호"); 
		 * request.setAttribute("age", 30);
		 * request.setAttribute("weight", 80);
		 */
		
	}
}
