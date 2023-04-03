package com.marry.company.model;

import java.util.List;

public interface CompanyDAO {

	public int coJoin(CompanyDTO dto);
	public int selectCidx(String id);
	public int timeInsert(Book_TimeDTO dto);
	public CompanyDTO companySelectOne(int cidx);
	public List<HallDTO> selectHall(int cidx); 
	public List<FoodDTO> selectFood(int cidx); 
	public List<Com_ImgDTO> selectCom_Img(int cidx);

}
