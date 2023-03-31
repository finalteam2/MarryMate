package com.admin.book.model;

import java.sql.*;

public class Com_bookDTO {
	
	private int combk_idx;
	private int midx;
	private int cidx;
	private Date bk_date;
	private String bk_time;
	private String bk_state;
	private Date bookdate;
	
	public Com_bookDTO() {
		super();
	}

	public Com_bookDTO(int combk_idx, int midx, int cidx, Date bk_date, String bk_time, String bk_state,
			Date bookdate) {
		super();
		this.combk_idx = combk_idx;
		this.midx = midx;
		this.cidx = cidx;
		this.bk_date = bk_date;
		this.bk_time = bk_time;
		this.bk_state = bk_state;
		this.bookdate = bookdate;
	}

	public int getCombk_idx() {
		return combk_idx;
	}

	public void setCombk_idx(int combk_idx) {
		this.combk_idx = combk_idx;
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

	public Date getBk_date() {
		return bk_date;
	}

	public void setBk_date(Date bk_date) {
		this.bk_date = bk_date;
	}

	public String getBk_time() {
		return bk_time;
	}

	public void setBk_time(String bk_time) {
		this.bk_time = bk_time;
	}

	public String getBk_state() {
		return bk_state;
	}

	public void setBk_state(String bk_state) {
		this.bk_state = bk_state;
	}

	public Date getBookdate() {
		return bookdate;
	}

	public void setBookdate(Date bookdate) {
		this.bookdate = bookdate;
	}
	
	
}
