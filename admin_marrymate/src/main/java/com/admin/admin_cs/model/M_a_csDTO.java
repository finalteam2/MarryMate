package com.admin.admin_cs.model;

import java.sql.Date;

public class M_a_csDTO {
	
	private int caidx;
	private int midx;
	private int admin;
	private String content;
	private Date time;
	
	public M_a_csDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public M_a_csDTO(int caidx, int midx, int admin, String content, Date time) {
		super();
		this.caidx = caidx;
		this.midx = midx;
		this.admin = admin;
		this.content = content;
		this.time = time;
	}

	public int getCaidx() {
		return caidx;
	}
	public void setCaidx(int caidx) {
		this.caidx = caidx;
	}

	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}

	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
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

