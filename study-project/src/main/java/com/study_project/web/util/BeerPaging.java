package com.study_project.web.util;

public class BeerPaging {
	private Integer totalBeer; //비어총데이터수
	private Integer pageSize=5; // 한페이지에 데이터 5개씩 출력
	private Integer pageNo; //현재페이지번호
//	private String prevPage; //이전페이지 5개씩 건너뜀
//	private String nextPage; //다음페이지 5개씩 건너뜀
//	private String startPage; //처음페이지
//	private String endPage; //마지막페이지
	public Integer getTotalBeer() {
		return totalBeer;
	}
	public void setTotalBeer(Integer totalBeer) {
		this.totalBeer = totalBeer;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = (pageNo-1)*5;
	}

}
