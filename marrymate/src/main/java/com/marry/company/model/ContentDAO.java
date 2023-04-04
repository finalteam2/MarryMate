package com.marry.company.model;

import java.util.List;

public interface ContentDAO {
	
	public CompanyDTO companySelectOne(int cidx);
	public List<HallDTO> selectHall(int cidx); 
	public List<FoodDTO> selectFood(int cidx); 
	public List<Com_ImgDTO> selectCom_Img(int cidx);
	public int insertReview(ReviewDTO dto);
	public List<ReviewDTO> selectReview(int cidx);
	public Com_LikeDTO selectCom_Like(Com_LikeDTO dto);
	public int insertCom_Like(Com_LikeDTO dto);
	public int deleteCom_Like(Com_LikeDTO dto);
}
