package com.marry.bbs.model;

public class RecommandDTO {

	private int re_idx;
	private int bidx;
	private int midx;
	private int updown;
	
	public RecommandDTO() {
		super();
	}

	public RecommandDTO(int re_idx, int bidx, int midx, int updown) {
		super();
		this.re_idx = re_idx;
		this.bidx = bidx;
		this.midx = midx;
		this.updown = updown;
	}

	public int getRe_idx() {
		return re_idx;
	}

	public void setRe_idx(int re_idx) {
		this.re_idx = re_idx;
	}

	public int getBidx() {
		return bidx;
	}

	public void setBidx(int bidx) {
		this.bidx = bidx;
	}

	public int getMidx() {
		return midx;
	}

	public void setMidx(int midx) {
		this.midx = midx;
	}

	public int getUpdown() {
		return updown;
	}

	public void setUpdown(int updown) {
		this.updown = updown;
	}
	
}
