package com.admin.book.model;

import java.sql.Date;

public class BookDetailsDTO {
	
	private int bk_idx;
	private int midx;
	private String name;
	private int cidx;
	private String cname;
	private Date bookdate;
	private String kind;
	private String hname;
	private int pay;
	private int guest_num;
	private int fpay;
	private int total_money;
	private int money1;
	private int money2;
	private int bk_state;
	private String bk_date_time;
	
	public BookDetailsDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BookDetailsDTO(int bk_idx, int midx, String name, int cidx, String cname, Date bookdate, String kind,
			String hname, int pay, int guest_num, int fpay, int total_money, int money1, int money2, int bk_state, String bk_date_time) {
		super();
		this.bk_idx = bk_idx;
		this.midx = midx;
		this.name = name;
		this.cidx = cidx;
		this.cname = cname;
		this.bookdate = bookdate;
		this.kind = kind;
		this.hname = hname;
		this.pay = pay;
		this.guest_num = guest_num;
		this.fpay = fpay;
		this.total_money = total_money;
		this.money1 = money1;
		this.money2 = money2;
		this.bk_state = bk_state;
		this.bk_date_time = bk_date_time;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCidx() {
		return cidx;
	}

	public void setCidx(int cidx) {
		this.cidx = cidx;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public Date getBookdate() {
		return bookdate;
	}

	public void setBookdate(Date bookdate) {
		this.bookdate = bookdate;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getHname() {
		return hname;
	}

	public void setHname(String hname) {
		this.hname = hname;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public int getGuest_num() {
		return guest_num;
	}

	public void setGuest_num(int guest_num) {
		this.guest_num = guest_num;
	}

	public int getFpay() {
		return fpay;
	}

	public void setFpay(int fpay) {
		this.fpay = fpay;
	}

	public int getTotal_money() {
		return total_money;
	}

	public void setTotal_money(int total_money) {
		this.total_money = total_money;
	}
	
	public int getMoney1() {
		return money1;
	}

	public void setMoney1(int money1) {
		this.money1 = money1;
	}
	
	public int getMoney2() {
		return money2;
	}

	public void setMoney2(int money2) {
		this.money2 = money2;
	}

	public int getBk_state() {
		return bk_state;
	}

	public void setBk_state(int bk_state) {
		this.bk_state = bk_state;
	}

	public String getBk_date_time() {
		return bk_date_time;
	}

	public void setBk_date_time(String bk_date_time) {
		this.bk_date_time = bk_date_time;
	}

}