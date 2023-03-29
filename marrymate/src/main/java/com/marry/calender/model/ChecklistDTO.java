package com.marry.calender.model;

import java.sql.Date;

public class ChecklistDTO {
	
	private int ch_idx;
	private int midx;
	private int chtype;
	private String cschedule;
	private String chchedule;
	private Date chdate;
	private int dday;
	private String onoff;
	private int checked;
	
	public ChecklistDTO() {
		super();
	}

	public ChecklistDTO(int ch_idx, int midx, int chtype, String cschedule, String chchedule, Date chdate, int dday,
			String onoff, int checked) {
		super();
		this.ch_idx = ch_idx;
		this.midx = midx;
		this.chtype = chtype;
		this.cschedule = cschedule;
		this.chchedule = chchedule;
		this.chdate = chdate;
		this.dday = dday;
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

	public int getChtype() {
		return chtype;
	}

	public void setChtype(int chtype) {
		this.chtype = chtype;
	}

	public String getCschedule() {
		return cschedule;
	}

	public void setCschedule(String cschedule) {
		this.cschedule = cschedule;
	}

	public String getChchedule() {
		return chchedule;
	}

	public void setChchedule(String chchedule) {
		this.chchedule = chchedule;
	}

	public Date getChdate() {
		return chdate;
	}

	public void setChdate(Date chdate) {
		this.chdate = chdate;
	}

	public int getDday() {
		return dday;
	}

	public void setDday(int dday) {
		this.dday = dday;
	}

	public String getOnoff() {
		return onoff;
	}

	public void setOnoff(String onoff) {
		this.onoff = onoff;
	}

	public int getChecked() {
		return checked;
	}

	public void setChecked(int checked) {
		this.checked = checked;
	}
	
	
}
