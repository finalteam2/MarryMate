package com.admin.company.model;

public class HallDTO {

	private int hidx;
	private int cidx;
	private String name;
	private String time;
	private int pay;
	private int guest_num;
	private int seat_num;
	
	public HallDTO() {
		super();
	}

	public HallDTO(int hidx, int cidx, String name, String time, int pay, int guest_num, int seat_num) {
		super();
		this.hidx = hidx;
		this.cidx = cidx;
		this.name = name;
		this.time = time;
		this.pay = pay;
		this.guest_num = guest_num;
		this.seat_num = seat_num;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
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

	public int getSeat_num() {
		return seat_num;
	}

	public void setSeat_num(int seat_num) {
		this.seat_num = seat_num;
	}
	
}
