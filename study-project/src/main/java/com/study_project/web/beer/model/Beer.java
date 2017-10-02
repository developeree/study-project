package com.study_project.web.beer.model;

public class Beer {
	private Integer idx;
	private String title;
	private String content;
	private String price;
	private String create_date;
	private String edit_date;
	private String area;
	private String tumbnail;
	private String ad;
	private Integer comment_count;
	private String company;
	
	private int currentNo;
	private int pageNo;
	private int totalBeer;
	private String keyfield;
	private String search;
	
	public int getCurrentNo() {
		return currentNo;
	}
	public void setCurrentNo(int currentNo) {
		this.currentNo = currentNo;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = (pageNo-1)*5;
	}
	public int getTotalBeer() {
		return totalBeer;
	}
	public void setTotalBeer(int totalBeer) {
		this.totalBeer = totalBeer;
	}
	public String getKeyfield() {
		return keyfield;
	}
	public void setKeyfield(String keyfield) {
		this.keyfield = keyfield;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	
	public Integer getIdx() {
		return idx;
	}
	public void setIdx(Integer idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public String getEdit_date() {
		return edit_date;
	}
	public void setEdit_date(String edit_date) {
		this.edit_date = edit_date;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getTumbnail() {
		return tumbnail;
	}
	public void setTumbnail(String tumbnail) {
		this.tumbnail = tumbnail;
	}
	public String getAd() {
		return ad;
	}
	public void setAd(String ad) {
		this.ad = ad;
	}
	public Integer getComment_count() {
		return comment_count;
	}
	public void setComment_count(Integer comment_count) {
		this.comment_count = comment_count;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	@Override
	public String toString() {
		return "Beer [idx=" + idx + ", title=" + title + ", content=" + content + ", price=" + price + ", create_date="
				+ create_date + ", edit_date=" + edit_date + ", area=" + area + ", tumbnail=" + tumbnail + ", ad=" + ad
				+ ", comment_count=" + comment_count + ", company=" + company + "]";
	}
	
}
