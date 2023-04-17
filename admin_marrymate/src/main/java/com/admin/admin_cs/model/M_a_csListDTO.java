package com.admin.admin_cs.model;

import java.sql.Date;

public class M_a_csListDTO {
	
	private int midx;
	private String img;
	private String name;
	private int rnum;
	private String content;
	private Date time;
	
	public M_a_csListDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public M_a_csListDTO(int midx, String img, String name, int rnum, String content, Date time) {
		super();
		this.midx = midx;
		this.img = img;
		this.name = name;
		this.rnum = rnum;
		this.content = content;
		this.time = time;
	}
	
	public int getMidx() {
		return midx;
	}

	public void setMidx(int midx) {
		this.midx = midx;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

}
