package com.marry.calender.model;

import java.sql.Date;

public class ComcalendarDTO {

	private int comcal_idx;
	private int cidx;
	private int combk_idx;
	private int hallbk_idx;
	private int ctype;
	private String cschedule;
	private Date cdate;
	
	public ComcalendarDTO() {
		super();
	}
	
	public ComcalendarDTO(int comcal_idx, int cidx, int combk_idx, int hallbk_idx, int ctype, String cschedule,
			Date cdate) {
		super();
		this.comcal_idx = comcal_idx;
		this.cidx = cidx;
		this.combk_idx = combk_idx;
		this.hallbk_idx = hallbk_idx;
		this.ctype = ctype;
		this.cschedule = cschedule;
		this.cdate = cdate;
	}
	public int getComcal_idx() {
		return comcal_idx;
	}
	public void setComcal_idx(int comcal_idx) {
		this.comcal_idx = comcal_idx;
	}
	public int getCidx() {
		return cidx;
	}
	public void setCidx(int cidx) {
		this.cidx = cidx;
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
	
}
