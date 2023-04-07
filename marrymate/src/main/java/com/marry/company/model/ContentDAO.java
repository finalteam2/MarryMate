package com.marry.company.model;

import java.util.List;

import com.marry.book.model.BookDTO;
import com.marry.book.model.BookListDTO;

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
	public int insertCom_cs(Com_CsDTO dto);
	public List<Com_CsDTO> selectComCs(int cidx);
	public List<Com_CsDTO> selectMemCs(int midx);
	public List<Com_CsDTO> answeredCs(int cidx);
	public int updateComCs(Com_CsDTO dto);
	public List<BookListDTO> selectComBook(int cidx);
	public List<BookListDTO> selectMemBook(int midx);
}
