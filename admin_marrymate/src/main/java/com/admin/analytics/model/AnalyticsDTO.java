package com.admin.analytics.model;

public class AnalyticsDTO {
	
	private int anidx;
	private int pay_idx;
	private int p_idx;
	
	public AnalyticsDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public AnalyticsDTO(int anidx, int pay_idx, int p_idx) {
		super();
		this.anidx = anidx;
		this.pay_idx = pay_idx;
		this.p_idx = p_idx;
	}
	
	public int getAnidx() {
		return anidx;
	}
	public void setAnidx(int anidx) {
		this.anidx = anidx;
	}
	
	public int getPay_idx() {
		return pay_idx;
	}
	public void setPay_idx(int pay_idx) {
		this.pay_idx = pay_idx;
	}
	
	public int getP_idx() {
		return p_idx;
	}
	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}

}
