package com.marry.company.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class CompanyDAOImple implements CompanyDAO {

	private SqlSessionTemplate sqlMap;
	
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	
	@Override
	public int coJoin(CompanyDTO dto) {
		
		int count=sqlMap.insert("companyJoin", dto);
		return count;
		
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
		List<FoodDTO> arr = sqlMap.selectList("selectHall", cidx);
		return arr;
	}
	
	@Override
	public List<Com_ImgDTO> selectCom_Img(int cidx) {
		List<Com_ImgDTO> arr = sqlMap.selectList("selectCom_Img", cidx);
		return arr;
	}
	
}
