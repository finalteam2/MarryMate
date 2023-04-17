package com.marry.book.model;

public class BookpayDTO {
	private String midx;
	private String cidx;
	private String bk_date;
	private String bk_time;
	private String usePoint;
	private String finalPrice;
	private String hidx;
	private String fidx;	
	
	public String getHidx() {
		return hidx;
	}

	public void setHidx(String hidx) {
		this.hidx = hidx;
	}

	public String getFidx() {
		return fidx;
	}

	public void setFidx(String fidx) {
		this.fidx = fidx;
	}
	
	
	public BookpayDTO(String midx, String cidx, String bk_date, String bk_time, String usePoint, String finalPrice,
			String hidx, String fidx) {
		super();
		this.midx = midx;
		this.cidx = cidx;
		this.bk_date = bk_date;
		this.bk_time = bk_time;
		this.usePoint = usePoint;
		this.finalPrice = finalPrice;
		this.hidx = hidx;
		this.fidx = fidx;
	}

	public BookpayDTO() {
		super();
	}

	public BookpayDTO(String midx, String cidx, String bk_date, String bk_time, String usePoint, String finalPrice) {
		super();
		this.midx = midx;
		this.cidx = cidx;
		this.bk_date = bk_date;
		this.bk_time = bk_time;
		this.usePoint = usePoint;
		this.finalPrice = finalPrice;
	}

	public String getMidx() {
		return midx;
	}

	public void setMidx(String midx) {
		this.midx = midx;
	}

	public String getCidx() {
		return cidx;
	}

	public void setCidx(String cidx) {
		this.cidx = cidx;
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

	public String getUsePoint() {
		return usePoint;
	}

	public void setUsePoint(String usePoint) {
		this.usePoint = usePoint;
	}

	public String getFinalPrice() {
		return finalPrice;
	}

	public void setFinalPrice(String finalPrice) {
		this.finalPrice = finalPrice;
	}

	
	
}
