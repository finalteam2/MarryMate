package com.marry.book.model;

import java.sql.*;

public class RefundDTO {

	private int refund_idx;
	private int pay_idx;
	private int rf_money;
	private Date rf_date;
	private int rf_point;
	
	public RefundDTO() {
		super();
	}

	public RefundDTO(int refund_idx, int pay_idx, int rf_money, Date rf_date, int rf_point) {
		super();
		this.refund_idx = refund_idx;
		this.pay_idx = pay_idx;
		this.rf_money = rf_money;
		this.rf_date = rf_date;
		this.rf_point = rf_point;
	}

	public int getRefund_idx() {
		return refund_idx;
	}

	public void setRefund_idx(int refund_idx) {
		this.refund_idx = refund_idx;
	}

	public int getPay_idx() {
		return pay_idx;
	}

	public void setPay_idx(int pay_idx) {
		this.pay_idx = pay_idx;
	}

	public int getRf_money() {
		return rf_money;
	}

	public void setRf_money(int rf_money) {
		this.rf_money = rf_money;
	}

	public Date getRf_date() {
		return rf_date;
	}

	public void setRf_date(Date rf_date) {
		this.rf_date = rf_date;
	}

	public int getRf_point() {
		return rf_point;
	}

	public void setRf_point(int rf_point) {
		this.rf_point = rf_point;
	}
	
	
}
