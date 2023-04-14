package com.marry.bbs.model;

public class ReplyViewDTO {

	private int ridx;
	private int bidx;
	private int midx;
	private String nick;
	private String id;
	private String content;
	private String writedate;
	private String subject;
	private String img;
	
	public ReplyViewDTO() {
		super();
	}

	public ReplyViewDTO(int ridx, int bidx, int midx, String nick, String id, String content, String writedate,
			String subject, String img) {
		super();
		this.ridx = ridx;
		this.bidx = bidx;
		this.midx = midx;
		this.nick = nick;
		this.id = id;
		this.content = content;
		this.writedate = writedate;
		this.subject = subject;
		this.img = img;
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

	public int getMidx() {
		return midx;
	}

	public void setMidx(int midx) {
		this.midx = midx;
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

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
}
