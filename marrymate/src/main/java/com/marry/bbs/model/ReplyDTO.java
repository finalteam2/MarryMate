package com.marry.bbs.model;

import java.sql.Date;

public class ReplyDTO {

	private int ridx;
	private int bidx;
	private String nick;
	private String id;
	private String content;
	private String writedate;
	
	public ReplyDTO() {
		super();
	}

	public ReplyDTO(int ridx, int bidx, String nick, String id, String content, String writedate) {
		super();
		this.ridx = ridx;
		this.bidx = bidx;
		this.nick = nick;
		this.id = id;
		this.content = content;
		this.writedate = writedate;
	}

	public int getRidx() {
		return ridx;
	}

	public void setRidx(int ridx) {
		this.ridx = ridx;
	}

	public int getBidx() {
		return bidx;
	}

	public void setBidx(int bidx) {
		this.bidx = bidx;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	
}
