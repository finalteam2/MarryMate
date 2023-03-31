package com.admin.point.model;

import java.sql.*;

public class PointDTO {

	private int p_idx;
	private int midx;
	private int pay_idx;
	private int refund_idx;
	private int p_cal;
	private Date p_date;
	private int p_total;
	private String p_type;
	
	public PointDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PointDTO(int p_idx, int midx, int pay_idx, int refund_idx, int p_cal, Date p_date, int p_total,
			String p_type) {
		super();
		this.p_idx = p_idx;
		this.midx = midx;
		this.pay_idx = pay_idx;
		this.refund_idx = refund_idx;
		this.p_cal = p_cal;
		this.p_date = p_date;
		this.p_total = p_total;
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

	public int getPay_idx() {
		return pay_idx;
	}

	public void setPay_idx(int pay_idx) {
		this.pay_idx = pay_idx;
	}

	public int getRefund_idx() {
		return refund_idx;
	}

	public void setRefund_idx(int refund_idx) {
		this.refund_idx = refund_idx;
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

