package com.admin.company.model;

public class FoodDTO {

	private int fidx;
	private int cidx;
	private int type;
	private String name;
	private int pay;
	
	public FoodDTO() {
		super();
	}

	public FoodDTO(int fidx, int cidx, int type, String name, int pay) {
		super();
		this.fidx = fidx;
		this.cidx = cidx;
		this.type = type;
		this.name = name;
		this.pay = pay;
	}

	public int getFidx() {
		return fidx;
	}

	public void setFidx(int fidx) {
		this.fidx = fidx;
	}

	public int getCidx() {
		return cidx;
	}

	public void setCidx(int cidx) {
		this.cidx = cidx;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}
	
}
