package com.admin.bbs.model;

import java.sql.Date;

public class BbsListDTO {
	
	private int bidx;
	private String subject;
	private String nick;
	private Date writedate;
	
	public BbsListDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BbsListDTO(int bidx, String subject, String nick, Date writedate) {
		super();
		this.bidx = bidx;
		this.subject = subject;
		this.nick = nick;
		this.writedate = writedate;
	}

	public int getBidx() {
		return bidx;
	}
	public void setBidx(int bidx) {
		this.bidx = bidx;
	}

	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}

	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}

}
