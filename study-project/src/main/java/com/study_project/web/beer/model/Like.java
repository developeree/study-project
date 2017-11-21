package com.study_project.web.beer.model;

public class Like {
	private Integer like_idx;
	private Integer like_status;
	private Integer beer_id;
	private Integer user_id;
	public Integer getLike_idx() {
		return like_idx;
	}
	public void setLike_idx(Integer like_idx) {
		this.like_idx = like_idx;
	}
	public Integer getLike_status() {
		return like_status;
	}
	public void setLike_status(Integer like_status) {
		this.like_status = like_status;
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
		return "Like [like_idx=" + like_idx + ", like_status=" + like_status + ", beer_id=" + beer_id + ", user_id="
				+ user_id + "]";
	}
	
}
