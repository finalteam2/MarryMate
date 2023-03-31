package com.marry.book.model;

import java.sql.*;

public class BookDTO {

	private int bk_idx;
	private int midx;
	private int hidx;
	private int cidx;
	private int fidx;
	private Date bk_date;
	private String bk_time;
	private int bk_state;
	private Date bookdate;
	private int hall_nothall;
	
	public BookDTO() {
		super();
	}

	public BookDTO(int bk_idx, int midx, int hidx, int cidx, int fidx, Date bk_date, String bk_time, int bk_state,
			Date bookdate, int hall_nothall) {
		super();
		this.bk_idx = bk_idx;
		this.midx = midx;
		this.hidx = hidx;
		this.cidx = cidx;
		this.fidx = fidx;
		this.bk_date = bk_date;
		this.bk_time = bk_time;
		this.bk_state = bk_state;
		this.bookdate = bookdate;
		this.hall_nothall = hall_nothall;
	}

	public int getBk_idx() {
		return bk_idx;
	}

	public void setBk_idx(int bk_idx) {
		this.bk_idx = bk_idx;
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

	public int getBk_state() {
		return bk_state;
	}

	public void setBk_state(int bk_state) {
		this.bk_state = bk_state;
	}

	public Date getBookdate() {
		return bookdate;
	}

	public void setBookdate(Date bookdate) {
		this.bookdate = bookdate;
	}

	public int getHall_nothall() {
		return hall_nothall;
	}

	public void setHall_nothall(int hall_nothall) {
		this.hall_nothall = hall_nothall;
	}
	
	
}
