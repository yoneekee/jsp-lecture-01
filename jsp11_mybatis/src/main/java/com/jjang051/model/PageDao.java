package com.jjang051.model;

public class PageDao {

	// start 구하는 함수 (한 페이지)
	public int getStart(int clickedPage, int listPerPage) {
		return (clickedPage - 1) * listPerPage + 1;
	}
	
	// end 구하는 함수 (한 페이지)
	public int getEnd(int start, int listPerPage) {
		return start + listPerPage - 1;
	}
	
	// pageStart 구하는 함수
	public int getPageStart(int clickedPage, int pageBlock) {
		return (int) ((clickedPage - 1) / pageBlock) * pageBlock + 1;
	}
	
	// pageEnd 구하는 함수
	public int getPageEnd(int pageStart, int pageBlock) {
		return pageStart + pageBlock - 1;
	}
	
}
