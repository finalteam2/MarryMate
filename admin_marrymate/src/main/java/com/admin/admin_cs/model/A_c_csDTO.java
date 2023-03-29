package com.admin.admin_cs.model;

import java.sql.Date;

public class A_c_csDTO {
	
	private int caidx;
	private int admin;
	private int cidx;
	private String content;
	private Date time;
	
	public A_c_csDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public A_c_csDTO(int caidx, int admin, int cidx, String content, Date time) {
		super();
		this.caidx = caidx;
		this.admin = admin;
		this.cidx = cidx;
		this.content = content;
		this.time = time;
	}

	public int getCaidx() {
		return caidx;
	}
	public void setCaidx(int caidx) {
		this.caidx = caidx;
	}

	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	
	public int getCidx() {
		return cidx;
	}
	public void setCidx(int cidx) {
		this.cidx = cidx;
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
