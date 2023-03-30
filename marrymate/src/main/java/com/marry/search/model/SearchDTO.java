package com.marry.search.model;

public class SearchDTO {

	private String sido;
	private String sigungu;
	private int payMin;
	private int payMax;
	private int guestMin;
	private int guestMax;
	private String name;
	private String sort;
	private int view;
	
	@Override
	public String toString() {
		System.out.println("==SearchDTO==");
		System.out.println("sido : " + sido);
		System.out.println("sigungu : " + sigungu);
		System.out.println("payMin : " + payMin);
		System.out.println("payMax : " + payMax);
		System.out.println("guestMin : " + guestMin);
		System.out.println("guestMax : " + guestMax);
		System.out.println("name : " + name);
		System.out.println("sort : " + sort);
		System.out.println("view : " + view);
		System.out.println("==/SearchDTO==");
		return super.toString();
	}
	
	public SearchDTO() {
		super();
	}

	public SearchDTO(String sido, String sigungu, int payMin, int payMax, int guestMin, int guestMax,
			String name, String sort, int view) {
		super();
		this.sido = sido;
		this.sigungu = sigungu;
		this.payMin = payMin;
		this.payMax = payMax;
		this.guestMin = guestMin;
		this.guestMax = guestMax;
		this.name = name;
		this.sort = sort;
		this.view = view;
	}

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	public String getSigungu() {
		return sigungu;
	}

	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}

	public int getPayMin() {
		return payMin;
	}

	public void setPayMin(int payMin) {
		this.payMin = payMin;
	}

	public int getPayMax() {
		return payMax;
	}

	public void setPayMax(int payMax) {
		this.payMax = payMax;
	}

	public int getGuestMin() {
		return guestMin;
	}

	public void setGuestMin(int guestMin) {
		this.guestMin = guestMin;
	}

	public int getGuestMax() {
		return guestMax;
	}

	public void setGuestMax(int guestMax) {
		this.guestMax = guestMax;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}
	
}
