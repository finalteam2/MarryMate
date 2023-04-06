package com.admin.admin_cs.model;

import java.sql.Date;

public class C_a_csListDTO {
	
	private int cidx;
	private String img;
	private String cname;
	private String content;
	private Date time;
	
	public C_a_csListDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public C_a_csListDTO(int cidx, String img, String cname, String content, Date time) {
		super();
		this.cidx = cidx;
		this.img = img;
		this.cname = cname;
		this.content = content;
		this.time = time;
	}
	
	public int getCidx() {
		return cidx;
	}

	public void setCidx(int cidx) {
		this.cidx = cidx;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
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
