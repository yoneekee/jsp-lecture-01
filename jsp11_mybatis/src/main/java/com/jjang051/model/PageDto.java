package com.jjang051.model;

import java.util.ArrayList;

public class PageDto {

	private ArrayList<BoardDto> boardList;
	private int pageStart;
	private int pageEnd;
	private int pageLast;
	private int listPerPage;
	private int pageBlock;
	private int total;
	private int clickedPage;
	
	public ArrayList<BoardDto> getBoardList() {
		return boardList;
	}
	public void setBoardList(ArrayList<BoardDto> boardList) {
		this.boardList = boardList;
	}
	public int getPageStart() {
		return pageStart;
	}
	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}
	public int getPageEnd() {
		return pageEnd;
	}
	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}
	public int getPageLast() {
		return pageLast;
	}
	public void setPageLast(int pageLast) {
		this.pageLast = pageLast;
	}
	public int getListPerPage() {
		return listPerPage;
	}
	public void setListPerPage(int listPerPage) {
		this.listPerPage = listPerPage;
	}
	public int getPageBlock() {
		return pageBlock;
	}
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getClickedPage() {
		return clickedPage;
	}
	public void setClickedPage(int clickedPage) {
		this.clickedPage = clickedPage;
	}

}
