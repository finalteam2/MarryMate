package com.marry.calender.model;

import java.sql.Date;

public class CalendarDTO {

	private int cal_idx;
	private int midx;
	private int combk_idx;
	private int hallbk_idx;
	private int ctype;
	private String cschedule;
	private Date cdate;
	private String icon;
	
	public CalendarDTO() {
		super();
	}

	public CalendarDTO(int cal_idx, int midx, int combk_idx, int hallbk_idx, int ctype, String cschedule, Date cdate,
			String icon) {
		super();
		this.cal_idx = cal_idx;
		this.midx = midx;
		this.combk_idx = combk_idx;
		this.hallbk_idx = hallbk_idx;
		this.ctype = ctype;
		this.cschedule = cschedule;
		this.cdate = cdate;
		this.icon = icon;
	}

	public int getCal_idx() {
		return cal_idx;
	}

	public void setCal_idx(int cal_idx) {
		this.cal_idx = cal_idx;
	}

	public int getMidx() {
		return midx;
	}

	public void setMidx(int midx) {
		this.midx = midx;
	}

	public int getCombk_idx() {
		return combk_idx;
	}

	public void setCombk_idx(int combk_idx) {
		this.combk_idx = combk_idx;
	}

	public int getHallbk_idx() {
		return hallbk_idx;
	}

	public void setHallbk_idx(int hallbk_idx) {
		this.hallbk_idx = hallbk_idx;
	}

	public int getCtype() {
		return ctype;
	}

	public void setCtype(int ctype) {
		this.ctype = ctype;
	}

	public String getCschedule() {
		return cschedule;
	}

	public void setCschedule(String cschedule) {
		this.cschedule = cschedule;
	}

	public Date getCdate() {
		return cdate;
	}

	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}
	
	
}
