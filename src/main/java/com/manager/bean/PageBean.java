package com.manager.bean;

import java.util.List;

public class PageBean<T> {
	
	private int currentPage = 1; //当前页，默认显示第一页
	
	private int pageCount = 10; //每页显示行数
	
	private int totalRecord; //总记录数
	
	private int totalPage; //总页数
	
	private List<T> pageData; //分页查询到的数据
	
	/*
	 * 获取总页数
	 */
	public int getTotalPage(){
		totalPage = (totalRecord -1)/pageCount +1;
		return totalPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public List<T> getPageData() {
		return pageData;
	}

	public void setPageData(List<T> pageData) {
		this.pageData = pageData;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	

}
