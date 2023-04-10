package com.marry.book.model;

public class CartDTO {

	private String cidx;
	private String bk_date;
	private String bk_time;
	private String img;
	private String pay;
	private String cname;
	private String kind;
	
	public CartDTO() {
		super();
	}

	public CartDTO(String cidx, String bk_date, String bk_time, String img, String pay, String cname, String kind) {
		super();
		this.cidx = cidx;
		this.bk_date = bk_date;
		this.bk_time = bk_time;
		this.img = img;
		this.pay = pay;
		this.cname = cname;
		this.kind = kind;
	}

	public String getCidx() {
		return cidx;
	}

	public void setCidx(String cidx) {
		this.cidx = cidx;
	}

	public String getBk_date() {
		return bk_date;
	}

	public void setBk_date(String bk_date) {
		this.bk_date = bk_date;
	}

	public String getBk_time() {
		return bk_time;
	}

	public void setBk_time(String bk_time) {
		this.bk_time = bk_time;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}
	
	
}
