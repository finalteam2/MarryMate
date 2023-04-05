package com.marry.company.model;

import java.sql.Date;

public class Com_CsDTO {
	private int ccsidx;
	private int cidx;
	private int midx;
	private String subject;
	private String content;
	private Date csdate;
	private String answer;
	private Date ansdate;
	private int is_private;
	
	
	public Com_CsDTO() {
		super();
	}


	public Com_CsDTO(int ccsidx, int cidx, int midx, String subject, String content, Date csdate, String answer,
			Date ansdate, int is_private) {
		super();
		this.ccsidx = ccsidx;
		this.cidx = cidx;
		this.midx = midx;
		this.subject = subject;
		this.content = content;
		this.csdate = csdate;
		this.answer = answer;
		this.ansdate = ansdate;
		this.is_private = is_private;
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


	public String getAnswer() {
		return answer;
	}


	public void setAnswer(String answer) {
		this.answer = answer;
	}


	public Date getAnsdate() {
		return ansdate;
	}


	public void setAnsdate(Date ansdate) {
		this.ansdate = ansdate;
	}


	public int getIs_private() {
		return is_private;
	}


	public void setIs_private(int is_private) {
		this.is_private = is_private;
	}
	
}
