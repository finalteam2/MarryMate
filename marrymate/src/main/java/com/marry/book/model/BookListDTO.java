package com.marry.book.model;

import java.sql.Date;

public class BookListDTO {

	private int bk_idx;
	private int midx;
	private int cidx;
	private int hidx;
	private int fidx;
	private String cname;
	private String mname;
	private String hname;
	private String fname;
	private String ckind;
	private Date bk_date;
	private String bk_time;
	private Date booktime;
	private int cpay;
	private int hpay;
	private int fpay;
	private int hnum;
	private int allpay;
	private int bk_state;
	private int is_after;
	
	public BookListDTO() {
		super();
	}
	


	public BookListDTO(int bk_idx, int midx, int cidx, int hidx, int fidx, String cname, String mname, String hname,
			String fname, String ckind, Date bk_date, String bk_time, Date booktime, int cpay, int hpay, int fpay,
			int hnum, int allpay, int bk_state, int is_after) {
		super();
		this.bk_idx = bk_idx;
		this.midx = midx;
		this.cidx = cidx;
		this.hidx = hidx;
		this.fidx = fidx;
		this.cname = cname;
		this.mname = mname;
		this.hname = hname;
		this.fname = fname;
		this.ckind = ckind;
		this.bk_date = bk_date;
		this.bk_time = bk_time;
		this.booktime = booktime;
		this.cpay = cpay;
		this.hpay = hpay;
		this.fpay = fpay;
		this.hnum = hnum;
		this.allpay = allpay;
		this.bk_state = bk_state;
		this.is_after = is_after;
	}


	
	public int getHidx() {
		return hidx;
	}



	public void setHidx(int hidx) {
		this.hidx = hidx;
	}



	public int getFidx() {
		return fidx;
	}



	public void setFidx(int fidx) {
		this.fidx = fidx;
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


	public int getIs_after() {
		return is_after;
	}






	public void setIs_after(int is_after) {
		this.is_after = is_after;
	}






	public Date getBooktime() {
		return booktime;
	}



	public void setBooktime(Date booktime) {
		this.booktime = booktime;
	}



	public String getMname() {
		return mname;
	}


	public void setMname(String mname) {
		this.mname = mname;
	}


	public String getHname() {
		return hname;
	}


	public void setHname(String hname) {
		this.hname = hname;
	}


	public String getFname() {
		return fname;
	}


	public void setFname(String fname) {
		this.fname = fname;
	}


	public int getBk_idx() {
		return bk_idx;
	}

	public void setBk_idx(int bk_idx) {
		this.bk_idx = bk_idx;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCkind() {
		return ckind;
	}

	public void setCkind(String ckind) {
		this.ckind = ckind;
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

	public int getCpay() {
		return cpay;
	}

	public void setCpay(int cpay) {
		this.cpay = cpay;
	}

	public int getHpay() {
		return hpay;
	}

	public void setHpay(int hpay) {
		this.hpay = hpay;
	}

	public int getFpay() {
		return fpay;
	}

	public void setFpay(int fpay) {
		this.fpay = fpay;
	}

	public int getHnum() {
		return hnum;
	}

	public void setHnum(int hnum) {
		this.hnum = hnum;
	}

	public int getAllpay() {
		return allpay;
	}

	public void setAllpay(int allpay) {
		this.allpay = allpay;
	}

	public int getBk_state() {
		return bk_state;
	}

	public void setBk_state(int bk_state) {
		this.bk_state = bk_state;
	}

	
	
}
