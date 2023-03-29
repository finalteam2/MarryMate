package com.marry.point.model;

import java.sql.*;

public class PointDTO {

	private int p_idx;
	private int midx;
	private int p_cal;
	private Date p_date;
	private int p_total;
	private String p_type;
	
	public PointDTO() {
		super();
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

	public int getP_cal() {
		return p_cal;
	}

	public void setP_cal(int p_cal) {
		this.p_cal = p_cal;
	}

	public Date getP_date() {
		return p_date;
	}

	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}

	public int getP_total() {
		return p_total;
	}

	public void setP_total(int p_total) {
		this.p_total = p_total;
	}

	public String getP_type() {
		return p_type;
	}

	public void setP_type(String p_type) {
		this.p_type = p_type;
	}
	
}

