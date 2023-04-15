package com.admin.book.model;

public class BookListDTO {
	
	private int bk_idx;
	private int midx;
	private String name;
	private String cname;
	private String bookdate;
	private String bk_date_time;
	private int total_money;
	private int bk_state;
	private int is_after;
	private String kind;
	
	public BookListDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BookListDTO(int bk_idx, int midx, String name,String cname, String bookdate, String bk_date_time,
			int total_money, int bk_state, int is_after, String kind) {
		super();
		this.bk_idx = bk_idx;
		this.midx = midx;
		this.name = name;
		this.cname = cname;
		this.bookdate = bookdate;
		this.bk_date_time = bk_date_time;
		this.total_money = total_money;
		this.bk_state = bk_state;
		this.is_after = is_after;
		this.kind = kind;
	}

	public int getBk_idx() {
		return bk_idx;
	}

	public void setBk_idx(int bk_idx) {
		this.bk_idx = bk_idx;
	}

	public int getMidx() {
		return midx;
	}

	public void setMidx(int midx) {
		this.midx = midx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getBookdate() {
		return bookdate;
	}

	public void setBookdate(String bookdate) {
		this.bookdate = bookdate;
	}

	public String getBk_date_time() {
		return bk_date_time;
	}

	public void setBk_date_time(String bk_date_time) {
		this.bk_date_time = bk_date_time;
	}

	public int getTotal_money() {
		return total_money;
	}

	public void setTotal_money(int total_money) {
		this.total_money = total_money;
	}

	public int getBk_state() {
		return bk_state;
	}

	public void setBk_state(int bk_state) {
		this.bk_state = bk_state;
	}
	
	public int getIs_after() {
		return is_after;
	}

	public void setIs_after(int is_after) {
		this.is_after = is_after;
	}
	
	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

}
