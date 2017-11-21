package com.study_project.web.beer.model;

public class Comment {
	//댓글
	private Integer comment_idx;
	private String comment_content;
	private String comment_create_date;
	private String comment_edit_date;
	private Integer beer_id;
	private Integer user_id;
	
	public Integer getComment_idx() {
		return comment_idx;
	}
	public void setComment_idx(Integer comment_idx) {
		this.comment_idx = comment_idx;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getComment_create_date() {
		return comment_create_date;
	}
	public void setComment_create_date(String comment_create_date) {
		this.comment_create_date = comment_create_date;
	}
	public String getComment_edit_date() {
		return comment_edit_date;
	}
	public void setComment_edit_date(String comment_edit_date) {
		this.comment_edit_date = comment_edit_date;
	}
	public Integer getBeer_id() {
		return beer_id;
	}
	public void setBeer_id(Integer beer_id) {
		this.beer_id = beer_id;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	@Override
	public String toString() {
		return "Comment [comment_idx=" + comment_idx + ", comment_content=" + comment_content + ", comment_create_date="
				+ comment_create_date + ", comment_edit_date=" + comment_edit_date + ", beer_id=" + beer_id
				+ ", user_id=" + user_id + "]";
	}
	
	
}
