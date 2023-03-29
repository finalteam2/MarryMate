package com.marry.book.model;

import java.sql.*;

public class Hall_bookDTO {
	
	private int hallbk_idx;
	private int midx;
	private int hidx;
	private int cidx;
	private int fidx;
	private Date bk_date;
	private String bk_time;
	private String bk_state;
	private Date bookdate;
	
	public Hall_bookDTO() {
		super();
	}

	public Hall_bookDTO(int hallbk_idx, int midx, int hidx, int cidx, int fidx, Date bk_date, String bk_time,
			String bk_state, Date bookdate) {
		super();
		this.hallbk_idx = hallbk_idx;
		this.midx = midx;
		this.hidx = hidx;
		this.cidx = cidx;
		this.fidx = fidx;
		this.bk_date = bk_date;
		this.bk_time = bk_time;
		this.bk_state = bk_state;
		this.bookdate = bookdate;
	}

	public int getHallbk_idx() {
		return hallbk_idx;
	}

	public void setHallbk_idx(int hallbk_idx) {
		this.hallbk_idx = hallbk_idx;
	}

	public int getMidx() {
		return midx;
	}

	public void setMidx(int midx) {
		this.midx = midx;
	}

	public int getHidx() {
		return hidx;
	}

	public void setHidx(int hidx) {
		this.hidx = hidx;
	}

	public int getCidx() {
		return cidx;
	}

	public void setCidx(int cidx) {
		this.cidx = cidx;
	}

	public int getFidx() {
		return fidx;
	}

	public void setFidx(int fidx) {
		this.fidx = fidx;
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
