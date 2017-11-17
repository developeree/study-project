package com.study_project.web.soju.model;

public class SojuComment {
	private Integer idx;
	private String contents;
	private String id;
	private String created_date;
	private String eidt_date;
	private Integer soju_idx;
	
	//getter
	public Integer getIdx() 			{return idx;}
	public String getContents() 		{return contents;}
	public String getId() 				{return id;}
	public String getCreated_date() 	{return created_date;}
	public String getEidt_date() 		{return eidt_date;}
	public Integer getSoju_idx() 		{return soju_idx;}
	
	//setter
	public void setIdx(Integer idx) 					{this.idx = idx;}
	public void setContents(String contents) 			{this.contents = contents;}
	public void setId(String id) 						{this.id = id;}
	public void setCreated_date(String created_date) 	{this.created_date = created_date;}
	public void setEidt_date(String eidt_date) 			{this.eidt_date = eidt_date;}
	public void setSoju_idx(Integer soju_idx) 			{this.soju_idx = soju_idx;}
	
	@Override
	public String toString() {
		return "SojuComment [idx=" + idx + ", contents=" + contents + ", id=" + id + ", created_date=" + created_date
				+ ", eidt_date=" + eidt_date + ", soju_idx=" + soju_idx + "]";
	}
	
	
	
	
	
	
	
}
