package com.marry.bbs.model;

public class BbsDTO {

	private int bidx;
	private int midx;
	private String kind;
	private String horse;
	private String subject;
	private String content;
	private String writedate;
	private String img;
	private int ref;
	private int stair;
	private int step;
	private int watch;
	private int blind;
	private int topfix;
	private int admin;
	
	public BbsDTO() {
		super();
	}

	public BbsDTO(int bidx, int midx, String kind, String horse, String subject, String content, String writedate,
			String img, int ref, int stair, int step, int watch, int blind, int topfix, int admin) {
		super();
		this.bidx = bidx;
		this.midx = midx;
		this.kind = kind;
		this.horse = horse;
		this.subject = subject;
		this.content = content;
		this.writedate = writedate;
		this.img = img;
		this.ref = ref;
		this.stair = stair;
		this.step = step;
		this.watch = watch;
		this.blind = blind;
		this.topfix = topfix;
		this.admin = admin;
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

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getHorse() {
		return horse;
	}

	public void setHorse(String horse) {
		this.horse = horse;
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

	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getStair() {
		return stair;
	}

	public void setStair(int stair) {
		this.stair = stair;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getWatch() {
		return watch;
	}

	public void setWatch(int watch) {
		this.watch = watch;
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

	public int getAdmin() {
		return admin;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}
	
}
