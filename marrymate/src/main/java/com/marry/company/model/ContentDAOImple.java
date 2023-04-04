package com.marry.company.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class ContentDAOImple implements ContentDAO {

	private SqlSessionTemplate sqlMap;
	
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	
	@Override
	public CompanyDTO companySelectOne(int cidx) {
		CompanyDTO dto = sqlMap.selectOne("companySelectOne", cidx);
		return dto;
	}
	
	@Override
	public List<HallDTO> selectHall(int cidx) {
		List<HallDTO> arr = sqlMap.selectList("selectHall", cidx);
		return arr;
	}
	
	@Override
	public List<FoodDTO> selectFood(int cidx) {
		List<FoodDTO> arr = sqlMap.selectList("selectFood", cidx);
		return arr;
	}
	
	@Override
	public List<Com_ImgDTO> selectCom_Img(int cidx) {
		List<Com_ImgDTO> arr = sqlMap.selectList("selectImg", cidx);
		return arr;
	}

	@Override
	public int insertReview(ReviewDTO dto) {
		int result = sqlMap.insert("insertReview", dto);
		return result;
	}
	
	@Override
	public List<ReviewDTO> selectReview(int cidx) {
		List<ReviewDTO> arr = sqlMap.selectList("selectReview", cidx);
		return arr;
	}
	
	@Override
	public Com_LikeDTO selectCom_Like(Com_LikeDTO dto) {
		Com_LikeDTO result = sqlMap.selectOne("selectLike", dto);
		return result;
	}

	@Override
	public int insertCom_Like(Com_LikeDTO dto) {
		int result = sqlMap.insert("insertLike", dto);
		return result;
	}
	
	@Override
	public int deleteCom_Like(Com_LikeDTO dto) {
		int result = sqlMap.delete("deleteLike", dto);
		return result;
	}
	
	
}
