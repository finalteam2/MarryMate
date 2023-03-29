package com.marry.company.model;

public class Book_TimeDTO {

	private int bktime_idx;
	private int cidx;
	private String yoil;
	private String worktime;
	
	public Book_TimeDTO() {
		super();
	}

	public Book_TimeDTO(int bktime_idx, int cidx, String yoil, String worktime) {
		super();
		this.bktime_idx = bktime_idx;
		this.cidx = cidx;
		this.yoil = yoil;
		this.worktime = worktime;
	}

	public int getBktime_idx() {
		return bktime_idx;
	}

	public void setBktime_idx(int bktime_idx) {
		this.bktime_idx = bktime_idx;
	}

	public int getCidx() {
		return cidx;
	}

	public void setCidx(int cidx) {
		this.cidx = cidx;
	}

	public String getYoil() {
		return yoil;
	}

	public void setYoil(String yoil) {
		this.yoil = yoil;
	}

	public String getWorktime() {
		return worktime;
	}

	public void setWorktime(String worktime) {
		this.worktime = worktime;
	}
	
}
