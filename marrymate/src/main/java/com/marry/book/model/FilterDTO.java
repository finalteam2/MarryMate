package com.marry.book.model;

public class FilterDTO {

	private String filterText;
	private String filterDate;
	private String filterSido;
	private int filterPriceMin;
	private int filterPriceMax;
	private String filterOrder;
	private String filterCate;
	
	public FilterDTO() {
		super();
	}
	
	public FilterDTO(String filterOrder, String filterCate) {
		super();
		this.filterOrder = filterOrder;
		this.filterCate = filterCate;
	}

	public FilterDTO(String filterText, String filterDate, String filterSido, int filterPriceMin, int filterPriceMax,
			String filterCate) {
		super();
		this.filterText = filterText;
		this.filterDate = filterDate;
		this.filterSido = filterSido;
		this.filterPriceMin = filterPriceMin;
		this.filterPriceMax = filterPriceMax;
		this.filterCate = filterCate;
	}

	public FilterDTO(String filterText, String filterDate, String filterSido, int filterPriceMin, int filterPriceMax,
			String filterOrder, String filterCate) {
		super();
		this.filterText = filterText;
		this.filterDate = filterDate;
		this.filterSido = filterSido;
		this.filterPriceMin = filterPriceMin;
		this.filterPriceMax = filterPriceMax;
		this.filterOrder = filterOrder;
		this.filterCate = filterCate;
	}

	public String getFilterText() {
		return filterText;
	}

	public void setFilterText(String filterText) {
		this.filterText = filterText;
	}

	public String getFilterDate() {
		return filterDate;
	}

	public void setFilterDate(String filterDate) {
		this.filterDate = filterDate;
	}

	public String getFilterSido() {
		return filterSido;
	}

	public void setFilterSido(String filterSido) {
		this.filterSido = filterSido;
	}

	public int getFilterPriceMin() {
		return filterPriceMin;
	}

	public void setFilterPriceMin(int filterPriceMin) {
		this.filterPriceMin = filterPriceMin;
	}

	public int getFilterPriceMax() {
		return filterPriceMax;
	}

	public void setFilterPriceMax(int filterPriceMax) {
		this.filterPriceMax = filterPriceMax;
	}

	public String getFilterOrder() {
		return filterOrder;
	}

	public void setFilterOrder(String filterOrder) {
		this.filterOrder = filterOrder;
	}

	public String getFilterCate() {
		return filterCate;
	}

	public void setFilterCate(String filterCate) {
		this.filterCate = filterCate;
	}
	
	
}
