package cn.bw.ssm.Util;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class PageUtil {
	private int currentPage;//当前页
	private int pageSize;//每页显示的条数
	private int totalRows;//总记录数
	private int totalPage;//总页数
	private int prevPage;//上一页
	private int nextPage;//上一页
	private int startIndex;//索引起始页
	
	
	public PageUtil (String currentPage,int pageSize, int totalRows) {
		//设置当前当前页的值
		this.getCpage(currentPage);
		this.pageSize=pageSize;
		this.totalRows=totalRows;
		//设置总页数
		 this.getTPage();
		//设置上一页
		 this.getPpage();
		//设置下一页
		 this.getNpage();
		//设置索引的起始位置
		 this.getStarIndex();
		
	}
	//当前页
	public void getCpage(String currentPage) {
		if(currentPage == null || currentPage == "" || currentPage == "undefined") {
			this.currentPage=1;
		}else {
			this.currentPage=Integer.parseInt(currentPage);
		}
	}
	//总页数
	public void getTPage() {
		if(this.totalRows%this.pageSize !=0) {
			System.out.println("总页数1");
			this.totalPage = this.totalRows/this.pageSize+1;
		}else {
			System.out.println("总页数2");
			this.totalPage = this.totalRows/this.pageSize;
		}
	}
	//索引起始页
	public void getStarIndex() {
		this.startIndex=(this.currentPage-1)*this.pageSize;
	}
	//上一页
	public void getPpage() {
		if(this.currentPage == 1) {
			this.prevPage = 1;
		}else {
			this.prevPage=this.currentPage-1;
		}
	}
	//下一页
	 public void getNpage() {
		 if(this.currentPage == this.totalPage) {
			 this.nextPage = this.totalPage;
		 }else {
			 this.nextPage = this.currentPage+1;
		 }
	 }
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalRows() {
		return totalRows;
	}
	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getPrevPage() {
		return prevPage;
	}
	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	@Override
	public String toString() {
		return "PageUtil [currentPage=" + currentPage + ", pageSize=" + pageSize + ", totalRows=" + totalRows
				+ ", totalPage=" + totalPage + ", prevPage=" + prevPage + ", nextPage=" + nextPage + ", startIndex="
				+ startIndex + "]";
	}
}


