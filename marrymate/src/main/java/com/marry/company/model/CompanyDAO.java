package com.marry.company.model;

import java.util.List;

public interface CompanyDAO {

	public int coJoin(CompanyDTO dto);
	
	public int selectCidx(String id);
	
	public int timeInsert(Book_TimeDTO dto);
	
	public int foodInsert(FoodDTO dto);
	
	public int hallInsert(HallDTO dto);
	
	public int imgInsert(String cidx, String img);

}
