package com.marry.book.model;

public class HallDTO {

	private int cidx;
	private int hidx;
	private int fidx;
	private String h_name;
	private int h_pay;
	private int guest_num;
	private String f_name;
	private int f_pay;
	private String bk_date;
	private String bk_time;
	private String kind;
	private int pay;
	private String img;
	private String name;
	
	public HallDTO() {
		super();
	}

	public HallDTO(int cidx, int hidx, int fidx, String h_name, int h_pay, int guest_num, String f_name, int f_pay,
			String bk_date, String bk_time, String kind, int pay, String img, String name) {
		super();
		this.cidx = cidx;
		this.hidx = hidx;
		this.fidx = fidx;
		this.h_name = h_name;
		this.h_pay = h_pay;
		this.guest_num = guest_num;
		this.f_name = f_name;
		this.f_pay = f_pay;
		this.bk_date = bk_date;
		this.bk_time = bk_time;
		this.kind = kind;
		this.pay = pay;
		this.img = img;
		this.name = name;
	}

	public int getCidx() {
		return cidx;
	}

	public void setCidx(int cidx) {
		this.cidx = cidx;
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

	public String getH_name() {
		return h_name;
	}

	public void setH_name(String h_name) {
		this.h_name = h_name;
	}

	public int getH_pay() {
		return h_pay;
	}

	public void setH_pay(int h_pay) {
		this.h_pay = h_pay;
	}

	public int getGuest_num() {
		return guest_num;
	}

	public void setGuest_num(int guest_num) {
		this.guest_num = guest_num;
	}

	public String getF_name() {
		return f_name;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}

	public int getF_pay() {
		return f_pay;
	}

	public void setF_pay(int f_pay) {
		this.f_pay = f_pay;
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

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
