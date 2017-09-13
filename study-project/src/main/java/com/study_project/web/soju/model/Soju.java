package com.study_project.web.soju.model;

public class Soju {
	private Integer idx;
	private String title;
	private String content;
	private String price;
	private String create_date;
	private String edit_date;
	private String area;
	private String thumbnail;
	private String ad;
	private String commentcount;
	private String company;
	
	@Override
	public String toString() {
		return "Soju [idx=" + idx + ", title=" + title + ", content=" + content
				+ ", price=" + price + ", create_date=" + create_date
				+ ", edit_date=" + edit_date + ", area=" + area
				+ ", thumbnail=" + thumbnail + ", ad=" + ad + ", commentcount="
				+ commentcount + ", company=" + company + "]";
	}

	//getter
	public Integer getIdx() 		{return idx;}
	public String getTitle() 		{return title;}
	public String getContent() 		{return content;}
	public String getPrice() 		{return price;}
	public String getCreate_date() 	{return create_date;}
	public String getEdit_date() 	{return edit_date;}
	public String getArea() 		{return area;}
	public String getThumbnail() 	{return thumbnail;}
	public String getAd() 			{return ad;}
	public String getCommentcount() {return commentcount;}
	public String getCompany() 		{return company;}

	//setter
	public void setIdx(Integer idx) 					{this.idx = idx;}
	public void setTitle(String title) 					{this.title = title;}
	public void setContent(String content) 				{this.content = content;}
	public void setPrice(String price) 					{this.price = price;}
	public void setCreate_date(String create_date) 		{this.create_date = create_date;}
	public void setEdit_date(String edit_date) 			{this.edit_date = edit_date;}
	public void setArea(String area) 					{this.area = area;}
	public void setThumbnail(String thumbnail) 			{this.thumbnail = thumbnail;}
	public void setAd(String ad) 						{this.ad = ad;}
	public void setCommentcount(String commentcount) 	{this.commentcount = commentcount;}
	public void setCompany(String company) 				{this.company = company;}
	
}
