package com.marry.like.model;

public class LikeDTO {
	private int lidx;
	private int midx;
	private int cidx;
	public LikeDTO() {
		super();
	}
	public LikeDTO(int lidx, int midx, int cidx) {
		super();
		this.lidx = lidx;
		this.midx = midx;
		this.cidx = cidx;
	}
	public int getLidx() {
		return lidx;
	}
	public void setLidx(int lidx) {
		this.lidx = lidx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public int getCidx() {
		return cidx;
	}
	public void setCidx(int cidx) {
		this.cidx = cidx;
	}
	
}
