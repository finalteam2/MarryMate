package com.marry.search.model;

public class SearchDTO {

	private String sido;
	private String sigungu;
	private int[] hallType;
	private int foodMin;
	private int foodMax;
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
		System.out.print("hallType : ");
		if(hallType!=null && hallType.length != 0) {
			for(int i = 0; i < hallType.length; i++) {
				System.out.print(hallType[i]);
			}
		}
		System.out.println();
		System.out.println("foodMin : " + foodMin);
		System.out.println("foodMax : " + foodMax);
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

	public SearchDTO(String sido, String sigungu, int[] hallType, int foodMin, int foodMax, int guestMin, int guestMax,
			String name, String sort, int view) {
		super();
		this.sido = sido;
		this.sigungu = sigungu;
		this.hallType = hallType;
		this.foodMin = foodMin;
		this.foodMax = foodMax;
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

	public int[] getHallType() {
		return hallType;
	}

	public void setHallType(int[] hallType) {
		this.hallType = hallType;
	}

	public int getFoodMin() {
		return foodMin;
	}

	public void setFoodMin(int foodMin) {
		this.foodMin = foodMin;
	}

	public int getFoodMax() {
		return foodMax;
	}

	public void setFoodMax(int foodMax) {
		this.foodMax = foodMax;
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
