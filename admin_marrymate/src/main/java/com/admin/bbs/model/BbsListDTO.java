package com.admin.bbs.model;

import java.sql.Date;

public class BbsListDTO {
	
	private String kind;
	private int bidx;
	private String subject;
	private String nick;
	private Date writedate;
	
	public BbsListDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BbsListDTO(String kind, int bidx, String subject, String nick, Date writedate) {
		super();
		this.kind = kind;
		this.bidx = bidx;
		this.subject = subject;
		this.nick = nick;
		this.writedate = writedate;
	}
	
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
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
