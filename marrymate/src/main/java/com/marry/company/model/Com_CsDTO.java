package com.marry.company.model;

import java.sql.Date;

public class Com_CsDTO {
	private int ccsidx;
	private int cidx;
	private int midx;
	private int type;
	private String subject;
	private String content;
	private Date csdate;
	public Com_CsDTO() {
		super();
	}
	public Com_CsDTO(int ccsidx, int cidx, int midx, int type, String subject, String content, Date csdate) {
		super();
		this.ccsidx = ccsidx;
		this.cidx = cidx;
		this.midx = midx;
		this.type = type;
		this.subject = subject;
		this.content = content;
		this.csdate = csdate;
	}
	public int getCcsidx() {
		return ccsidx;
	}
	public void setCcsidx(int ccsidx) {
		this.ccsidx = ccsidx;
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
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCsdate() {
		return csdate;
	}
	public void setCsdate(Date csdate) {
		this.csdate = csdate;
	}
	
	
}
