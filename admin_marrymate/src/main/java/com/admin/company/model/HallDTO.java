package com.admin.company.model;

public class HallDTO {

	private int hidx;
	private int cidx;
	private String name;
	private String worktime;
	
	public HallDTO() {
		super();
	}

	public HallDTO(int hidx, int cidx, String name, String worktime) {
		super();
		this.hidx = hidx;
		this.cidx = cidx;
		this.name = name;
		this.worktime = worktime;
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

	public String getWorktime() {
		return worktime;
	}

	public void setWorktime(String worktime) {
		this.worktime = worktime;
	}
	
}
