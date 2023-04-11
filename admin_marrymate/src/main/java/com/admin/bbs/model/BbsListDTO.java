package com.admin.bbs.model;

import java.sql.Date;

public class BbsListDTO {
	
	private String kind;
	private int bidx;
	private String subject;
	private String nick;
	private Date writedate;
	private int blind;
	private int topfix;
	
	public BbsListDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BbsListDTO(String kind, int bidx, String subject, String nick, Date writedate, int blind, int topfix) {
		super();
		this.kind = kind;
		this.bidx = bidx;
		this.subject = subject;
		this.nick = nick;
		this.writedate = writedate;
		this.blind = blind;
		this.topfix = topfix;
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
	
	public int getBlind() {
		return blind;
	}
	public void setBlind(int blind) {
		this.blind = blind;
	}
	
	public int getTopfix() {
		return topfix;
	}
	public void setTopfix(int topfix) {
		this.topfix = topfix;
	}

}
