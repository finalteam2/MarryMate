package com.marry.company.model;

import java.sql.Date;

public class ReviewDTO {

	private int ridx;
	private int cidx;
	private int midx;
	private String content;
	private int  star;
	private Date redate;
	public ReviewDTO() {
		super();
	}
	public ReviewDTO(int ridx, int cidx, int midx, String content, int star, Date redate) {
		super();
		this.ridx = ridx;
		this.cidx = cidx;
		this.midx = midx;
		this.content = content;
		this.star = star;
		this.redate = redate;
	}
	public int getRidx() {
		return ridx;
	}
	public void setRidx(int ridx) {
		this.ridx = ridx;
	}
	public int getCidx() {
		return cidx;
	}
	public void setCidx(int cidx) {
		this.cidx = cidx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public Date getRedate() {
		return redate;
	}
	public void setRedate(Date redate) {
		this.redate = redate;
	}
	
	
}
