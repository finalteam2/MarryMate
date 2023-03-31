package com.admin.book.model;

import java.sql.*;

public class PaymentDTO {

	private int pay_idx;
	private int hallbk_idx;
	private int combk_idx;
	private int midx;
	private String pay_kind;
	private Date pay_date;
	private String pay_type;
	private int pay_point;
	private int pay_money;
	
	public PaymentDTO() {
		super();
	}

	public PaymentDTO(int pay_idx, int hallbk_idx, int combk_idx, int midx, String pay_kind, Date pay_date,
			String pay_type, int pay_point, int pay_money) {
		super();
		this.pay_idx = pay_idx;
		this.hallbk_idx = hallbk_idx;
		this.combk_idx = combk_idx;
		this.midx = midx;
		this.pay_kind = pay_kind;
		this.pay_date = pay_date;
		this.pay_type = pay_type;
		this.pay_point = pay_point;
		this.pay_money = pay_money;
	}

	public int getPay_idx() {
		return pay_idx;
	}

	public void setPay_idx(int pay_idx) {
		this.pay_idx = pay_idx;
	}

	public int getHallbk_idx() {
		return hallbk_idx;
	}

	public void setHallbk_idx(int hallbk_idx) {
		this.hallbk_idx = hallbk_idx;
	}

	public int getCombk_idx() {
		return combk_idx;
	}

	public void setCombk_idx(int combk_idx) {
		this.combk_idx = combk_idx;
	}

	public int getMidx() {
		return midx;
	}

	public void setMidx(int midx) {
		this.midx = midx;
	}

	public String getPay_kind() {
		return pay_kind;
	}

	public void setPay_kind(String pay_kind) {
		this.pay_kind = pay_kind;
	}

	public Date getPay_date() {
		return pay_date;
	}

	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}

	public String getPay_type() {
		return pay_type;
	}

	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}

	public int getPay_point() {
		return pay_point;
	}

	public void setPay_point(int pay_point) {
		this.pay_point = pay_point;
	}

	public int getPay_money() {
		return pay_money;
	}

	public void setPay_money(int pay_money) {
		this.pay_money = pay_money;
	}
	
	
}
