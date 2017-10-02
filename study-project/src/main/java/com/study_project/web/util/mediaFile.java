package com.study_project.web.util;

public class mediaFile {

	private Integer idx;
	private String original_name;
	private String trans_name;
	private String file_size;
	private String file_path;
	private String beer_id;
	private String content_type;
	private String soju_idx;
	public mediaFile(){
		
	}
	public Integer getIdx() {
		return idx;
	}
	public void setIdx(Integer idx) {
		this.idx = idx;
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
	@Override
	public String toString() {
		return "mediaFile [idx=" + idx + ", original_name=" + original_name + ", trans_name=" + trans_name
				+ ", file_size=" + file_size + ", file_path=" + file_path + ", beer_id=" + beer_id + ", content_type="
				+ content_type + ", soju_idx=" + soju_idx + "]";
	}
	
}
