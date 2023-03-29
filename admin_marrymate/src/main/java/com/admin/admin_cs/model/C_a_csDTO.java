package com.admin.admin_cs.model;

import java.sql.Date;

public class C_a_csDTO {
	
	private int caidx;
	private int cidx;
	private int admin;
	private String content;
	private Date time;
	
	public C_a_csDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public C_a_csDTO(int caidx, int cidx, int admin, String content, Date time) {
		super();
		this.caidx = caidx;
		this.cidx = cidx;
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

	public int getCidx() {
		return cidx;
	}
	public void setCidx(int cidx) {
		this.cidx = cidx;
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
