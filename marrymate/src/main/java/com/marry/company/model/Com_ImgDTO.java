package com.marry.company.model;

public class Com_ImgDTO {
	private int iidx;
	private int cidx;
	private int type;
	private String img;
	public Com_ImgDTO() {
		super();
	}
	public Com_ImgDTO(int iidx, int cidx, int type, String img) {
		super();
		this.iidx = iidx;
		this.cidx = cidx;
		this.type = type;
		this.img = img;
	}
	public int getIidx() {
		return iidx;
	}
	public void setIidx(int iidx) {
		this.iidx = iidx;
	}
	public int getCidx() {
		return cidx;
	}
	public void setCidx(int cidx) {
		this.cidx = cidx;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	
}
