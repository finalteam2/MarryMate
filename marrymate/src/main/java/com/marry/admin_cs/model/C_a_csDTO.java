package com.marry.admin_cs.model;

import java.sql.Date;

public class C_a_csDTO {
	
	private int caidx;
	private int cidx;
	private int admin;
	private int type;
	private String content;
	private Date time;
	private int read;
	
	public C_a_csDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public C_a_csDTO(int caidx, int cidx, int admin, int type, String content, Date time, int read) {
		super();
		this.caidx = caidx;
		this.cidx = cidx;
		this.admin = admin;
		this.type = type;
		this.content = content;
		this.time = time;
		this.read = read;
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
	
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
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
	
	public int getRead() {
		return read;
	}
	public void setRead(int read) {
		this.read = read;
	}

}
