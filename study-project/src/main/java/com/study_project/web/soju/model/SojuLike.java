package com.study_project.web.soju.model;

public class SojuLike {
	private Integer idx;
	private Integer soju_idx;
	private Integer user_idx;
	private String user_id;
	private Integer status;
	
	//getter
	public Integer getIdx() {return idx;}
	public Integer getSoju_idx() {return soju_idx;}
	public Integer getUser_idx() {return user_idx;}
	public String getUser_id() {return user_id;}
	public Integer getStatus() {return status;}
	
	//setter
	public void setIdx(Integer idx) {this.idx = idx;}
	public void setSoju_idx(Integer soju_idx) {this.soju_idx = soju_idx;}
	public void setUser_idx(Integer user_idx) {this.user_idx = user_idx;}
	public void setUser_id(String user_id) {this.user_id = user_id;}
	public void setStatus(Integer status) {this.status = status;}
	
	@Override
	public String toString() {
		return "SojuLick [idx=" + idx + ", soju_idx=" + soju_idx + ", user_idx=" + user_idx + ", user_id=" + user_id
				+ ", status=" + status + "]";
	}
}
