package com.marry.calender.model;

import java.sql.Date;

public class ChecklistDTO {
	
	private int ch_idx;
	private int midx;
	private String title;
	private String dueday;
	private String content;
	private int onoff;
	private int checked;
	
	public ChecklistDTO() {
		super();
	}

	public ChecklistDTO(int ch_idx, int midx, String title, String dueday, String content, int onoff, int checked) {
		super();
		this.ch_idx = ch_idx;
		this.midx = midx;
		this.title = title;
		this.dueday = dueday;
		this.content = content;
		this.onoff = onoff;
		this.checked = checked;
	}

	public int getCh_idx() {
		return ch_idx;
	}

	public void setCh_idx(int ch_idx) {
		this.ch_idx = ch_idx;
	}

	public int getMidx() {
		return midx;
	}

	public void setMidx(int midx) {
		this.midx = midx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDueday() {
		return dueday;
	}

	public void setDueday(String dueday) {
		this.dueday = dueday;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getOnoff() {
		return onoff;
	}

	public void setOnoff(int onoff) {
		this.onoff = onoff;
	}

	public int getChecked() {
		return checked;
	}

	public void setChecked(int checked) {
		this.checked = checked;
	}
	
	
	
}
