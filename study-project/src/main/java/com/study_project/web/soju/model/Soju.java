package com.study_project.web.soju.model;

public class Soju {
	//soju
	private Integer idx;
	private String title;
	private String content;
	private String price;
	private String create_date;
	private String edit_date;
	private String area;
	private String thumbnail;
	private String ad;
	private String comment_count;
	private String company;
	
	//soju_file
	private Integer file_idx;
	private String original_name;
	private String trans_name;
	private String file_path;
	private Long file_size;
	private Integer soju_idx;
	private String content_type;
	

	//getter soju
	public Integer getIdx() 			{return idx;}
	public String getTitle() 			{return title;}
	public String getContent() 			{return content;}
	public String getPrice() 			{return price;}
	public String getCreate_date() 		{return create_date;}
	public String getEdit_date() 		{return edit_date;}
	public String getArea() 			{return area;}
	public String getThumbnail() 		{return thumbnail;}
	public String getAd() 				{return ad;}
	public String getComment_count() 	{return comment_count;}
	public String getCompany() 			{return company;}
	
	//getter soju_file
	public Integer getFile_idx() 		{return file_idx;}
	public String getOriginal_name() 	{return original_name;}
	public String getTrans_name() 		{return trans_name;}
	public String getFile_path() 		{return file_path;}
	public Long getFile_size() 			{return file_size;}
	public Integer getSoju_idx() 		{return soju_idx;}
	public String getContent_type() 	{return content_type;}
	
	//setter soju
	public void setIdx(Integer idx) 					{this.idx = idx;}
	public void setTitle(String title) 					{this.title = title;}
	public void setContent(String content) 				{this.content = content;}
	public void setPrice(String price) 					{this.price = price;}
	public void setCreate_date(String create_date) 		{this.create_date = create_date;}
	public void setEdit_date(String edit_date) 			{this.edit_date = edit_date;}
	public void setArea(String area) 					{this.area = area;}
	public void setThumbnail(String thumbnail) 			{this.thumbnail = thumbnail;}
	public void setAd(String ad) 						{this.ad = ad;}
	public void setCompany(String company) 				{this.company = company;}
	public void setComment_count(String comment_count) 	{this.comment_count = comment_count;}
	
	//setter soju_file
	public void setFile_idx(Integer file_idx) {this.file_idx = file_idx;}
	public void setOriginal_name(String original_name) {this.original_name = original_name;}
	public void setTrans_name(String trans_name) {this.trans_name = trans_name;}
	public void setFile_path(String file_path) {this.file_path = file_path;}
	public void setFile_size(Long file_size) {this.file_size = file_size;}
	public void setSoju_idx(Integer soju_idx) {this.soju_idx = soju_idx;}
	public void setContent_type(String content_type) {this.content_type = content_type;}
	
}
