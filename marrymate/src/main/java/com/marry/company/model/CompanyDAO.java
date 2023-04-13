package com.marry.company.model;

public interface CompanyDAO {

	public int coJoin(CompanyDTO dto);
	
	public CompanyDTO companyLogin(String id, String pwd);
	
	public int clevelCheck(String id, String pwd);
	
	public int timeInsert(Book_TimeDTO dto);
	
	public int foodInsert(FoodDTO dto);
	
	public int hallInsert(HallDTO dto);
	
	public int imgInsert(String cidx, String img);
	
	public int comIdCheck(String id);
	
	public int getCidx(String id);

}
