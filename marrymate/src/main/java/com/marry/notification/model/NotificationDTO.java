package com.marry.notification.model;

import java.sql.Date;

public class NotificationDTO {
	
	private int nidx;
	private int cidx;
	private int midx;
	private String recv;
	private String page;
	private String title;
	private String content;
	private String nkind;
	private Date sentdate;
	private int status;
	private int checked;
	private int activedate;
	
	public NotificationDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NotificationDTO() {
		super();
	}

	public NotificationDTO(int nidx, int cidx, int midx, String recv, String page, String title, String content,
			String nkind, Date sentdate, int status, int checked, int activedate) {
		super();
		this.nidx = nidx;
		this.cidx = cidx;
		this.midx = midx;
		this.recv = recv;
		this.page = page;
		this.title = title;
		this.content = content;
		this.nkind = nkind;
		this.sentdate = sentdate;
		this.status = status;
		this.checked = checked;
		this.activedate = activedate;
	}

	public int getNidx() {
		return nidx;
	}

	public void setNidx(int nidx) {
		this.nidx = nidx;
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

	public String getRecv() {
		return recv;
	}

	public void setRecv(String recv) {
		this.recv = recv;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getNkind() {
		return nkind;
	}

	public void setNkind(String nkind) {
		this.nkind = nkind;
	}

	public Date getSentdate() {
		return sentdate;
	}

	public void setSentdate(Date sentdate) {
		this.sentdate = sentdate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getChecked() {
		return checked;
	}

	public void setChecked(int checked) {
		this.checked = checked;
	}

	public int getActivedate() {
		return activedate;
	}

	public void setActivedate(int activedate) {
		this.activedate = activedate;
	}

	
}
