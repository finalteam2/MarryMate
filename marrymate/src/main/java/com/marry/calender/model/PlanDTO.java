package com.marry.calender.model;

import java.sql.Date;

public class PlanDTO {

	private int myp_idx;
	private int midx;
	private int cidx;
	private String pdate;
	private String title;
	private String content;
	
	public PlanDTO() {
		super();
	}

	public PlanDTO(int myp_idx, int midx, int cidx, String pdate, String title, String content) {
		super();
		this.myp_idx = myp_idx;
		this.midx = midx;
		this.cidx = cidx;
		this.pdate = pdate;
		this.title = title;
		this.content = content;
	}

	public int getMyp_idx() {
		return myp_idx;
	}

	public void setMyp_idx(int myp_idx) {
		this.myp_idx = myp_idx;
	}

	public int getMidx() {
		return midx;
	}

	public void setMidx(int midx) {
		this.midx = midx;
	}

	public int getCidx() {
		return cidx;
	}

	public void setCidx(int cidx) {
		this.cidx = cidx;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
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
	
	
}
