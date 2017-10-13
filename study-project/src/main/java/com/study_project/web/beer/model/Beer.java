package com.study_project.web.beer.model;

public class Beer {
	private Integer idx;
	private String title;
	private String content;
	private String price;
	private String create_date;
	private String edit_date;
	private String area;
	private String thumbnail;
	private String ad;
	private Integer comment_count;
	private String company;
	
	//페이징,검색
	private int currentNo;
	private int pageNo;
	private int totalBeer;
	private String keyfield;
	private String search;
	
	//파일
	private Integer file_idx;
	private String original_name;
	private String trans_name;
	private String file_size;
	private String file_path;
	private String beer_id;
	private String content_type;
	private String soju_idx;
	
//	public static Beer createMediaFile(Beer beer1, String original_name
//			) {
//		Beer beer = new Beer();
//		beer.setOriginal_name(original_name);
//        return beer;
//    }
//	public static Beer createMediaFile(Beer beer1
//			) {
//		Beer beer = new Beer();
//        return beer;
//    }

	public Integer getFile_idx() {
		return file_idx;
	}
	public void setFile_idx(Integer file_idx) {
		this.file_idx = file_idx;
	}
	public String getOriginal_name() {
		return original_name;
	}
	public void setOriginal_name(String original_name) {
		this.original_name = original_name;
	}
	public String getTrans_name() {
		return trans_name;
	}
	public void setTrans_name(String trans_name) {
		this.trans_name = trans_name;
	}
	public String getFile_size() {
		return file_size;
	}
	public void setFile_size(String file_size) {
		this.file_size = file_size;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public String getBeer_id() {
		return beer_id;
	}
	public void setBeer_id(String beer_id) {
		this.beer_id = beer_id;
	}
	public String getContent_type() {
		return content_type;
	}
	public void setContent_type(String content_type) {
		this.content_type = content_type;
	}
	public String getSoju_idx() {
		return soju_idx;
	}
	public void setSoju_idx(String soju_idx) {
		this.soju_idx = soju_idx;
	}
	
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
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
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
				+ create_date + ", edit_date=" + edit_date + ", area=" + area + ", thumbnail=" + thumbnail + ", ad=" + ad
				+ ", comment_count=" + comment_count + ", company=" + company + ", currentNo=" + currentNo + ", pageNo="
				+ pageNo + ", totalBeer=" + totalBeer + ", keyfield=" + keyfield + ", search=" + search + ", file_idx="
				+ file_idx + ", original_name=" + original_name + ", trans_name=" + trans_name + ", file_size="
				+ file_size + ", file_path=" + file_path + ", beer_id=" + beer_id + ", content_type=" + content_type
				+ ", soju_idx=" + soju_idx + "]";
	}
	
}
