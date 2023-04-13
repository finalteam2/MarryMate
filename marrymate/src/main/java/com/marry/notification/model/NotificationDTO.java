package com.marry.notification.model;

import java.sql.Date;

public class NotificationDTO {
	
	////////////////////여기 보십시오!!!!!!!//////////////////////////
	
	//rev는 일반회원, 기업회원, 전체 3가지로 스트링으로 입력
	//page는 경로
	//nkind는 1~3은 예약알림, 지출&잔금알림, 글관련알림, 7은 관리자
	//nkind 1: 예약알림(예약시-기업,승인시-회원,취소시-기업/회원)
	//nkind 2: 지출&잔금알림(이용일14일전-회원,잔금결제시-기업)
	//nkind 3: 글관련알림(커뮤니티-댓글달림-회원,문의-기업/회원)
	//nkind 7: 관리자(불량글등록/철회-회원,관리자직접)
	
	private int nidx;
	private int cidx;
	private int midx;
	private String recv;
	private String page;
	private String title;
	private String content;
	private int nkind;
	private Date activedate;
	private Date sentdate;
	private int checked;
	
	public NotificationDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NotificationDTO(int nidx, int cidx, int midx, String recv, String page, String title, String content,
			int nkind, Date activedate, Date sentdate, int checked) {
		super();
		this.nidx = nidx;
		this.cidx = cidx;
		this.midx = midx;
		this.recv = recv;
		this.page = page;
		this.title = title;
		this.content = content;
		this.nkind = nkind;
		this.activedate = activedate;
		this.sentdate = sentdate;
		this.checked = checked;
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

	public int getNkind() {
		return nkind;
	}

	public void setNkind(int nkind) {
		this.nkind = nkind;
	}

	public Date getActivedate() {
		return activedate;
	}

	public void setActivedate(Date activedate) {
		this.activedate = activedate;
	}

	public Date getSentdate() {
		return sentdate;
	}

	public void setSentdate(Date sentdate) {
		this.sentdate = sentdate;
	}

	public int getChecked() {
		return checked;
	}

	public void setChecked(int checked) {
		this.checked = checked;
	}
	
}
