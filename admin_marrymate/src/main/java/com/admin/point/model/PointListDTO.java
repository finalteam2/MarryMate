package com.admin.point.model;

import java.sql.Date;

public class PointListDTO {
	
	private int p_idx;
	private int midx;
	private String name;
	private String cname;
	private Date p_date;
	private int p_cal;
	private String p_type;
	
	public PointListDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PointListDTO(int p_idx, int midx, String name, String cname, Date p_date, int p_cal, String p_type) {
		super();
		this.p_idx = p_idx;
		this.midx = midx;
		this.name = name;
		this.cname = cname;
		this.p_date = p_date;
		this.p_cal = p_cal;
		this.p_type = p_type;
	}

	public int getP_idx() {
		return p_idx;
	}
	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
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

	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}

	public Date getP_date() {
		return p_date;
	}
	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}

	public int getP_cal() {
		return p_cal;
	}
	public void setP_cal(int p_cal) {
		this.p_cal = p_cal;
	}

	public String getP_type() {
		return p_type;
	}
	public void setP_type(String p_type) {
		this.p_type = p_type;
	}

}
